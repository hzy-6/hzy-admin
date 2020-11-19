using System;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;

namespace HZY.Redis.Service
{
    /// <summary>
    /// Redis 扩展
    /// </summary>
    public static class RedisExtensions
    {
        /// <summary>
        /// json 配置
        /// </summary>
        /// <value></value>
        static JsonSerializerSettings JsonConfig
            => new JsonSerializerSettings
            {
                ReferenceLoopHandling = ReferenceLoopHandling.Ignore,
                NullValueHandling = NullValueHandling.Ignore
            };

        /// <summary>
        /// 注册 Redis 服务
        /// </summary>
        /// <param name="service"></param>
        /// <param name="connectionString"></param>
        public static void RegisterRedisService(this IServiceCollection service, string connectionString)
            => service.AddSingleton<IRedisService, RedisService>(serviceProvider => new RedisService(connectionString));

        /// <summary>
        /// 根据 key 获取数据
        /// </summary>
        /// <param name="redisService"></param>
        /// <param name="key"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static async Task<T> FindByKeyAsync<T>(this IRedisService redisService, string key)
        {
            var database = redisService.Database;

            var redisPackageContent = await database.StringGetAsync(key);

            if (string.IsNullOrWhiteSpace(redisPackageContent)) return default;

            var redisPackage = JsonConvert.DeserializeObject<RedisPackage<T>>(redisPackageContent, JsonConfig);

            return redisPackage == null ? default : redisPackage.Body;
        }

        /// <summary>
        /// 根据 key 插入 或者 修改 数据
        /// </summary>
        /// <param name="redisService"></param>
        /// <param name="key"></param>
        /// <param name="data"></param>
        /// <param name="cacheTime"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static async Task AddOrUpdateByKeyAsync<T>(this IRedisService redisService, string key, T data,
            DateTime? cacheTime = null)
        {
            var database = redisService.Database;

            var keyExists = await database.KeyExistsAsync(key);
            if (keyExists)
            {
                await database.KeyDeleteAsync(key);
            }

            var redisPackage = new RedisPackage<T>(data, cacheTime);

            var redisPackageContent = JsonConvert.SerializeObject(redisPackage, JsonConfig);

            await database.StringSetAsync(key, redisPackageContent, TimeSpan.FromSeconds(redisPackage.ExpirationTime));
        }

        /// <summary>
        /// 根据 key 查看是否存在
        /// </summary>
        /// <param name="redisService"></param>
        /// <param name="key"></param>
        /// <returns></returns>
        public static Task<bool> ExistsByKeyAsync(this IRedisService redisService, string key)
        {
            var database = redisService.Database;

            return database.KeyExistsAsync(key);
        }

        /// <summary>
        /// 根据 key 移除数据
        /// </summary>
        /// <param name="redisService"></param>
        /// <param name="key"></param>
        /// <returns></returns>
        public static async Task<bool> DeleteByKeyAsync(this IRedisService redisService, string key)
        {
            var database = redisService.Database;

            var keyExists = await database.KeyExistsAsync(key);

            if (keyExists)
            {
                return await database.KeyDeleteAsync(key);
            }

            return true;
        }
    }
}