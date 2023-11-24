namespace HZY.Core.Identity;

/// <summary>
/// 程序启动器 - 身份认证 注册
/// </summary>
public class CoreIdentityAddStartup : StartupModule<CoreIdentityAddStartup>
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


}
