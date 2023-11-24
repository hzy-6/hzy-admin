namespace HZY.Shared.Extensions;

/// <summary>
/// 
/// IRepositoryBase 扩展类
/// 1、包含分页视图
/// 2、数据权限
/// 
/// </summary>
public static class RepositoryBaseExtensions
{
    /// <summary>
    /// 查询转换为分页视图模型
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <typeparam name="TModel"></typeparam>
    /// <typeparam name="TSearch"></typeparam>
    /// <param name="queryRepository"></param>
    /// <param name="query"></param>
    /// <param name="pagingSearchInput"></param>
    /// <param name="accountInfo"></param>
    /// <param name="userIdFieldNameExpression"></param>
    /// <param name="organizationIdFieldNameExpression"></param>
    /// <returns></returns>
    public static async Task<PagingView> AsPagingViewAsync<T, TModel, TSearch>(this IQueryRepository<T> queryRepository, IQueryable<TModel> query,
        PagingSearchInput<TSearch> pagingSearchInput,
        AccountContext? accountInfo = default,
        Expression<Func<TModel, object>>? userIdFieldNameExpression = null,
        Expression<Func<TModel, object>>? organizationIdFieldNameExpression = null)
        where T : class, new()
    {
        var page = pagingSearchInput.Page;
        var size = pagingSearchInput.Size;
        var propertyInfos = typeof(TModel).GetProperties();
        var fieldNames = propertyInfos.Select(item => item.Name).ToList();

        #region 数据权限处理

        //验证是否需要数据权限筛选
        if (accountInfo != null)
        {
            query = queryRepository.DataPermission(query, accountInfo, userIdFieldNameExpression, organizationIdFieldNameExpression);
        }

        #endregion

        #region 排序处理
        if (pagingSearchInput?.SearchSort != null)
        {
            //检查排序字段大小写
            foreach (var item in pagingSearchInput.SearchSort)
            {
                if (string.IsNullOrWhiteSpace(item.Field)) continue;
                var name = fieldNames.FirstOrDefault(w => w.ToLower() == item.Field.ToLower());
                if (string.IsNullOrWhiteSpace(name)) continue;
                item.Field = name;
            }

            query = query.GetOrderBy(pagingSearchInput.SearchSort);
        }

        #endregion

        #region 分页处理

        var pagingView = PagingView.Create(page, size);

        //如果分页码 小于 0 则代表导出 否则代表分页查询
        if (page > 0)
        {
            pagingView.Total = await query.CountAsync();
            pagingView.PageCount = pagingView.Total % size > 0 ? pagingView.Total / size + 1 : pagingView.Total / size;//无法整除有余,则增加一页
            pagingView.Page = pagingView.Page > pagingView.PageCount ? 1 : pagingView.Page;
            query = query.Page(pagingView.Page, size);
        }

        #endregion

        var data = await query.ToListAsync();

        pagingView.BuilderDataSource(data, typeof(T));

        // 设置列显示名称
        pagingView.SetColumnDisplayName();

        return pagingView;
    }

    /// <summary>
    /// 查询转换为分页视图模型 支持 Sql 字符串
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="queryRepository"></param>
    /// <param name="sql"></param>
    /// <param name="page"></param>
    /// <param name="size"></param>
    /// <param name="orderBy"></param>
    /// <param name="parameters"></param>
    /// <returns></returns>
    /// <exception cref="Exception"></exception>
    public static async Task<PagingView> AsPagingViewAsync<T>(this IQueryRepository<T> queryRepository,
        string sql,
        int page,
        int size,
        string orderBy = "1",
        params object[] parameters)
        where T : class, new()
    {
        var pagingView = PagingView.Create(page, size);

        //如果分页码 小于 0 则代表导出 否则代表分页查询
        var sqlString = sql;
        if (pagingView.Page > 0)
        {
            pagingView.Total = await queryRepository.QuerySingleBySqlAsync<int>($"SELECT COUNT(1) FROM ({sql}) TAB", parameters);
            pagingView.PageCount = pagingView.Total % size > 0 ? pagingView.Total / size + 1 : pagingView.Total / size;//无法整除有余,则增加一页
            pagingView.Page = pagingView.Page > pagingView.PageCount ? 1 : pagingView.Page;
            var offSet = size * (pagingView.Page - 1);
            sqlString = string.Empty;

            var context = queryRepository.GetContext();
            if (context!.Database.IsSqlServer())
            {
                sqlString = $"SELECT * FROM ({sql}) TAB ORDER BY {orderBy} OFFSET {offSet} ROWS FETCH NEXT {size} ROWS ONLY";
            }
            else if (context.Database.IsMySql() || context.Database.IsNpgsql())
            {
                sqlString = $"SELECT * FROM ({sql}) TAB ORDER BY {orderBy} LIMIT {size} OFFSET {offSet}";
            }
            else
            {
                throw new Exception("查询数据库类型不支持!");
            }
        }

        var data = await queryRepository.QueryDataTableBySqlAsync(sqlString, parameters);

        pagingView.BuilderDataSourceByDataTable(data, typeof(T));

        // 设置列显示名称
        pagingView.SetColumnDisplayName();

        return pagingView;
    }

