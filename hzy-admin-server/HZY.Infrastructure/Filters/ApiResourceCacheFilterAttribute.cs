using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Caching.Memory;
using System;

namespace HZY.Infrastructure.Filters;

/// <summary>
/// 接口资源加载过滤 拦截资源做缓存
/// </summary>
public class ApiResourceCacheFilterAttribute : Attribute, IResourceFilter
{
    private IMemoryCache _memoryCache;
    private readonly double _cacheTime;

    public ApiResourceCacheFilterAttribute(double cacheTime = 30)
    {
        _cacheTime = cacheTime;
    }

    /// <summary>
    /// 资源加载之前
    /// </summary>
    /// <param name="context"></param>
    public void OnResourceExecuting(ResourceExecutingContext context)
    {
        _memoryCache = context.HttpContext.RequestServices.GetService(typeof(IMemoryCache)) as IMemoryCache;

        var apiResourceCacheKey = GetCacheKey(context.HttpContext);
        var result = _memoryCache.Get(apiResourceCacheKey);
        if (result != null)
        {
            context.Result = result as IActionResult;
        }

    }

    /// <summary>
    /// 资源加载之后
    /// </summary>
    /// <param name="context"></param>
    public void OnResourceExecuted(ResourceExecutedContext context)
    {
        _memoryCache = context.HttpContext.RequestServices.GetService(typeof(IMemoryCache)) as IMemoryCache;

        var apiResourceCacheKey = GetCacheKey(context.HttpContext);
        var result = _memoryCache.Get(apiResourceCacheKey);

        if (result == null && context.Result != null)
        {
            _memoryCache.Set(apiResourceCacheKey, context.Result, DateTime.Now.AddSeconds(_cacheTime));
        }
    }

    /// <summary>
    /// 获取每个唯一请求的缓存 key
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    private string GetCacheKey(HttpContext context)
    {
        var requestId = context.TraceIdentifier.Split(':')[0];
        return $"{requestId}=>{context.Request.Path.ToString()?.ToLower()}";
    }


}