namespace HZY.Api.Admin.ApplicationServices.Systems;

/// <summary>
/// 系统账号服务
/// </summary>
public class SysUserService : ApplicationService<IRepository<SysUser>>, IAopServiceProvider
{
    public IServiceProvider ServiceProvider { get; set; }
    [Autowired]
    private IRepository<SysUserRole> _sysUserRoleRepository { get; }
    [Autowired]
    private IRepository<SysRole> _sysRoleRepository { get; }
    [Autowired]
    private IRepository<SysUserPost> _sysUserPostRepository { get; }
    [Autowired]
    private IRepository<SysPost> _sysPostRepository { get; }
    [Autowired]
    private IAccountService _accountService { get; }
    [Autowired]
    private SysMenuService _sysMenuService { get; }
    [Autowired]
    private IRepository<SysOrganization> _sysOrganizationRepository { get; }
    [Autowired]
    private IPermissionService _permissionService { get; }

    public SysUserService(IServiceProvider serviceProvider, IRepository<SysUser> defaultRepository) : base(defaultRepository)
    {
        this.ServiceProvider = serviceProvider;
    }

    //public SysUserService(IRepository<SysUser> defaultRepository,
    //    IRepository<SysUserRole> sysUserRoleRepository,
    //    IRepository<SysRole> sysRoleRepository,
    //    IRepository<SysUserPost> sysUserPostRepository,
    //    IRepository<SysPost> sysPostRepository,
    //    IAccountService accountService,
    //    SysMenuService sysMenuService,
    //    IRepository<SysOrganization> sysOrganizationRepository,
    //    IPermissionService permissionService) : base(defaultRepository)
    //{
    //    _sysUserRoleRepository = sysUserRoleRepository;
    //    _sysRoleRepository = sysRoleRepository;
    //    _sysUserPostRepository = sysUserPostRepository;
    //    _sysPostRepository = sysPostRepository;
    //    _accountService = accountService;
    //    _sysMenuService = sysMenuService;
    //    _sysOrganizationRepository = sysOrganizationRepository;
    //    _permissionService = permissionService;

