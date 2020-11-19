using System.Diagnostics;
using System.Threading.Tasks;
using HZY.Toolkit;
using Microsoft.AspNetCore.Http;

namespace HZY.Framework.Middleware
{
    /// <summary>
    /// 统计耗时 并记录日志中 中间件
    /// </summary>
    public class TakeUpTimeMiddleware : IMiddleware
    {
        private readonly Stopwatch _stopwatch;

        public TakeUpTimeMiddleware()
        {
            this._stopwatch ??= new Stopwatch();
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
                LogUtil.Write(log);
            }
        }

        /// <summary>
        /// 判断请求类型 是否 是 api
        /// </summary>
        /// <param name="context"></param>
        /// <returns></returns>
        private bool IsApi(HttpContext context)
        {
            var contentTypes = new[] {"application/json", "text/html"};

            var flag = false;

            foreach (var item in contentTypes)
            {
                flag = context.Response.ContentType.StartsWith(item);

                if (flag) break;
            }

            return flag;
        }
    }
}