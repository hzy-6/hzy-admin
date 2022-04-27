using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Infrastructure.Redis
{
    public class RedisServiceExtensions
    {

        /// <summary>
        /// 注册 Redis 模块
        /// </summary>
        /// <param name="services"></param>
        /// <param name="connectionString"></param>
        public static void RegisterRedisRepository(IServiceCollection services, string connectionString)
        {
            services.AddSingleton<IRedisService, RedisService>(serviceProvider => new RedisService(connectionString));
        }


    }
}
