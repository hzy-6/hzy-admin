using HZY.Infrastructure.ApiResultManage;
using HZY.Infrastructure.Filters.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Caching.Memory;

namespace HZY.Infrastructure.Filters
{
    /// <summary>
    /// 请求限制
    /// </summary>
    public class RequestLimitFilterAttribute : Attribute, IResourceFilter
    {
        private IMemoryCache _memoryCache;
        /// <summary>
        /// 请求范围内 单位：秒
        /// </summary>
        public double Duration { get; set; } = 1;
        /// <summary>
        /// 请求次数
        /// </summary>
        public int LimitCount { get; set; } = 3;
        /// <summary>
        /// 消息提醒内容
        /// </summary>
        public string Message { get; set; } = "请不要频繁操作!";

        /// <summary>
        /// 请求限制
        /// </summary>
        public RequestLimitFilterAttribute()
        {

        }

        /// <summary>
        /// 资源加载之前
        /// </summary>
        /// <param name="context"></param>
        public void OnResourceExecuting(ResourceExecutingContext context)
        {
            _memoryCache = context.HttpContext.RequestServices.GetService(typeof(IMemoryCache)) as IMemoryCache;
            var apiResourceCacheKey = GetCacheKey(context.HttpContext);

            var result = _memoryCache.Get<RequestLimitContext>(apiResourceCacheKey);
            if (result != null && (DateTime.Now - result.ActiveTime).Seconds <= Duration && result.LimitCount >= LimitCount)
            {
                context.Result = new JsonResult(ApiResult.ResultMessage(ApiResultCodeEnum.Error, Message));
                return;
            }

            //设置访问时间
            if (result == null)
            {
                result = new RequestLimitContext();
                result.ActiveTime = DateTime.Now;
                _memoryCache.Set(apiResourceCacheKey, result, DateTime.Now.AddSeconds(Duration + 1));
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

            var result = _memoryCache.Get<RequestLimitContext>(apiResourceCacheKey);

            //设置访问时间
            if (result != null)
            {
                result.LimitCount++;
            }
        }

        /// <summary>
        /// 获取每个唯一请求的缓存 key
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        private string GetCacheKey(HttpContext context)
        {
            return $"{context.Connection.RemoteIpAddress}=>{context.Request.Path.ToString()?.ToLower()}";
        }

    }
}
