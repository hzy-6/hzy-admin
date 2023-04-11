using HZY.Core.Redis.Services;

namespace HZY.Core.Redis.Configs;

/// <summary>
/// redis 配置类
/// </summary>
public static class RedisConfig
{

    /// <summary>
    /// 注册 Redis 模块
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    /// <exception cref="ArgumentNullException"></exception>
    public static void AddRedisService(this WebApplicationBuilder webApplicationBuilder)
    {
        var connectionString = webApplicationBuilder.Configuration["ConnectionStrings:Redis"];

        if (string.IsNullOrWhiteSpace(connectionString))
        {
            throw new ArgumentNullException("ConnectionStrings:Redis 配置信息读取失败！");
        }

        webApplicationBuilder.Services.AddSingleton(typeof(IRedisService), serviceProvider => new RedisServiceImpl(connectionString));
    }



}