    /// <summary>
    /// 获取数据权限
    /// </summary>
    /// <param name="accountInfo"></param>
    /// <returns></returns>
    private static (bool Self, List<int> OrganizationList) GetOrganizations(AccountContext accountInfo)
    {
        var organizationList = new List<int>();
        var self = false;

        using var serviceScope = App.CreateScope();
        using var _sysDataAuthorityRepository = serviceScope.ServiceProvider.GetRequiredService<IRepository<SysDataAuthority>>();
        using var _sysDataAuthorityCustomRepository = serviceScope.ServiceProvider.GetRequiredService<IRepository<SysDataAuthorityCustom>>();
        using var _sysOrganizationRepository = serviceScope.ServiceProvider.GetRequiredService<IRepository<SysOrganization>>();

        //获取当前用户角色 配置的数据权限类型
        var sysDataAuthorityList = _sysDataAuthorityRepository.SelectNoTracking
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
                var customList = _sysDataAuthorityCustomRepository.SelectNoTracking
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
                var branchList = _sysOrganizationRepository.SelectNoTracking
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
    /// <param name="queryRepository"></param>
    /// <param name="accountInfo"></param>
    /// <param name="_sysUserRepository"></param>
    /// <returns></returns>
    /// <exception cref="ArgumentNullException"></exception>
    public static IQueryable<TEntity> DataPermission<TEntity>(this IQueryRepository<TEntity> queryRepository,
        AccountContext? accountInfo,
        IRepositoryBase<SysUser> _sysUserRepository)
        where TEntity : class, new()
    {
        if (accountInfo == null)
        {
            throw new ArgumentNullException(nameof(accountInfo));
        }

        //作用域会被释放
        //using var serviceScope = IOCUtil.CreateScope();
        //using var _sysUserRepository = serviceScope.ServiceProvider.GetRequiredService<IRepository<SysUser>>();

        //连表条件
        var query = from table in queryRepository.SelectNoTracking
                    from sysUser in _sysUserRepository.SelectNoTracking.Where(w => w.Id == ((ICreateEntity)table).CreatorUserId)
                    select new
                    {
                        table,
                        sysUser,
                        ((ICreateEntity)table).CreatorUserId,
                        sysUser.OrganizationId
                    }
                    ;

        return queryRepository.DataPermission(query, accountInfo)
        .Select(w => w.table)
        ;
    }

    /// <summary>
    /// 根据数据权限查询 获取 IQueryable 对象
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <typeparam name="TModel"></typeparam>
    /// <param name="queryRepository"></param>
    /// <param name="query"></param>
    /// <param name="accountInfo"></param>
    /// <param name="userIdFieldNameExpression"></param>
    /// <param name="organizationIdFieldNameExpression"></param>
    /// <returns></returns>
    /// <exception cref="Exception"></exception>
    public static IQueryable<TModel> DataPermission<T, TModel>(this IQueryRepository<T> queryRepository,
        IQueryable<TModel> query,
        AccountContext? accountInfo,
        Expression<Func<TModel, object>>? userIdFieldNameExpression = null,
        Expression<Func<TModel, object>>? organizationIdFieldNameExpression = null)
        where T : class, new()
    {
        if (accountInfo == null || accountInfo.IsAdministrator)
        {
            return query;
        }

        var modelType = typeof(TModel);
        var modelFileds = modelType.GetPropertyInfos().ToList();
        string userIdFieldName = nameof(ICreateEntity.CreatorUserId);
        string organizationIdFieldName = nameof(SysUser.OrganizationId);

        if (userIdFieldNameExpression != null)
        {
            userIdFieldName = Tools.GetNameByExpression(userIdFieldNameExpression);
        }

        if (organizationIdFieldNameExpression != null)
        {
            organizationIdFieldName = Tools.GetNameByExpression(organizationIdFieldNameExpression);
        }

        var data = GetOrganizations(accountInfo);

        // 仅看自己处理
        if (data.Self && modelFileds.Any(w => w.Name == userIdFieldName))
        {
            if (!modelFileds.Any(w => w.Name == userIdFieldName))
            {
                throw new Exception($"在模型【{modelType.Name}】中未找到 {userIdFieldName}  字段! 请检查设置好对应字段!");
            }

            var where = ExpressionTreeExtensions.Equal<TModel, Guid>(userIdFieldName, accountInfo.Id);
            query = query.Where(where);
            return query;
        }

        // 组织处理
        if (!modelFileds.Any(w => w.Name == organizationIdFieldName))
        {
            throw new Exception($"在模型【{modelType.Name}】中未找到 {organizationIdFieldName}  字段! 请检查设置好对应字段!");
        }

        if (data.OrganizationList.Count > 0 && modelFileds.Any(w => w.Name == organizationIdFieldName))
        {
            var where = ExpressionTreeExtensions.Contains<TModel, int>(organizationIdFieldName, data.OrganizationList);
            query = query.Where(where);
        }

        return query;
    }
}
