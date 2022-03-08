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

}

[Authorize(Policy = "WebHostPolicy")]//是否授权 Authorize
[ApiExplorerSettings(GroupName = nameof(ApiVersions.Admin))]
[Route("api/admin/[controller]")]
public class AdminBaseController : ApiBaseController, IApiPermissionController
{
    private readonly string _menuId;

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
}