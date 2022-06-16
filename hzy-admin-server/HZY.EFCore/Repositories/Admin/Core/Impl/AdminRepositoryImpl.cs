using System;
using System.Collections.Generic;
using System.Data;
using System.Linq.Expressions;

using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;

using HzyEFCoreRepositories.Extensions;
using HzyEFCoreRepositories.Repositories.Impl;

using HzyScanDiService;

using HZY.EFCore.DbContexts;
using HZY.EFCore.PagingViews;
using HZY.Infrastructure;
using HZY.Models.BO;
using HZY.Models.Entities.Framework;
using HZY.EFCore.Repositories.Admin.Core;

namespace HZY.EFCore.Repositories.Admin.Core.Impl;

/// <summary>
/// Admin默认基础仓储接口
/// </summary>
/// <typeparam name="T"></typeparam>
public class AdminRepositoryImpl<T> : AppRepositoryImpl<T, AdminDbContext>, IAdminRepository<T> where T : class, new()
{

    public AdminRepositoryImpl(AdminDbContext context, Expression<Func<T, bool>> filter = null) : base(context, filter)
    {

    }

    /// <summary>
    /// 查询转换为分页视图模型
    /// </summary>
    /// <param name="query"></param>
    /// <param name="page"></param>
    /// <param name="size"></param>
    /// <param name="columnHeads"></param>
    /// <typeparam name="TModel"></typeparam>
    /// <returns></returns>
    public virtual async Task<PagingView> AsPagingViewAsync<TModel>(IQueryable<TModel> query, int page, int size, List<TableColumnView> columnHeads = default)
    {
        var pagingView = new PagingView { Page = page, Size = size };

        //如果分页码 小于 0 则代表导出 否则代表分页查询
        if (page > 0)
        {
            pagingView.Total = await query.CountAsync();
            pagingView.PageCount = pagingView.Total / size;
            query = query.Page(page, size);
        }

        var data = await query.ToListAsync();

        var propertyInfos = typeof(TModel).GetProperties();
        var fieldNames = propertyInfos.Select(item => item.Name).ToList();

        pagingView.InitColumns(fieldNames, columnHeads, typeof(T));
        //
        pagingView.CreateDataSource(data, fieldNames);

        return pagingView;
    }

    /// <summary>
    /// 查询转换为分页视图模型 支持 Sql 字符串
    /// </summary>
    /// <param name="sql"></param>
    /// <param name="page"></param>
    /// <param name="size"></param>
    /// <param name="orderBy"></param>
    /// <param name="columnHeads"></param>
    /// <param name="parameters"></param>
    /// <returns></returns>
    public virtual async Task<PagingView> AsPagingViewAsync(string sql, int page, int size, string orderBy = "1", List<TableColumnView> columnHeads = default, params object[] parameters)
    {
        var pagingView = new PagingView { Page = page, Size = size };

        //如果分页码 小于 0 则代表导出 否则代表分页查询
        var sqlString = sql;
        if (page > 0)
        {
            pagingView.Total = await QuerySingleBySqlAsync<long>($"SELECT COUNT(1) FROM ({sql}) TAB", parameters);
            pagingView.PageCount = pagingView.Total / size;
            var offSet = size * (page - 1);
            sqlString = string.Empty;

            if (GetDbContext<AdminDbContext>().Database.IsSqlServer())
            {
                sqlString = $"SELECT * FROM ({sql}) TAB ORDER BY {orderBy} OFFSET {offSet} ROWS FETCH NEXT {size} ROWS ONLY";
            }
            else if (GetDbContext<AdminDbContext>().Database.IsMySql() || GetDbContext<AdminDbContext>().Database.IsNpgsql())
            {
                sqlString = $"SELECT * FROM ({sql}) TAB ORDER BY {orderBy} LIMIT {size} OFFSET {offSet}";
            }
            else
            {
                throw new Exception("查询数据库类型不支持!");
            }
        }

        var data = await QueryDataTableBySqlAsync(sqlString, parameters);
        var fieldNames = (from DataColumn dc in data.Columns select dc.ColumnName).ToList();

        pagingView.InitColumns(fieldNames, columnHeads, typeof(T));
        //
        pagingView.CreateDataSource(data, fieldNames);

        return pagingView;
    }

