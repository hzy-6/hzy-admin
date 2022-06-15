using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using HZY.Infrastructure;
using HZY.Models.Consts;
using HZY.Services.Admin.Framework;

namespace HZY.WebHost.Middlewares;

/// <summary>
/// 统计耗时 并记录日志中 中间件
/// </summary>
public class TakeUpTimeMiddleware : IMiddleware
{
    private readonly Stopwatch _stopwatch;
    private readonly ILogger _logger;
    private readonly SysOperationLogService _sysOperationLogService;
    private readonly HttpContext _httpContext;
    private readonly AppConfiguration _appConfiguration;

    public TakeUpTimeMiddleware(ILogger<TakeUpTimeMiddleware> logger,
        SysOperationLogService sysOperationLogService,
        IHttpContextAccessor iHttpContextAccessor,
        AppConfiguration appConfiguration)
    {
        this._stopwatch ??= new Stopwatch();
        _logger = logger;
        _sysOperationLogService = sysOperationLogService;
        _httpContext = iHttpContextAccessor.HttpContext;
        _appConfiguration = appConfiguration;
    }

    public async Task InvokeAsync(HttpContext context, RequestDelegate next)
    {
        var apiList = _appConfiguration.Configs.ApiWhiteList.Split("|").ToList();
        var path = context.Request.Path;

        if (apiList.Any(w => path.ToString().ToLower().Contains(w.ToLower())))
        {
            await next.Invoke(context);
            return;
        }

        //获取body
        var bodyString = await this.ReadBodyAsync();

        //记录 api 执行耗时
        _stopwatch.Restart();

        await next.Invoke(context);

        _stopwatch.Stop();

        if (this.IsApi(context))
        {
            var remoteIpAddress = context.Connection.RemoteIpAddress;
            var log = $"{remoteIpAddress} 请求：{path} 耗时：{_stopwatch.ElapsedMilliseconds} 毫秒!";
            _logger.LogInformation(log);

            var endpoint = context.GetEndpoint();

            await _sysOperationLogService.WriteInLogAsync(_stopwatch.ElapsedMilliseconds, bodyString, endpoint);
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
        return string.IsNullOrWhiteSpace(context.Response.ContentType) || contentTypes.Any(w => context.Response.ContentType.StartsWith(w));
    }

    /// <summary>
    /// 读取 body 信息
    /// </summary>
    /// <returns></returns>
    private async Task<string> ReadBodyAsync()
    {
        //获取body
        _httpContext.Request.EnableBuffering();//可以实现多次读取Body
        var sr = new StreamReader(_httpContext.Request.Body);
        var bodyString = await sr.ReadToEndAsync();
        _httpContext.Request.Body.Seek(0, SeekOrigin.Begin);

        return bodyString;
    }

}