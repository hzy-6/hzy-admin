using HZY.Infrastructure.ApiResultManage;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using System;

namespace HZY.Infrastructure.Filters;

/// <summary>
/// Api 结果返回包装器
/// </summary>
public class ApiResultFilterAttribute : Attribute, IResultFilter
{
    public bool Ignore { get; set; }

    public ApiResultFilterAttribute(bool ignore = false)
    {
        Ignore = ignore;
    }

    /// <summary>
    /// 结果 返回前
    /// </summary>
    /// <param name="context"></param>
    public void OnResultExecuting(ResultExecutingContext context)
    {
        if (Ignore) return;

        if (context.Result == null)
        {
            return;
        }

        if (context.Result is ObjectResult)
        {
            var result = context.Result as ObjectResult;
            context.Result = new JsonResult(ApiResult.Ok("success", result.Value));
            return;
        }

        if (context.Result is ContentResult)
        {
            var result = context.Result as ContentResult;
            context.Result = new JsonResult(ApiResult.Ok("success", result.Content));
            return;
        }

    }

    /// <summary>
    /// 返回结果后
    /// </summary>
    /// <param name="context"></param>
    public void OnResultExecuted(ResultExecutedContext context)
    {
        //throw new NotImplementedException();
    }



}