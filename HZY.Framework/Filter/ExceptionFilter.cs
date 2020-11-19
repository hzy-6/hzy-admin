using System.Net;
using HZY.Framework.Model;
using HZY.Toolkit;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace HZY.Framework.Filter
{
    /// <summary>
    /// 异常过滤器
    /// </summary>
    public class ExceptionFilter : IExceptionFilter, IOrderedFilter
    {
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

            if (context.HttpContext.Response.StatusCode == (int) HttpStatusCode.Unauthorized)
            {
                context.ExceptionHandled = true;
                context.HttpContext.Response.StatusCode = 200;
                context.Result = new JsonResult(ApiResult.ResultMessage(ApiResult.ApiResultCodeEnum.UnAuth, "未授权!"));
                return;
            }

            //nlog 写入日志到 txt
            LogUtil.WriteError(exception, context.HttpContext.Connection.RemoteIpAddress?.ToString());
            var message = $"服务端出现异常![异常消息：{exception.Message}]";
            var apiResult = ApiResult.ResultMessage(ApiResult.ApiResultCodeEnum.Error, message);
            context.Result = new JsonResult(apiResult);
        }
    }
}