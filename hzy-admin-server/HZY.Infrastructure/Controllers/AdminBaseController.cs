using HZY.Infrastructure.Filters;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace HZY.Infrastructure.Controllers;


[Authorize(Policy = "WebHostPolicy")]//是否授权 Authorize
[ApiExplorerSettings(GroupName = nameof(ApiVersions.Admin))]
[Route("api/admin/[controller]")]
public class AdminBaseController<TDefaultService> : ApiBaseController<TDefaultService> where TDefaultService : class
{
    /// <summary>
    /// 管理系统基础控制器构造函数
    /// </summary>
    /// <param name="defaultService">默认服务</param>
    public AdminBaseController(TDefaultService defaultService) : base(defaultService)
    {

    }
}

[Authorize(Policy = "WebHostPolicy")]//是否授权 Authorize
[ApiExplorerSettings(GroupName = nameof(ApiVersions.Admin))]
[Route("api/admin/[controller]")]
public class AdminBaseController : ApiBaseController
{

    /// <summary>
    /// 管理系统基础控制器构造函数
    /// </summary>
    public AdminBaseController()
    {

    }

}