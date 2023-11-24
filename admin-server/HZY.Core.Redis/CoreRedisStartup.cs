namespace HZY.Core.Redis;

/// <summary>
///  redis 启动器
/// </summary>
public class CoreRedisStartup : StartupModule<CoreRedisStartup>
{
    /// <summary>
    /// 配置服务
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        webApplicationBuilder.AddRedisService();
    }

    /// <summary>
    /// 启动服务
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {

    }

}

