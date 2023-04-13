namespace HZY.Api.Admin.Controllers;

/// <summary>
/// 后台系统基础控制器
/// </summary>
[ApiResultFilter]
[Route(AdminControllerBase.RoutePrefix + "/[controller]/[action]")]
[Authorize]//是否授权 Authorize
[ApiController]
public class AdminControllerBase : ControllerBase
{
    /// <summary>
    /// 路由前缀
    /// </summary>
    public const string RoutePrefix = $"/api/v1/admin";

    /// <summary>
    /// 管理系统基础控制器构造函数
    /// </summary>
    public AdminControllerBase() { }
}

/// <summary>
/// 后台系统基础控制器
/// </summary>
/// <typeparam name="TService"></typeparam>
public class AdminControllerBase<TService> : AdminControllerBase where TService : class
{
    /// <summary>
    /// 默认服务
    /// </summary>
    protected readonly TService _defaultService;

    /// <summary>
    /// 管理系统基础控制器构造函数
    /// </summary>
    /// <param name="defaultService">默认服务</param>
    public AdminControllerBase(TService defaultService)
    {
        _defaultService = defaultService;
    }
}