    //}

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(PagingSearchInput<SysUser> pagingSearchInput)
    {
        var accountInfo = _accountService.GetAccountContext();

        //被数据权限处理的 query 对象
        var querySysUser = _defaultRepository
        .DataPermission(_defaultRepository.Select, accountInfo, w => w.Id, w => w.OrganizationId)
        ;

        var query = (from sysUser in querySysUser
                     from sysOrganization in _sysOrganizationRepository.Select.Where(w => w.Id == sysUser.OrganizationId).DefaultIfEmpty()
                     select new
                     {
                         t1 = sysUser,
                         t2 = sysOrganization,
                         所属角色 = string.Join(",", from userRole in _sysUserRoleRepository.Select
                                                 join role in _sysRoleRepository.Select on userRole.RoleId equals role.Id
                                                 where userRole.UserId == sysUser.Id
                                                 select role.Name)
                     })
                .WhereIf(pagingSearchInput.Search.OrganizationId != null, w => w.t1.OrganizationId == pagingSearchInput.Search.OrganizationId)
                .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search?.Name), w => w.t1.Name.Contains(pagingSearchInput.Search.Name))
                .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search?.LoginName), w => w.t1.LoginName.Contains(pagingSearchInput.Search.LoginName))
                .OrderBy(w => w.t1.OrganizationId)
                .ThenByDescending(w => w.t1.CreationTime)
                .Select(w => new
                {
                    w.t1.Name,
                    w.t1.LoginName,
                    w.所属角色,
                    OrganizationName = w.t2.Name,
                    w.t1.Phone,
                    _Email = w.t1.Email,
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

        result.GetColumn(query, w => w.OrganizationName!).SetColumn("所属组织");
        result.GetColumn(query, w => w.所属角色!).SetColumn("所属角色", sort: false);

        return result;
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    public async Task DeleteListAsync(List<Guid> ids)
    {
        foreach (var item in ids)
        {
            var userModel = await _defaultRepository.FindByIdAsync(item);
            if (userModel.DeleteLock) MessageBox.Show("该信息已被锁定不能删除！");
            await _sysUserRoleRepository.DeleteAsync(w => w.UserId == item);
            await _defaultRepository.DeleteAsync(userModel);
            //清除缓存
            _accountService.DeleteCacheAccountContextById(item.ToString());
        }
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public virtual async Task<Dictionary<string, object>> FindFormAsync(Guid id)
    {
        var res = new Dictionary<string, object>();

        var form = (await _defaultRepository.FindByIdAsync(id)).NullSafe();
        //角色信息
        var roleIds = await _sysUserRoleRepository.Select
            .Where(w => w.UserId == id)
            .Select(w => w.RoleId)
            .ToListAsync();
        var allRoleList = await _sysRoleRepository.Select.ToListAsync();
        //岗位信息
        var postIds = await _sysUserPostRepository.Select
                .Where(w => w.UserId == id)
                .Select(w => w.PostId)
                .ToListAsync()
            ;
        var allPostList = await _sysPostRepository.Select.OrderBy(w => w.Number).ToListAsync();

        res[nameof(id)] = id == Guid.Empty ? "" : id;
        res[nameof(form)] = form;
        res[nameof(roleIds)] = roleIds;
        res[nameof(allRoleList)] = allRoleList;
        //
        res[nameof(postIds)] = postIds;
        res[nameof(allPostList)] = allPostList;
        return res;
    }

    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [Transactional]
    public virtual async Task SaveFormAsync(SysUserFormDto form)
    {
        var model = form.Form;
        //if (string.IsNullOrWhiteSpace(model.Password))
        //    MessageBox.Show("密码不能为空！");

        if (model.Id == Guid.Empty)
        {
            model.Password = string.IsNullOrWhiteSpace(model.Password) ? Tools.Md5Encrypt("123qwe") : Tools.Md5Encrypt(model.Password);
        }
        else
        {
            if (string.IsNullOrWhiteSpace(model.Password))
            {
                var user = await _defaultRepository.FindByIdAsync(model.Id);
                model.Password = user.Password;
            }
            else
            {
                model.Password = Tools.Md5Encrypt(model.Password);
            }
        }

        if (await _defaultRepository.AnyAsync(w => w.LoginName == model.LoginName && w.Id != model.Id))
        {
            MessageBox.Show("登录账号名称已存在!");
        }

        await _defaultRepository.InsertOrUpdateAsync(form.Form);

        //变更用户角色
        if (form.RoleIds.Count > 0)
        {
            var sysUserRoles = await _sysUserRoleRepository.Select
                .Where(w => w.UserId == model.Id)
                .ToListAsync();

            await _sysUserRoleRepository.DeleteAsync(w => w.UserId == model.Id);
            foreach (var item in form.RoleIds)
            {
                var sysUserRole = sysUserRoles.FirstOrDefault(w => w.RoleId == item).NullSafe();

                sysUserRole.Id = Guid.NewGuid();
                sysUserRole.RoleId = item;
                sysUserRole.UserId = model.Id;
                await _sysUserRoleRepository.InsertAsync(sysUserRole);
            }
        }

        //处理岗位信息
        if (form.PostIds.Count > 0)
        {
            var sysUserPosts = await _sysUserPostRepository.Select
                    .Where(w => w.UserId == model.Id)
                    .ToListAsync()
                ;

            await _sysUserPostRepository.DeleteAsync(w => w.UserId == model.Id);
            foreach (var item in form.PostIds)
            {
                var sysUserPost = sysUserPosts.FirstOrDefault(w => w.PostId == item).NullSafe();

                sysUserPost.Id = Guid.NewGuid();
                sysUserPost.PostId = item;
                sysUserPost.UserId = model.Id;
                await _sysUserPostRepository.InsertAsync(sysUserPost);
            }
        }

        //清除缓存
        _accountService.DeleteCacheAccountContextById(model.Id.ToString());
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(PagingSearchInput<SysUser> pagingSearchInput)
    {
        pagingSearchInput.Page = -1;
        var tableViewModel = await FindListAsync(pagingSearchInput);
        return ExcelUtil.ExportExcelByPagingView(tableViewModel, null, "Id");
    }

    /// <summary>
    /// 获取当前用户信息
    /// </summary>
    /// <returns></returns>
    public async Task<AccountContext> GetUserInfoAsync()
    {
        var userInfo = _accountService.GetAccountContext();
        var sysMenus = await _sysMenuService.GetMenusByCurrentRoleAsync();
        //设置菜单 Map
        var sysMenusMap = _sysMenuService.CreateMenus(sysMenus);
        userInfo.Menus = sysMenusMap;
        //设置菜单权限
        userInfo.MenuPowers = await _permissionService.GetPowerByMenusAsync(sysMenus);

        return userInfo;
    }





}