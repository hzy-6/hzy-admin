namespace HZY.Shared.Filters;

/// <summary>
/// 授权认证 拦截 Token
/// </summary>
public class ApiAuthorizationFilter : IAsyncAuthorizationFilter
{
    private readonly IAccountService _accountService;

    /// <summary>
    /// 授权认证 拦截
    /// </summary>
    /// <param name="accountService"></param>
    public ApiAuthorizationFilter(IAccountService accountService)
    {
        _accountService = accountService;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    public async Task OnAuthorizationAsync(AuthorizationFilterContext context)
    {
        await Task.CompletedTask;

        var httpContext = context.HttpContext;
        const string unAuthMessage = "未授权,请先授权访问!";
        var routeValues = context.ActionDescriptor.RouteValues;
        //var areaName = routeValues["area"];
        var controllerName = routeValues["controller"];
        var actionName = routeValues["action"];

        #region 检查 [AuthorizeAttribute] 标记 和取消授权标记 [AllowAnonymousAttribute]

        //如果有 AllowAnonymousAttribute 标记则忽略授权检查
        var allowAnonymousAttribute = context.ActionDescriptor.EndpointMetadata.Any(w => w is AllowAnonymousAttribute);
        if (allowAnonymousAttribute) return;

        //获取 AuthorizeAttribute 如果存在则需要检查权限
        var authorizeAttribute = context.ActionDescriptor.EndpointMetadata.Any(w => w is AuthorizeAttribute);
        if (!authorizeAttribute) return;

        #endregion

        //验证 token 是否过期无效 或者 检查 token 是否授权
        if (!_accountService.IsValidate)
        {
            context.Result = new JsonResult(R.ResultMessage(HttpStatusCode.Unauthorized, unAuthMessage));
        }
    }

}
