namespace HZY.Core.Startups;

/// <summary>
/// 程序启动器 - 自动化注册服务
/// </summary>
public class CoreAutoRegisterIOCStartup : StartupModule<CoreAutoRegisterIOCStartup>
{
    /// <summary>
    /// 程序启动器
    /// </summary>
    public CoreAutoRegisterIOCStartup() => Order = -999;

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        // 扫描服务自动化注册
        webApplicationBuilder.Services
            .AddDependencyInjection(App.Startups.Select(w => w.GetType().Assembly).ToList());
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {

    }

}
