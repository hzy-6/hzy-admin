namespace HZY.Api.Admin.Controllers.Indentity;

/// <summary>
/// IndentityControllerBase
/// </summary>
[ApiResultFilter]
[Route(RoutePrefix + "/[controller]/[action]")]
public class IndentityControllerBase : ControllerBase
{
    /// <summary>
    /// 路由前缀
    /// </summary>
    public const string RoutePrefix = "/api/v1/identity";

}
