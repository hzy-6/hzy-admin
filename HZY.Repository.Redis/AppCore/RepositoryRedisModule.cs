using FreeRedis;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Repository.Redis.AppCore
{
    /// <summary>
    /// Redis 模块
    /// </summary>
    public class RepositoryRedisModule
    {
        /// <summary>
        /// 注册 Redis 模块
        /// </summary>
        /// <param name="services"></param>
        /// <param name="connectionString"></param>
        public static void RegisterRedisRepository(IServiceCollection services, string connectionString)
        {
            var cli = new RedisClient(connectionString);

            cli.Notice += (s, e) =>
            {
                Console.WriteLine("Redis>Log>" + e.Log);
                //Console.WriteLine("Redis>Tag>" + JsonConvert.SerializeObject(s));
            };

            cli.UseClientSideCaching(new ClientSideCachingOptions
            {
                //Client cache capacity
                Capacity = 3,
                //Filtering rules, which specify which keys can be cached locally
                //KeyFilter = key => key.StartsWith("Interceptor"),
                //Check long-term unused cache
                CheckExpired = (key, dt) => DateTime.Now.Subtract(dt) > TimeSpan.FromSeconds(2)
            });

            services.AddSingleton(cli);
        }









    }
}
