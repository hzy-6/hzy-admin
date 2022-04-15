using HZY.Infrastructure;
using HZY.Infrastructure.Controllers;
using HZY.Infrastructure.Permission;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace HZY.Controllers.Admin.ControllersAdmin;

[Authorize(Policy = "WebHostPolicy")]//是否授权 Authorize
[ApiExplorerSettings(GroupName = nameof(ApiVersions.Admin))]
[Route("api/admin/[controller]")]
public class AdminBaseController<TDefaultService> : ApiBaseController<TDefaultService>, IApiPermissionController where TDefaultService : class
{
    private readonly string _menuId;
    private string _menuName;

    /// <summary>
    /// 管理系统基础控制器构造函数
    /// </summary>
    /// <param name="menuId">菜单Id</param>
    /// <param name="defaultService">默认服务</param>
    public AdminBaseController(string menuId, TDefaultService defaultService) : base(defaultService)
    {
        this._menuId = menuId;
    }

    /// <summary>
    /// 获取当前控制器所对应的菜单id
    /// </summary>
    /// <returns></returns>
    [NonAction]
    public string GetCurrentMenuId() => this._menuId;

    /// <summary>
    /// 获取菜单名称
    /// </summary>
    /// <returns></returns>
    [NonAction]
    public string GetMenuName() => this._menuName;

    /// <summary>
    /// 设置菜单名称
    /// </summary>
    /// <param name="menuName"></param>
    /// <returns></returns>
    [NonAction]
    public void SetMenuName(string menuName)
    {
        _menuName = menuName;
    }

}

[Authorize(Policy = "WebHostPolicy")]//是否授权 Authorize
[ApiExplorerSettings(GroupName = nameof(ApiVersions.Admin))]
[Route("api/admin/[controller]")]
public class AdminBaseController : ApiBaseController, IApiPermissionController
{
    private readonly string _menuId;
    private string _menuName;

    /// <summary>
    /// 管理系统基础控制器构造函数
    /// </summary>
    /// <param name="menuId">菜单Id</param>
    public AdminBaseController(string menuId)
    {
        this._menuId = menuId;
    }

    /// <summary>
    /// 获取当前控制器所对应的菜单id
    /// </summary>
    /// <returns></returns>
    [NonAction]
    public string GetCurrentMenuId() => this._menuId;

    /// <summary>
    /// 获取菜单名称
    /// </summary>
    /// <returns></returns>
    [NonAction]
    public string GetMenuName() => this._menuName;

    /// <summary>
    /// 设置菜单名称
    /// </summary>
    /// <param name="menuName"></param>
    /// <returns></returns>
    [NonAction]
    public void SetMenuName(string menuName)
    {
        _menuName = menuName;
    }
}