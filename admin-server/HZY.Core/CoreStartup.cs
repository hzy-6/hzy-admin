namespace HZY.Core;

/// <summary>
/// 程序启动器
/// </summary>
public class CoreStartup : Startup<CoreStartup>
{
    /// <summary>
    /// 程序启动器
    /// </summary>
    public CoreStartup() => Order = -1;

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        // 日志配置
        webApplicationBuilder.AddLogUtil();

    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {

    }

}
