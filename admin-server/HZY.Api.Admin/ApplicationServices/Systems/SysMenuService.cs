namespace HZY.Api.Admin.ApplicationServices.Systems;

/// <summary>
/// 菜单服务
/// </summary>
public class SysMenuService : ApplicationService<IRepository<SysMenu>>
{
    private readonly IRepository<SysFunction> _sysFunctionRepository;
    private readonly IRepository<SysMenuFunction> _sysMenuFunctionRepository;
    private readonly IRepository<SysRoleMenuFunction> _sysRoleMenuFunctionRepository;
    private readonly AccountContext _accountInfo;

    public SysMenuService(IRepository<SysMenu> defaultRepository,
        IRepository<SysFunction> sysFunctionRepository,
        IRepository<SysMenuFunction> sysMenuFunctionRepository,
        IRepository<SysRoleMenuFunction> sysRoleMenuFunctionRepository,
        IAccountService accountService) : base(defaultRepository)
    {
        _sysFunctionRepository = sysFunctionRepository;
        _sysMenuFunctionRepository = sysMenuFunctionRepository;
        _sysRoleMenuFunctionRepository = sysRoleMenuFunctionRepository;
        _accountInfo = accountService.GetAccountContext();
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(PagingSearchInput<SysMenu> pagingSearchInput)
    {
        var query = (from sysMenu in _defaultRepository.Select
                     from sysMenuParent in _defaultRepository.Select.Where(w => w.Id == sysMenu.ParentId).DefaultIfEmpty()
                     select new { t1 = sysMenu, t2 = sysMenuParent })
              .WhereIf(pagingSearchInput.Search?.ParentId == 0 || pagingSearchInput.Search?.ParentId == null, w => w.t1.ParentId == null || w.t1.ParentId == 0)
              .WhereIf(pagingSearchInput.Search?.ParentId != 0 && pagingSearchInput.Search?.ParentId != null, w => w.t1.ParentId == pagingSearchInput.Search.ParentId)
              .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search?.Name), a => a.t1.Name.Contains(pagingSearchInput.Search.Name))
              .OrderBy(w => w.t1.Number)
              .Select(w => new
              {
                  w.t1.Number,
                  w.t1.Name,
                  w.t1.Url,
                  父级菜单 = w.t2.Name,
                  w.t1.ComponentName,
                  w.t1.Router,
                  w.t1.Icon,
                  w.t1.Close,
                  w.t1.Show,
                  w.t1.LastModificationTime,
                  w.t1.CreationTime,
                  w.t1.Id,
              })
          ;

        var result = await _defaultRepository.AsPagingViewAsync(query, pagingSearchInput);
        //覆盖值
        result
            .FormatValue(query, w => w.CreationTime, (oldValue) => oldValue.ToString("yyyy-MM-dd"))
            .FormatValue(query, w => w.LastModificationTime, (oldValue) => oldValue?.ToString("yyyy-MM-dd"))
            ;

