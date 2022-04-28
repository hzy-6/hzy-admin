using HZY.EFCore.DbContexts;
using HZY.EFCore.Models;
using HZY.Model.BO;
using HzyEFCoreRepositories.Repositories;
using HzyScanDiService.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace HZY.EFCore.Repositories.Base
{
    /// <summary>
    /// Admin默认基础仓储接口
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public interface IRepository<T> : IBaseRepository<T, AdminBaseDbContext>, IDiScoped where T : class, new()
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
        Task<PagingViewModel> AsPagingViewModelAsync<TModel>(IQueryable<TModel> query, int page, int size, List<TableViewColumn> columnHeads = default);

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
        Task<PagingViewModel> AsPagingViewModelAsync(string sql, int page, int size, string orderBy = "1", List<TableViewColumn> columnHeads = default, params object[] parameters);

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
