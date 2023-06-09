﻿namespace HZY.Repository.EntityFramework.Admin.Repositories;

/// <summary>
/// Admin默认基础仓储接口
/// </summary>
/// <typeparam name="T"></typeparam>
public interface IRepository<T> : IRepositoryBase<T, AdminDbContext>, IScopedDependency where T : class, new()
{
    /// <summary>
    /// 分页模型构建
    /// </summary>
    /// <typeparam name="TModel"></typeparam>
    /// <typeparam name="TSearch"></typeparam>
    /// <param name="query"></param>
    /// <param name="pagingSearchInput"></param>
    /// <param name="accountInfo"></param>
    /// <param name="userIdFieldNameExpression"></param>
    /// <param name="organizationIdFieldNameExpression"></param>
    /// <returns></returns>
    Task<PagingView> AsPagingViewAsync<TModel, TSearch>(IQueryable<TModel> query,
        PagingSearchInput<TSearch> pagingSearchInput,
        AccountContext? accountInfo = default,
        Expression<Func<TModel, object>>? userIdFieldNameExpression = null,
        Expression<Func<TModel, object>>? organizationIdFieldNameExpression = null);

    /// <summary>
    /// 分页模型构建 用于编写 sql 语句得情况
    /// </summary>
    /// <param name="sql"></param>
    /// <param name="page"></param>
    /// <param name="size"></param>
    /// <param name="orderBy"></param>
    /// <param name="parameters"></param>
    /// <returns></returns>
    Task<PagingView> AsPagingViewAsync(string sql, int page, int size, string orderBy = "1", params object[] parameters);

    /// <summary>
    /// 根据组织 获取数据权限
    /// </summary>
    /// <param name="accountInfo"></param>
    /// <param name="_sysUserRepository"></param>
    /// <returns></returns>
    IQueryable<T> DataPermission(AccountContext? accountInfo, IRepository<SysUser> _sysUserRepository);

    /// <summary>
    /// 根据组织 获取数据权限
    /// </summary>
    /// <param name="query"></param>
    /// <param name="accountInfo"></param>
    /// <param name="userIdFieldNameExpression"></param>
    /// <param name="organizationIdFieldNameExpression"></param>
    /// <returns></returns>
    IQueryable<TModel> DataPermission<TModel>(IQueryable<TModel> query,
        AccountContext? accountInfo,
        Expression<Func<TModel, object>>? userIdFieldNameExpression = null,
        Expression<Func<TModel, object>>? organizationIdFieldNameExpression = null);


}