    /// <summary>
    /// 获取数据权限
    /// </summary>
    /// <param name="accountInfo"></param>
    /// <returns></returns>
    protected virtual (bool Self, List<int> OrganizationList) GetDataAuthority(AccountInfo accountInfo)
    {
        var organizationList = new List<int>();
        var self = false;

        using var serviceScope = IOCUtil.CreateScope();
        var _sysDataAuthorityRepository = serviceScope.ServiceProvider.GetRequiredService<IAdminRepository<SysDataAuthority>>();
        var _sysDataAuthorityCustomRepository = serviceScope.ServiceProvider.GetRequiredService<IAdminRepository<SysDataAuthorityCustom>>();
        var _sysOrganizationRepository = serviceScope.ServiceProvider.GetRequiredService<IAdminRepository<SysOrganization>>();

        //获取当前用户角色 配置的数据权限类型
        var sysDataAuthorityList = _sysDataAuthorityRepository.Select
        .Where(w => accountInfo.SysRoles.Select(s => s.Id).Contains(w.RoleId))
        .ToList()
        ;

        foreach (var item in sysDataAuthorityList)
        {
            // 获取所有
            if (item.PermissionType == SysDataAuthorityPermissionTypeEnum.All)
            {
                continue;
            }

            // 自定义权限
            if (item.PermissionType == SysDataAuthorityPermissionTypeEnum.Custom)
            {
                var customList = _sysDataAuthorityCustomRepository.Select
                .Where(w => w.SysDataAuthorityId == item.Id)
                .ToList();
                organizationList.AddRange(customList.Select(w => w.SysOrganizationId));
            }

            // 仅看本人组织
            if (item.PermissionType == SysDataAuthorityPermissionTypeEnum.Organization)
            {
                organizationList.Add(accountInfo.OrganizationId.ToInt32());
            }

            // 仅看本人组织和下属组织
            if (item.PermissionType == SysDataAuthorityPermissionTypeEnum.OrganizationOrBranch)
            {
                // 本人组织
                organizationList.Add(accountInfo.OrganizationId.ToInt32());

                // 下属组织
                var branchList = _sysOrganizationRepository.Select
                .Where(w => w.LevelCode.StartsWith(accountInfo.SysOrganization.LevelCode + "."))
                .Select(w => w.Id)
                .ToList();
                organizationList.AddRange(branchList);
            }

            // 仅看当前本人
            if (item.PermissionType == SysDataAuthorityPermissionTypeEnum.Self)
            {
                self = true;
            }
        }

        return (self, organizationList);
    }

    /// <summary>
    /// 根据数据权限查询 获取 IQueryable 对象
    /// </summary>
    /// <param name="accountInfo">当前用户账户信息</param>
    /// <param name="userIdFieldNameExpression">用户id字段 默认：UserId</param>
    /// <param name="organizationIdFieldNameExpression">组织id字段 默认：OrganizationId</param>
    /// <returns></returns>
    public virtual IQueryable<T> QueryByDataAuthority(AccountInfo accountInfo, Expression<Func<T, object>> userIdFieldNameExpression = null, Expression<Func<T, object>> organizationIdFieldNameExpression = null)
    {
        var query = Query();

        if (accountInfo.IsAdministrator)
        {
            return query;
        }

        var modelType = typeof(T);
        var modelFileds = modelType.GetPropertyInfos().ToList();
        string userIdFieldName = "UserId";
        string organizationIdFieldName = "OrganizationId";

        if (userIdFieldNameExpression != null)
        {
            userIdFieldName = Tools.GetNameByExpression(userIdFieldNameExpression);
        }

        if (organizationIdFieldNameExpression != null)
        {
            organizationIdFieldName = Tools.GetNameByExpression(organizationIdFieldNameExpression);
        }

        if (!modelFileds.Any(w => w.Name == userIdFieldName) && !modelFileds.Any(w => w.Name == organizationIdFieldName))
        {
            throw new Exception($"在模型【{modelType.Name}】中未找到 {userIdFieldName} 或者 {organizationIdFieldName} 字段名称! 请检查设置好对应字段!");
        }

        var data = GetDataAuthority(accountInfo);

        // 仅看自己处理
        if (data.Self && modelFileds.Any(w => w.Name == userIdFieldName))
        {
            var where = ExpressionTreeExtensions.Equal<T, Guid>(userIdFieldName, accountInfo.Id);
            query = query.Where(where);
        }

        // 组织处理
        if (data.OrganizationList.Count > 0 && modelFileds.Any(w => w.Name == organizationIdFieldName))
        {
            var where = ExpressionTreeExtensions.Contains<T, int>(organizationIdFieldName, data.OrganizationList);
            query = query.Where(where);
        }

        return query;
    }

}