        return result;
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    public async Task DeleteListAsync(List<int> ids)
    {
        foreach (var item in ids)
        {
            //删除当前菜单及一下的子集菜单
            var menu = await _defaultRepository.FindByIdAsync(item);
            var menus = await _defaultRepository.ToListAsync(w => w.LevelCode == menu.LevelCode || w.LevelCode.StartsWith(menu.LevelCode + "."));
            await _defaultRepository.DeleteAsync(menus);
            //删除菜单关联表
            await _sysRoleMenuFunctionRepository.DeleteAsync(w => menus.Select(w => w.Id).Contains(w.MenuId));
            await _sysMenuFunctionRepository.DeleteAsync(w => menus.Select(w => w.Id).Contains(w.MenuId));
        }
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public async Task<Dictionary<string, object>> FindFormAsync(int id)
    {
        var res = new Dictionary<string, object>();

        var form = await _defaultRepository.FindByIdAsync(id);
        var allFunctions = await _sysFunctionRepository.Select
            .OrderBy(w => w.Number)
            .ToListAsync();
        var menuFunctionList = await _sysMenuFunctionRepository.Select
            .Where(w => w.MenuId == id)
            .OrderBy(w => w.Number)
            .ToListAsync();

        res[nameof(id)] = id == 0 ? "" : id;
        res[nameof(form)] = form.NullSafe();
        res[nameof(allFunctions)] = allFunctions;
        res[nameof(menuFunctionList)] = menuFunctionList;
        return res;
    }

    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    public async Task SaveFormAsync(SysMenuFormDto form)
    {
        var model = form.Form;
        var menuFunctionList = form.MenuFunctionList;

        model = await _defaultRepository.InsertOrUpdateAsync(model);

        #region 更新级别码

        if (model.ParentId == null || model.ParentId == 0)
        {
            model.LevelCode = model.Id.ToString();
        }
        else
        {
            var parent = await _defaultRepository.FindByIdAsync(model.ParentId);
            model.LevelCode = parent.LevelCode + "." + model.Id;
        }

        model = await _defaultRepository.InsertOrUpdateAsync(model);

        #endregion

        #region 处理菜单功能绑定表

        await _sysMenuFunctionRepository.DeleteAsync(w => w.MenuId == model.Id);
        if (menuFunctionList.Count <= 0) return;

        foreach (var item in menuFunctionList)
        {
            item.Id = item.Id == Guid.Empty ? Guid.Empty : item.Id;
            item.MenuId = model.Id;
        }
        await _sysMenuFunctionRepository.InsertRangeAsync(menuFunctionList);

        #endregion

    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(PagingSearchInput<SysMenu> pagingSearchInput)
    {
        pagingSearchInput.Page = -1;
        var tableViewModel = await FindListAsync(pagingSearchInput);
        return ExcelUtil.ExportExcelByPagingView(tableViewModel, null, "Id");
    }

    /// <summary>
    /// 获取所有的菜单
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    public async Task<List<SysMenuDto>> GetAllAsync(SysMenu search)
    {
        var query = (from sysMenu in _defaultRepository.Select
                     from sysMenuParent in _defaultRepository.Select.Where(w => w.Id == sysMenu.ParentId).DefaultIfEmpty()
                     select new { t1 = sysMenu, t2 = sysMenuParent })
             .WhereIf(!string.IsNullOrWhiteSpace(search?.Name), a => a.t1.Name.Contains(search.Name))
             .OrderBy(w => w.t1.Number)
             .Select(w => new SysMenuDto
             {
                 Id = w.t1.Id,
                 Number = w.t1.Number,
                 Name = w.t1.Name,
                 Url = w.t1.Url,
                 ParentName = w.t2.Name,
                 ParentId = w.t1.ParentId,
                 JumpUrl = w.t1.JumpUrl,
                 ComponentName = w.t1.ComponentName,
                 Router = w.t1.Router,
                 Icon = w.t1.Icon,
                 Close = w.t1.Close,
                 Show = w.t1.Show,
                 KeepAlive = w.t1.KeepAlive,
                 State = w.t1.State,
                 LevelCode = w.t1.LevelCode,
                 LastModificationTime = w.t1.LastModificationTime,
                 CreationTime = w.t1.CreationTime,
             })
        ;

        return await query.ToListAsync();
    }

    #region 创建系统左侧菜单

    /// <summary>
    /// 根据角色ID 获取菜单
    /// </summary>
    /// <returns></returns>
    public async Task<List<SysMenu>> GetMenusByCurrentRoleAsync()
    {
        var sysMenuAllList = await _defaultRepository.Select
            .Where(w => w.State)
            .OrderBy(w => w.Number)
            .ToListAsync();

        if (_accountInfo.IsAdministrator) return sysMenuAllList;

        var sysMenuList = await (
            from t1 in _sysRoleMenuFunctionRepository.Select.Where(w => _accountInfo.SysRoles.Select(s => s.Id).Contains(w.RoleId))
            from t2 in _defaultRepository.Select.Where(w => w.Id == t1.MenuId && w.State)
                //.DefaultIfEmpty()
            from t3 in _sysMenuFunctionRepository.Select
                .Where(w => w.Id == t1.MenuFunctionId && w.FunctionCode == PermissionFunctionConsts.Function_Display && t2.Id == w.MenuId)
                //.DefaultIfEmpty()
            select t2
            )
            .ToListAsync()
            ;

        var newSysMenuList = new List<SysMenu>();

        foreach (var item in sysMenuList)
        {
            //检查 item 是否已经存在于新集合中
            if (!newSysMenuList.Any(w => w.Id == item.Id))
                newSysMenuList.Add(item);

            CheckUpperLevel(sysMenuAllList, sysMenuList, newSysMenuList, item);
        }

        return newSysMenuList.OrderBy(w => w.Number).ToList();
    }

    private void CheckUpperLevel(List<SysMenu> sysMenuAllList, List<SysMenu> oldSysMenuList, List<SysMenu> newSysMenuList, SysMenu menu)
    {
        if (oldSysMenuList.Any(w => w.Id == menu.ParentId)) return;

        var item = sysMenuAllList.Find(w => w.Id == menu.ParentId);
        if (item == null) return;

        //检查 item 是否已经存在于新集合中
        if (!newSysMenuList.Any(w => w.Id == item.Id))
            newSysMenuList.Add(item);

        CheckUpperLevel(sysMenuAllList, oldSysMenuList, newSysMenuList, item);
    }

    /// <summary>
    /// 创建菜单
    /// </summary>
    /// <param name="sysMenuList"></param>
    public List<SysMenu> CreateMenus(List<SysMenu> sysMenuList)
    {
        var result = new List<SysMenu>();

        foreach (var item in sysMenuList)
        {
            var menu = item.MapTo<SysMenu, SysMenu>();
            menu.JumpUrl = string.IsNullOrWhiteSpace(item.JumpUrl) ? item.Router : item.JumpUrl;
            result.Add(menu);
        }

        return result;
    }

    #endregion 左侧菜单


    /// <summary>
    /// 复制菜单
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public async Task<int> CopyMenuAsync(int id)
    {
        var menu = await this._defaultRepository.FindByIdAsync(id);
        var menuFunc = await this._sysMenuFunctionRepository.Select
            .Where(w => w.MenuId == id)
            .ToListAsync();
        var newMenu = menu.CopyObject();
        newMenu.Id = 0;
        newMenu.Number++;
        newMenu = await this._defaultRepository.InsertAsync(newMenu);
        #region 更新级别码
        if (newMenu.ParentId == null || newMenu.ParentId == 0)
        {
            newMenu.LevelCode = newMenu.Id.ToString();
        }
        else
        {
            var parent = await this._defaultRepository.FindByIdAsync(newMenu.ParentId);
            newMenu.LevelCode = parent.LevelCode + "." + newMenu.Id;
        }
        #endregion
        await this._defaultRepository.UpdateAsync(newMenu);
        var newMenuFuncList = menuFunc.CopyObject();
        foreach (var item in newMenuFuncList)
        {
            item.Id = Guid.NewGuid();
            item.MenuId = newMenu.Id;
        }
        return await this._sysMenuFunctionRepository.InsertRangeAsync(newMenuFuncList);
    }

    /// <summary>
    /// 获取菜单国际化json
    /// </summary>
    /// <returns></returns>
    public async Task<Dictionary<string, string>> GetGlobalNameJsonAsync()
    {
        return await this._defaultRepository.SelectNoTracking
            .OrderBy(w => w.Id)
            .ToDictionaryAsync(w => "menu." + w.Id, w => w.Name!);
    }

}