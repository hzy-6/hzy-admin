namespace HZY.Core.Filters;

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
            var result = error.GetApiResult();

            if (result.Code == (int)HttpStatusCode.Unauthorized)
            {
                this.Unauthorized(context);
                return;
            }

            context.ExceptionHandled = true;
            context.HttpContext.Response.StatusCode = 200;
            context.Result = new JsonResult(result);
            return;
        }

        if (context.HttpContext.Response.StatusCode == (int)HttpStatusCode.Unauthorized)
        {
            this.Unauthorized(context);
            return;
        }

        //nlog 写入日志到 txt
        context.HttpContext.Response.StatusCode = (int)HttpStatusCode.InternalServerError;
        _logger.LogError(exception, context.HttpContext.Connection.RemoteIpAddress?.ToString());
        var message = $"服务端异常![异常消息：{exception.Message}]";
        var apiResult = R.ResultMessage(HttpStatusCode.InternalServerError, message);
        context.Result = new JsonResult(apiResult);
    }

    /// <summary>
    /// 未授权
    /// </summary>
    /// <param name="context"></param>
    private void Unauthorized(ExceptionContext context)
    {
        context.ExceptionHandled = true;
        context.HttpContext.Response.StatusCode = (int)HttpStatusCode.Unauthorized;
        context.Result = new JsonResult(R.ResultMessage(HttpStatusCode.Unauthorized, "未授权!"));
    }
}