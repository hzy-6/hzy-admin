using System.Diagnostics;
using System.Threading.Tasks;
using HZY.Common;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using System.Linq;

namespace HZY.Framework.Middleware
{
    /// <summary>
    /// 统计耗时 并记录日志中 中间件
    /// </summary>
    public class TakeUpTimeMiddleware : IMiddleware
    {
        private readonly Stopwatch _stopwatch;
        private readonly ILogger<TakeUpTimeMiddleware> _logger;

        public TakeUpTimeMiddleware(ILogger<TakeUpTimeMiddleware> logger)
        {
            this._stopwatch ??= new Stopwatch();
            _logger = logger;
        }

        public async Task InvokeAsync(HttpContext context, RequestDelegate next)
        {
            //记录 api 执行耗时
            _stopwatch.Restart();

            await next.Invoke(context);

            _stopwatch.Stop();

            if (this.IsApi(context))
            {
                var remoteIpAddress = context.Connection.RemoteIpAddress;
                var path = context.Request.Path;
                var log = $"{remoteIpAddress} 请求：{path} 耗时：{_stopwatch.ElapsedMilliseconds} 毫秒!";
                _logger.LogInformation(log);
            }
        }

        /// <summary>
        /// 判断请求类型 是否 是 api
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        private bool IsApi(HttpContext context)
        {
            var contentTypes = new[] { "application/json", "text/html" };
            if (string.IsNullOrWhiteSpace(context.Response.ContentType)) return false;
            return contentTypes.Any(w => context.Response.ContentType.StartsWith(w));
        }
    }
}