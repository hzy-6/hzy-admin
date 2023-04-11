namespace HZY.Shared.Middlewares;

/// <summary>
/// 统计耗时 并记录接口访问日志 中间件
/// </summary>
public class TakeUpTimeMiddleware : IMiddleware
{
    private readonly Stopwatch _stopwatch;
    private readonly Microsoft.Extensions.Logging.ILogger _logger;
    private readonly HttpContext _httpContext;
    private readonly IAccountService _accountService;
    private readonly IProducer _producer;

    /// <summary>
    /// 统计耗时 并记录日志中 中间件
    /// </summary>
    /// <param name="logger"></param>
    /// <param name="iHttpContextAccessor"></param>
    /// <param name="accountService"></param>
    /// <param name="producer"></param>
    public TakeUpTimeMiddleware(ILogger<TakeUpTimeMiddleware> logger,
        IHttpContextAccessor iHttpContextAccessor,
        IAccountService accountService,
        IProducer producer)
    {
        _stopwatch ??= new Stopwatch();
        _logger = logger;
        _httpContext = iHttpContextAccessor.HttpContext;
        _accountService = accountService;
        _producer = producer;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="context"></param>
    /// <param name="next"></param>
    /// <returns></returns>
    public async Task InvokeAsync(HttpContext context, RequestDelegate next)
    {
        var apiList = new string[] {
            "/MonitorEFCore/",
            "/job/",
            "/health/check"
        };

        var path = context.Request.Path;

        if (apiList.Any(w => path.ToString().ToLower().Contains(w.ToLower())))
        {
            await next.Invoke(context);
            return;
        }

        //获取body
        var bodyString = await ReadBodyAsync();

        //记录 api 执行耗时
        _stopwatch.Restart();

        await next.Invoke(context);

        _stopwatch.Stop();

        if (IsApi(context))
        {
            var remoteIpAddress = context.Connection.RemoteIpAddress;
            var log = $"{remoteIpAddress} 请求：{path} 耗时：{_stopwatch.ElapsedMilliseconds} 毫秒!";
            _logger.LogInformation(log);

            var endpoint = context.GetEndpoint();

            await WriteInLogAsync(_stopwatch.ElapsedMilliseconds, bodyString, endpoint);
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


    /// <summary>
    /// 写入操作日志
    /// </summary>
    /// <returns></returns>
    public async Task WriteInLogAsync(long time, string bodyString, Endpoint endpoint)
    {
        var queryString = _httpContext.Request.QueryString.ToString();
        var apiUrl = _httpContext.Request.Path;

        //获取请求ip
        var ip = _httpContext.Request.Headers["X-Forwarded-For"].FirstOrDefault();
        if (string.IsNullOrEmpty(ip))
        {
            ip = _httpContext.Connection.RemoteIpAddress.MapToIPv4().ToString();
        }
        //
        var clientInfo = _httpContext.GetBrowserClientInfo();
        var browser = clientInfo?.UA.Family + clientInfo?.UA.Major;
        var os = clientInfo?.OS.Family + clientInfo?.OS.Major;

        //本机不记录
        // if (_IP == "::1") return;

        var formString = string.Empty;

        //form
        try
        {
            if (_httpContext.Request.HasFormContentType)
            {
                //读取 表单 信息
                var form = await _httpContext.Request.ReadFormAsync();
                if (form != null)
                {
                    var _Dictionary = new Dictionary<string, object>();
                    foreach (var key in form.Keys)
                    {
                        _Dictionary[key] = form[key];
                    }

                    formString = JsonConvert.SerializeObject(_Dictionary);
                }

            }
        }
        catch (Exception) { }

        var userInfo = _accountService.GetAccountContext();
        var sysOperationLog = new SysOperationLog
        {
            Api = apiUrl,
            Ip = ip,
            Form = formString,
            QueryString = queryString,
            FormBody = bodyString,
            UserId = userInfo?.Id,
            TakeUpTime = time,
            Browser = browser,
            OS = os,
        };

        //
        if (endpoint != null)
        {
            var controllerDescriptorAttribute = endpoint.Metadata.GetMetadata<ControllerDescriptorAttribute>();
            var actionDescriptorAttribute = endpoint.Metadata.GetMetadata<ActionDescriptorAttribute>();
            sysOperationLog.ControllerDisplayName = controllerDescriptorAttribute?.DisplayName;
            sysOperationLog.ActionDisplayName = actionDescriptorAttribute?.DisplayName;
        }

        // 发布消息
        await _producer.PublishAsync("WriteInLog", sysOperationLog);
    }


















}