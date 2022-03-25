/*
 * *******************************************************
 *
 * 作者：hzy
 *
 * 开源地址：https://gitee.com/hzy6
 *
 * *******************************************************
 */

using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using System;
using HZY.EFCore.Impl;
using HZY.EFCore.DbContexts;
using HZY.EFCore.Models;
using HZY.EFCore.Extensions;
using HZY.Infrastructure;
using Microsoft.Extensions.DependencyInjection;
using System.Linq.Expressions;
using HZY.Model.BO;
using HZY.Models.Entities.Framework;
using HZY.Repositories.Framework;
using HZY.Infrastructure.ExpressionTree;
using HzyScanDiService.Extensions;

namespace HZY.Repositories.BaseRepositories.Impl;

/// <summary>
/// Admin默认基础仓储接口
/// </summary>
/// <typeparam name="T"></typeparam>
public class AdminEfCoreBaseRepositoryImpl<T> : RepositoryImpl<T, AdminBaseDbContext>, IAdminEfCoreBaseRepository<T> where T : class, new()
{

    public AdminEfCoreBaseRepositoryImpl(AdminBaseDbContext context, Expression<Func<T, bool>> filter = null) : base(context, filter)
    {

    }

    /// <summary>
    /// 创建列头
    /// </summary>
    /// <param name="pagingViewModel"></param>
    /// <param name="fieldNames"></param>
    /// <param name="columnHeads"></param>
    private void CreateColumnHeads(PagingViewModel pagingViewModel,
        List<string> fieldNames,
        List<TableViewColumn> columnHeads)
    {
        var entityInfos = this.Orm.CacheEntity.GetEntityInfos(typeof(T).Name);

        foreach (var item in fieldNames)
        {
            var title = entityInfos.Find(w => w.Name == item)?.Remark ?? item;
            pagingViewModel.Columns.Add(new TableViewColumn(item.FirstCharToLower(), title));
        }

        //如果 传入了 头信息 则 覆盖
        if (columnHeads == null) return;

        foreach (var item in columnHeads)
        {
            var columnHead =
                pagingViewModel.Columns.Find(w => w.FieldName.ToLower() == item.FieldName.ToLower());
            if (columnHead == null) continue;
            columnHead.Show = item.Show;
            columnHead.Title = item.Title;
            columnHead.Width = item.Width;
        }
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
    public virtual async Task<PagingViewModel> AsPagingViewModelAsync<TModel>(IQueryable<TModel> query, int page, int size, List<TableViewColumn> columnHeads = default)
    {
        var pagingViewModel = new PagingViewModel { Page = page, Size = size, Total = await query.CountAsync() };
        pagingViewModel.PageCount = (pagingViewModel.Total / size);
        var data = await query.Page(page, size).ToListAsync();

        var propertyInfos = typeof(TModel).GetProperties();
        var fieldNames = propertyInfos.Select(item => item.Name).ToList();
        //.OrderBy(w => w.Name)

        this.CreateColumnHeads(pagingViewModel, fieldNames, columnHeads);

        #region 重新将数据 组合 为 List<Dictionary<string,object>> 类型

        var result = new List<Dictionary<string, object>>();
        foreach (var item in data)
        {
            var type = item.GetType();
            var dictionary = new Dictionary<string, object>();

            foreach (var fieldName in fieldNames)
            {
                dictionary[fieldName] = type.GetProperty(fieldName)?.GetValue(item);
            }

            result.Add(dictionary);
        }

        pagingViewModel.DataSource = result;

        #endregion

        return pagingViewModel;
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
    public virtual async Task<PagingViewModel> AsPagingViewModelAsync(string sql, int page, int size, string orderBy = "1", List<TableViewColumn> columnHeads = default, params object[] parameters)
    {
        using var serviceScope = ServiceProviderExtensions.CreateScope();
        var freeSql = serviceScope.ServiceProvider.GetRequiredService<IFreeSql>();

        var count = await freeSql.Ado.QuerySingleAsync<long>($"SELECT COUNT(1) FROM ({sql}) TAB", parameters);
        var pagingViewModel = new PagingViewModel { Page = page, Size = size, Total = count };
        pagingViewModel.PageCount = (pagingViewModel.Total / size);
        var offSet = size * (page - 1);
        var sqlString = string.Empty;

        if (Orm.Database.IsSqlServer())
        {
            sqlString = $"SELECT * FROM ({sql}) TAB ORDER BY {orderBy} OFFSET {offSet} ROWS FETCH NEXT {size} ROWS ONLY";
        }
        else if (Orm.Database.IsMySql() || Orm.Database.IsNpgsql())
        {
            sqlString = $"SELECT * FROM ({sql}) TAB ORDER BY {orderBy} LIMIT {size} OFFSET {offSet}";
        }
        else
        {
            throw new Exception("查询数据库类型不支持!");
        }

        var data = await freeSql.Ado.ExecuteDataTableAsync(sqlString, parameters);

        var fieldNames = (from DataColumn dc in data.Columns select dc.ColumnName).ToList();

        this.CreateColumnHeads(pagingViewModel, fieldNames, columnHeads);

        #region 重新将数据 组合 为 List<Dictionary<string,object>> 类型

        var result = new List<Dictionary<string, object>>();
        foreach (DataRow dr in data.Rows)
        {
            var dictionary = new Dictionary<string, object>();
            foreach (DataColumn dc in data.Columns)
            {
                dictionary.Add(dc.ColumnName, dr[dc.ColumnName]);
            }

            result.Add(dictionary);
        }

        pagingViewModel.DataSource = result;

        #endregion

        return await Task.FromResult(pagingViewModel);
    }

    /// <summary>
    /// 获取数据权限
    /// </summary>
    /// <param name="accountInfo"></param>
    /// <returns></returns>
    public (bool Self, List<int> OrganizationList) GetDataAuthority(AccountInfo accountInfo)
    {
        var organizationList = new List<int>();
        var self = false;

        using var serviceScope = ServiceProviderExtensions.CreateScope();
        var _sysDataAuthorityRepository = serviceScope.ServiceProvider.GetRequiredService<SysDataAuthorityRepository>();
        var _sysDataAuthorityCustomRepository = serviceScope.ServiceProvider.GetRequiredService<SysDataAuthorityCustomRepository>();
        var _sysOrganizationRepository = serviceScope.ServiceProvider.GetRequiredService<SysOrganizationRepository>();

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

            }

            // 自定义权限
            if (item.PermissionType == SysDataAuthorityPermissionTypeEnum.Custom)
            {
                var customList = _sysDataAuthorityCustomRepository.Select.Where(w => w.SysDataAuthorityId == item.Id).ToList();
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
    public IQueryable<T> QueryByDataAuthority(AccountInfo accountInfo, Expression<Func<T, object>> userIdFieldNameExpression = null, Expression<Func<T, object>> organizationIdFieldNameExpression = null)
    {
        var query = this.Query();

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
            userIdFieldName = ((MemberExpression)((UnaryExpression)userIdFieldNameExpression.Body).Operand).Member.Name;
        }

        if (organizationIdFieldNameExpression != null)
        {
            organizationIdFieldName = ((MemberExpression)((UnaryExpression)organizationIdFieldNameExpression.Body).Operand).Member.Name;
        }

        if (!modelFileds.Any(w => w.Name == userIdFieldName) && !modelFileds.Any(w => w.Name == organizationIdFieldName))
        {
            throw new Exception($"在模型【{modelType.Name}】中未找到 {userIdFieldName} 或者 {organizationIdFieldName} 字段名称! 请检查设置好对应字段!");
        }

        var data = this.GetDataAuthority(accountInfo);

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