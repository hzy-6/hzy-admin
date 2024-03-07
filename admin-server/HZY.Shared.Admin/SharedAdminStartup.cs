namespace HZY.Shared.Admin;

/// <summary>
/// 共享库 启动器
/// </summary>
public class SharedAdminStartup : StartupModule<SharedAdminStartup>
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

    }
}
