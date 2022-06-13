using HZY.Infrastructure.Redis.Impl;
using Microsoft.Extensions.DependencyInjection;

namespace HZY.Infrastructure.Redis
{
    public static class RedisUtil
    {

        /// <summary>
        /// 注册 Redis 模块
        /// </summary>
        /// <param name="services"></param>
        /// <param name="connectionString"></param>
        public static void AddRedisService(this IServiceCollection services, string connectionString)
        {
            services.AddSingleton(typeof(IRedisService), serviceProvider => new RedisServiceImpl(connectionString));
        }



    }
}
