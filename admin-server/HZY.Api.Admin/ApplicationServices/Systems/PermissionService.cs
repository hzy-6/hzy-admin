namespace HZY.Api.Admin.ApplicationServices.Systems;

/// <summary>
/// 系统权限服务
/// </summary>
public class PermissionService : IPermissionService
{
    private readonly IRepository<SysFunction> _sysFunctionRepository;
    private readonly IRepository<SysMenuFunction> _sysMenuFunctionRepository;
    private readonly IRepository<SysRoleMenuFunction> _sysRoleMenuFunctionRepository;
    private readonly IRepository<SysMenu> _sysMenuRepository;
    private readonly IAccountService _accountService;

    public PermissionService(IRepository<SysFunction> sysFunctionRepository,
        IRepository<SysMenuFunction> sysMenuFunctionRepository,
        IRepository<SysRoleMenuFunction> sysRoleMenuFunctionRepository,
        IRepository<SysMenu> sysMenuRepository,
        IAccountService accountService)
    {
        _sysFunctionRepository = sysFunctionRepository;
        _sysMenuFunctionRepository = sysMenuFunctionRepository;
        _sysRoleMenuFunctionRepository = sysRoleMenuFunctionRepository;
        _sysMenuRepository = sysMenuRepository;
        _accountService = accountService;
    }


    /// <summary>
    /// 获取拥有的菜单对象的权限
    /// </summary>
    /// <param name="sysMenuList"></param>
    /// <returns></returns>
    public async Task<List<Dictionary<string, object>>> GetPowerByMenusAsync(List<SysMenu> sysMenuList)
    {
        var accountContext = _accountService.GetAccountContext();

        var sysMenuFunctionList = await _sysMenuFunctionRepository.Select
            .Where(w => sysMenuList.Select(w => w.Id).Contains(w.MenuId))
            .ToListAsync()
            ;

        var sysRoleMenuFunctionList = await _sysRoleMenuFunctionRepository.Select
            .Where(w => accountContext.SysRoles.Select(w => w.Id).Contains(w.RoleId))
            .ToListAsync()
            ;

        var res = new List<Dictionary<string, object>>();

        foreach (var item in sysMenuList)
        {
            var power = new Dictionary<string, object>
            {
                ["MenuId"] = item.Id
            };

            foreach (var sysMenuFunction in sysMenuFunctionList.Where(w => w.MenuId == item.Id))
            {
                // 管理员角色特殊处理
                if (accountContext.IsAdministrator)
                {
                    power[sysMenuFunction.FunctionCode] = true;
                    continue;
                }

                //其他角色处理
                if (accountContext.SysRoles.Count() > 0)
                {
                    var isPower = sysRoleMenuFunctionList
                        .Where(w => accountContext.SysRoles.Select(w => w.Id).Contains(w.RoleId))
                        .Where(w => w.MenuId == item.Id && w.MenuFunctionId == sysMenuFunction.Id)
                        .Any();

                    power[sysMenuFunction.FunctionCode] = isPower;
                }
                else
                {
                    power[sysMenuFunction.FunctionCode] = false;
                }
            }

            res.Add(power);
        }

        return res;
    }

    /// <summary>
    /// 根据菜单获取权限
    /// </summary>
    /// <param name="menuId"></param>
    /// <returns></returns>
    public async Task<Dictionary<string, object>> GetPowerStateByMenuIdAsync(int menuId)
    {
        if (!_sysMenuRepository.Select.Any(w => w.Id == menuId))
        {
            MessageBox.Show("菜单 id 不存在! 请检查控制器 菜单 id 是否设置正确。");
        }

        var sysMenus = await _sysMenuRepository.Select.Where(w => w.Id == menuId).ToListAsync();
        return (await GetPowerByMenusAsync(sysMenus)).FirstOrDefault();
    }



}
