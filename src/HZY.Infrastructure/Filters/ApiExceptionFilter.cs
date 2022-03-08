using System.Net;
using HZY.Infrastructure.ApiResultManage;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Logging;

namespace HZY.Infrastructure.Filters;

/// <summary>
/// 异常过滤器
/// </summary>
public class ApiExceptionFilter : IExceptionFilter, IOrderedFilter
{
    private readonly ILogger<ApiExceptionFilter> _logger;

    public ApiExceptionFilter(ILogger<ApiExceptionFilter> logger)
    {
        _logger = logger;
    }

    public int Order { get; set; } = int.MaxValue - 10;

    public void OnException(ExceptionContext context)
    {
        var exception = context.Exception;
        if (exception is MessageBox error)
        {
            context.ExceptionHandled = true;
            context.HttpContext.Response.StatusCode = 200;
            context.Result = new JsonResult(error.GetApiResult());
            return;
        }

        if (context.HttpContext.Response.StatusCode == (int)HttpStatusCode.Unauthorized)
        {
            context.ExceptionHandled = true;
            context.HttpContext.Response.StatusCode = 200;
            context.Result = new JsonResult(ApiResult.ResultMessage(ApiResultCodeEnum.UnAuth, "未授权!"));
            return;
        }

        //nlog 写入日志到 txt
        _logger.LogError(exception, context.HttpContext.Connection.RemoteIpAddress?.ToString());
        var message = $"服务端出现异常![异常消息：{exception.Message}]";
        var apiResult = ApiResult.ResultMessage(ApiResultCodeEnum.Error, message);
        context.Result = new JsonResult(apiResult);
    }
}