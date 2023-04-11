namespace HZY.Core.Razor;

/// <summary>
/// 
/// </summary>
public class CoreRazorStartup : Startup<CoreRazorStartup>
{
    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        var services = webApplicationBuilder.Services;


    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {

    }



}
