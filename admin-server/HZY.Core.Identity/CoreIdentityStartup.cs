namespace HZY.Core.Identity;

/// <summary>
/// 程序启动器 - 身份认证 注册、认证
/// </summary>
public class CoreIdentityStartup : Startup<CoreIdentityStartup>
{
    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        // 注册身份认证
        webApplicationBuilder.AddIdentity();
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {

        // 使用身份认证
        webApplication.UseIdentity();

    }

}
