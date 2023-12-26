namespace HZY.WinFormDemo;

/// <summary>
/// 程序启动器
/// </summary>
[ImportStartupModule<AdminRepositoryStartup, LogStartup>]
public class WinFormDemoStartup : StartupModule<WinFormDemoStartup>
{
    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        base.ConfigureServices(webApplicationBuilder);

        var services = webApplicationBuilder.Services;
        services.AddWindowsFormsBlazorWebView();
        // 加入 antd blazor 组件
        services.AddAntDesign();
        // 注册窗口
        services.AddSingleton<Form2>();

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
