namespace HZY.Api.Admin.Controllers.Systems;

/// <summary>
/// 角色菜单功能控制器
/// </summary>
//[ControllerDescriptor(MenuId = "16", DisplayName = "")]
public class SysRoleMenuFunctionController : AdminControllerBase<SysRoleMenuFunctionService>
{
    private readonly SysRoleService _sysRoleService;

    public SysRoleMenuFunctionController(SysRoleMenuFunctionService defaultService, SysRoleService sysRoleService)
        : base(defaultService)
    {
        _sysRoleService = sysRoleService;
    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查询数据")]
    [HttpPost("{size}/{page}")]
    public Task<PagingView> FindListAsync([FromBody] PagingSearchInput<SysRole> pagingSearchInput)
    {
        return _sysRoleService.FindListAsync(pagingSearchInput);
    }

    /// <summary>
    /// 添加
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [RequestLimitFilter]
    [ActionDescriptor(PermissionFunctionConsts.Function_Insert, DisplayName = "创建表单")]
    [HttpPost]
    [ApiCheckModel]
    public Task CreateAsync([FromBody] List<SysRoleMenuFunctionFormDto> form)
    {
        return _defaultService.SaveFormAsync(form);
    }

    #region 角色菜单功能 Tree

    /// <summary>
    /// 获取菜单功能树
    /// </summary>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看菜单树")]
    [HttpGet("{RoleId}")]
    public Task<List<Dictionary<string, object>>> GetRoleMenuFunctionByRoleId(Guid roleId)
    {
        return _defaultService.GetRoleMenuFunctionByRoleIdAsync(roleId);
    }

    #endregion
}