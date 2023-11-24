namespace HZY.Api.Admin;

/// <summary>
/// 程序启动器
/// </summary>
[ImportStartup(
    typeof(CoreQuartzStartup),
    typeof(CoreRazorStartup),
    typeof(CoreRedisStartup),
    typeof(CoreIdentityStartup),
    typeof(AdminRepositoryStartup),
    typeof(RepositoryFreeSqlAdminStartup),
    typeof(CoreSwaggerJwtStartup)
    )]
public class ApiAdminStartup : AppStartupBase<ApiAdminStartup>
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

        #region 取消默认验证Api 接收参数模型 的 验证特性 如有 [ApiController]

        services.Configure<ApiBehaviorOptions>(options => { options.SuppressModelStateInvalidFilter = true; });

        #endregion

        // 注册源生成器的 代码
        //webApplicationBuilder.Services.AddDependencyInjectionGenerator();
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {
        base.Configure(webApplication);

        // 跳转客户端
        webApplication.MapGet("/", [AllowAnonymous] () => Results.Redirect("/client/index.html"));

        // 跳转离线文档
        webApplication.MapGet("/docs", [AllowAnonymous] () => Results.Redirect("/docs/index.html"));

        //SignalR
        webApplication.UseSignalRHubs();

    }

    /// <summary>
    /// 程序启动
    /// </summary>
    /// <param name="webApplication"></param>
    public override void ApplicationStarted(WebApplication webApplication)
    {
        // 启动定时任务
        if (webApplication.Configuration.GetSection("IsRunQuartzTask").Get<bool>())
        {
            webApplication.UseQuartzStartup();
        }
    }

}
