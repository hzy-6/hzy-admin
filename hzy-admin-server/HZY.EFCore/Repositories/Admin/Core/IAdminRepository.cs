using HZY.EFCore.DbContexts;
using HZY.EFCore.PagingViews;
using HZY.Models.BO;
using HzyEFCoreRepositories.Repositories;
using HzyScanDiService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace HZY.EFCore.Repositories.Admin.Core
{
    /// <summary>
    /// Admin默认基础仓储接口
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public interface IAdminRepository<T> : IAppRepository<T, AdminDbContext>, IScopedDependency where T : class, new()
    {
        /// <summary>
        /// 分页模型构建
        /// </summary>
        /// <typeparam name="TModel"></typeparam>
        /// <param name="query"></param>
        /// <param name="page"></param>
        /// <param name="size"></param>
        /// <param name="columnHeads"></param>
        /// <returns></returns>
        Task<PagingView> AsPagingViewAsync<TModel>(IQueryable<TModel> query, int page, int size, List<TableColumnView> columnHeads = default);

        /// <summary>
        /// 分页模型构建 用于编写 sql 语句得情况
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="page"></param>
        /// <param name="size"></param>
        /// <param name="orderBy"></param>
        /// <param name="columnHeads"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        Task<PagingView> AsPagingViewAsync(string sql, int page, int size, string orderBy = "1", List<TableColumnView> columnHeads = default, params object[] parameters);

        /// <summary>
        /// 根据组织 获取数据权限
        /// </summary>
        /// <param name="accountInfo"></param>
        /// <param name="userIdFieldNameExpression"></param>
        /// <param name="organizationIdFieldNameExpression"></param>
        /// <returns></returns>
        IQueryable<T> QueryByDataAuthority(AccountInfo accountInfo, Expression<Func<T, object>> userIdFieldNameExpression = null, Expression<Func<T, object>> organizationIdFieldNameExpression = null);

    }
}
