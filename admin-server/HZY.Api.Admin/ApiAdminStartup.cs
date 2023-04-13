using Yitter.IdGenerator;

namespace HZY.Api.Admin;

/// <summary>
/// 程序启动器
/// </summary>
[ImportStartup(typeof(CoreQuartzStartup),
    typeof(CoreRazorStartup),
    typeof(CoreRedisStartup),
    typeof(CoreIdentityStartup))]
public class ApiAdminStartup : MicroserviceStartupBase<ApiAdminStartup>
{
    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        base.ConfigureServices(webApplicationBuilder);

        var services = webApplicationBuilder.Services;
        var configuration = webApplicationBuilder.Configuration;
        var appConfiguration = new AppConfiguration(configuration);

        // Swagger 注册Swagger生成器，定义一个和多个Swagger 文档
        services.AddSwaggerGen(options =>
        {
            options.SwaggerDoc(_appName, new OpenApiInfo
            {
                Title = _appName
            });

            //为 Swagger JSON and UI设置xml文档注释路径
            Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory)
            .Where(w => w.EndsWith(".xml") && w.Contains(_namespacePrefix))
            .Select(w => w)
            .ToList()
            .ForEach(w => options.IncludeXmlComments(w, true))
            ;

            var jwtTokenOptions = webApplicationBuilder.Configuration.GetSection(nameof(JwtTokenOptions)).Get<JwtTokenOptions>();

            #region Jwt token 配置

            options.OperationFilter<AddResponseHeadersFilter>();
            options.OperationFilter<AppendAuthorizeToSummaryOperationFilter>();
            //很重要！这里配置安全校验，和之前的版本不一样
            options.OperationFilter<SecurityRequirementsOperationFilter>();
            //
            options.OperationFilter<FileUploadOperation>();
            //开启 oauth2 安全描述
            options.AddSecurityDefinition("oauth2", new OpenApiSecurityScheme
            {
                Description = "JWT授权(数据将在请求头中进行传输) 直接在下框中输入Bearer {token}（注意两者之间是一个空格）\"",
                In = ParameterLocation.Header,
                Name = jwtTokenOptions.JwtTokenKeyName,
                Type = SecuritySchemeType.ApiKey,
                //Scheme = "basic",
            });

            #endregion
        });

        services.AddControllers(options =>
        {
            options.Filters.Add<ApiAuthorizationFilter>();
            options.Filters.Add<ApiPermissionFilter>();
        });

        // 代码生成器需要开启 razor page 引擎
        webApplicationBuilder.Services.AddRazorPages();
        // razor 解决中文被编码
        webApplicationBuilder.Services.AddSingleton(HtmlEncoder.Create(UnicodeRanges.All));

        //SignalR
        services.AddSignalR();

        // 创建 IdGeneratorOptions 对象，可在构造函数中输入 WorkerId：
        var options = new IdGeneratorOptions((ushort)Thread.CurrentThread.ManagedThreadId);
        // options.WorkerIdBitLength = 10; // 默认值6，限定 WorkerId 最大值为2^6-1，即默认最多支持64个节点。
        // options.SeqBitLength = 6; // 默认值6，限制每毫秒生成的ID个数。若生成速度超过5万个/秒，建议加大 SeqBitLength 到 10。
        // options.BaseTime = Your_Base_Time; // 如果要兼容老系统的雪花算法，此处应设置为老系统的BaseTime。
        // ...... 其它参数参考 IdGeneratorOptions 定义。

        // 保存参数（务必调用，否则参数设置不生效）：
        YitIdHelper.SetIdGenerator(options);

        // 以上过程只需全局一次，且应在生成ID之前完成。

        // 初始化后，在任何需要生成ID的地方，调用以下方法：
        var newId = YitIdHelper.NextId();

        Console.WriteLine("雪花 id ：" + newId);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {
        base.Configure(webApplication);

        // 启用中间件服务生成Swagger作为JSON终结点
        webApplication.UseSwagger();
        // 启用中间件服务对swagger-ui，指定Swagger JSON终结点
        webApplication.UseSwaggerUI(option =>
        {
            option.SwaggerEndpoint($"{_appName}/swagger.json", _appName);
            option.RoutePrefix = "swagger";
        });

        // 跳转客户端
        webApplication.MapGet("/", [AllowAnonymous] () => Results.Redirect("/client/index.html"));

        //SignalR
        webApplication.UseSignalRHubs();

    }

    /// <summary>
    /// 程序启动
    /// </summary>
    /// <param name="webApplication"></param>
    public override void ApplicationStarted(WebApplication webApplication)
    {
        var appConfiguration = webApplication.Services.GetRequiredService<AppConfiguration>();

        // 启动定时任务
        if (appConfiguration.AppOptions.IsRunQuartzTask)
        {
            webApplication.UseQuartzStartup();
        }
    }

}
