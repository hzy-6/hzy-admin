using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using HZY.Services.Admin.Framework;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Infrastructure;
using HZY.Infrastructure.ApiResultManage;
using System.Linq;
using Microsoft.AspNetCore.Authorization;
using System.Threading.Tasks;
using HZY.Domain.Services.Accounts;

namespace HZY.WebHost.Filters;

/// <summary>
/// 授权认证 拦截
/// </summary>
public class ApiAuthorizationFilter : IAsyncAuthorizationFilter
{
    private readonly IAccountDomainService _accountService;

    public ApiAuthorizationFilter(IAccountDomainService accountService)
    {
        _accountService = accountService;
    }

    public async Task OnAuthorizationAsync(AuthorizationFilterContext context)
    {
        await Task.CompletedTask;

        var httpContext = context.HttpContext;
        const string unAuthMessage = "未授权,请先登录授权!";
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

        //检查 token 是否授权
        if (this._accountService.GetAccountInfo() == null)
        {
            var data = ApiResult.ResultMessage(ApiResultCodeEnum.UnAuth, unAuthMessage);
            context.Result = new JsonResult(data);
        }

        #endregion
    }

}