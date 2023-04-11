namespace HZY.Shared;

/// <summary>
/// 基础启动器
/// </summary>
/// <typeparam name="TStartup"></typeparam>
[ImportStartup(typeof(CoreStartup))]
public class AppStartupBaseCore<TStartup> : Startup<TStartup> where TStartup : Framework.Core.AspNetCore.IStartup, new()
{
    /// <summary>
    /// 命名空间前缀
    /// </summary>
    protected string _namespacePrefix => Tools.GetNamespacePrefix<TStartup>() ?? "";

    /// <summary>
    /// 程序名称
    /// </summary>
    protected string? _appName => Tools.GetAppName<TStartup>();

    /// <summary>
    /// 基础启动器
    /// </summary>
    public AppStartupBaseCore() => Order = 0;

    /// <summary>
    /// 注册服务
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        var configuration = webApplicationBuilder.Configuration;

        // 扫描服务自动化注册
        webApplicationBuilder.Services.AddAutoRegisterIOC(App.Startups.Select(w => w.GetType().Assembly).ToList());

        webApplicationBuilder.Services.AddHttpContextAccessor();

        // 跨域配置 配置跨域处理
        webApplicationBuilder.AddCrossOrigin();

        // 控制器
        webApplicationBuilder.Services.AddControllers();
    }

    /// <summary>
    /// 使用服务
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {
        if (webApplication.Environment.IsDevelopment())
        {
            webApplication.UseDeveloperExceptionPage();
        }

        webApplication.UseHttpsRedirection();

        webApplication.UseRouting();

        webApplication.UseStaticFiles();

        // 使用跨域
        webApplication.UseCrossOrigin();

        // 控制器
        webApplication.MapControllers();
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplication"></param>
    public override void ApplicationStarted(WebApplication webApplication)
        => LogUtil.Log.Warning("Web 主机已启动");

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplication"></param>
    public override void ApplicationStopping(WebApplication webApplication)
    {
        LogUtil.Log.Warning("Web 主机停止中...");
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplication"></param>
    public override void ApplicationStopped(WebApplication webApplication)
        => LogUtil.Log.Warning("Web 主机已停止");

}
