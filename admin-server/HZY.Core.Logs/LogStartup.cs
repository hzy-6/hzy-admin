namespace HZY.Core.Logs;

public class LogStartup : StartupModule<LogStartup>
{
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        // 日志配置
        webApplicationBuilder.AddLogUtil();

        // 文件浏览器
        webApplicationBuilder.Services.AddDirectoryBrowser();
    }

    /// <summary>
    /// 使用服务
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {
        #region 日志文件浏览器配置

        var provider = new FileExtensionContentTypeProvider();
        //添加之后能够识别.log
        provider.Mappings[".log"] = "text/plain;charset=utf-8";

        var url = AppDomain.CurrentDomain.BaseDirectory + "AppLogs";
        if (!Directory.Exists(url))
        {
            Directory.CreateDirectory(url);
        }

        var path = new PhysicalFileProvider(AppDomain.CurrentDomain.BaseDirectory + "AppLogs");
        var reqPath = $"/{Tools.GetAppName(webApplication.Environment.ApplicationName)}/logs";

        webApplication.UseStaticFiles(new StaticFileOptions
        {
            FileProvider = path,
            RequestPath = reqPath,
            ServeUnknownFileTypes = true,
            ContentTypeProvider = provider
        });

        webApplication.UseFileServer(new FileServerOptions
        {
            FileProvider = path,
            RequestPath = reqPath,
            EnableDirectoryBrowsing = true,
        });

        #endregion


    }






}
