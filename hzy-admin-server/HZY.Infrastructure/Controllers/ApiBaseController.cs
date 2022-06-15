using HZY.Infrastructure.Filters;
using Microsoft.AspNetCore.Mvc;

namespace HZY.Infrastructure.Controllers;

public class ApiBaseController<TDefaultService> : ApiBaseController where TDefaultService : class
{
    /// <summary>
    /// 默认服务
    /// </summary>
    protected readonly TDefaultService _defaultService;

    public ApiBaseController(TDefaultService defaultService)
    {
        this._defaultService = defaultService;
    }

}

/// <summary>
/// 控制器服务
/// </summary>
[ApiResultFilter]
[ApiController]
[Route("api/[controller]")]
public class ApiBaseController : ControllerBase
{


}