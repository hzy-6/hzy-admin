namespace HZY.Shared;

/// <summary>
/// 共享库 启动器
/// </summary>
public class SharedStartup : Startup<SharedStartup>
{
    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        var services = webApplicationBuilder.Services;
        //var configuration = webApplicationBuilder.Configuration;

        // 添加中间件
        services.AddScoped<TakeUpTimeMiddleware>();

        // 本地消息队列
        services.AddMemoryMQ();

        // MemoryCache
        services.AddMemoryCache();

        // 加入文件浏览器
        services.AddDirectoryBrowser();

        #region 上传文件最大长度

        //services.Configure<KestrelServerOptions>(options =>
        //{
        //    options.Limits.MaxRequestBodySize = appConfiguration.Configs.FileManager.GetMaxRequestBodySize();
        //});

        //services.Configure<FormOptions>(options =>
        //{
        //    options.MultipartBodyLengthLimit = appConfiguration.Configs.FileManager.GetMaxRequestBodySize();
        //});

        #endregion


    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {
        // 使用 Api 耗时计算中间件
        webApplication.UseMiddleware<TakeUpTimeMiddleware>();

        // 消息队列启动
        webApplication.UseMemoryMQ();

        #region 日志文件浏览器配置

        var provider = new FileExtensionContentTypeProvider();
        //添加之后能够识别.log
        provider.Mappings[".log"] = "text/plain;charset=utf-8";
        webApplication.UseStaticFiles(new StaticFileOptions
        {
            FileProvider = new PhysicalFileProvider(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "AppLogs")),
            RequestPath = "/logs",
            ServeUnknownFileTypes = true,
            ContentTypeProvider = provider
        });
        webApplication.UseFileServer(new FileServerOptions
        {
            FileProvider = new PhysicalFileProvider(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "AppLogs")),
            RequestPath = "/logs",
            EnableDirectoryBrowsing = true,
        });

        #endregion


    }
}
