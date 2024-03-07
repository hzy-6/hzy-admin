namespace HZY.Shared.Admin.ApplicationServices;

/// <summary>
/// 
/// </summary>
public interface IPermissionService : IScopedDependency
{

    /// <summary>
    /// 获取拥有的菜单对象的权限
    /// </summary>
    /// <param name="sysMenuList"></param>
    /// <returns></returns>
    Task<List<Dictionary<string, object>>> GetPowerByMenusAsync(List<SysMenu> sysMenuList);

    /// <summary>
    /// 根据菜单获取权限
    /// </summary>
    /// <param name="menuId"></param>
    /// <returns></returns>
    Task<Dictionary<string, object>> GetPowerStateByMenuIdAsync(int menuId);
}
