namespace HZY.WinFormDemo;

/// <summary>
/// 程序启动器
/// </summary>
[ImportStartup(
    typeof(AdminRepositoryStartup),
    typeof(LogStartup)
    )]
public class WinFormDemoStartup : StartupModule<WinFormDemoStartup>
{
    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        base.ConfigureServices(webApplicationBuilder);
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {
        base.Configure(webApplication);


    }

    /// <summary>
    /// 程序启动
    /// </summary>
    /// <param name="webApplication"></param>
    public override void ApplicationStarted(WebApplication webApplication)
    {

    }

}
