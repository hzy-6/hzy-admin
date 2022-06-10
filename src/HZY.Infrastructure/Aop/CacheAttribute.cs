using HzyScanDiService;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;
using StackExchange.Redis;

namespace HZY.Infrastructure.Aop
{
    /// <summary>
    /// 缓存拦截器
    /// </summary>
    [AttributeUsage(AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
    public class CacheAttribute : AopBaseAttribute
    {
        /// <summary>
        /// 缓存 key
        /// </summary>
        public string CacheKey { get; set; }

        /// <summary>
        /// Redis 服务类型
        /// </summary>
        public Type RedisServiceType { get; set; }

        /// <summary>
        /// 缓存时长 (秒)
        /// </summary>
        public long CacheDuration { get; set; } = 0;

        /// <summary>
        /// 缓存数据
        /// </summary>
        public CacheAttribute()
        {

        }

        /// <summary>
        /// 之前 开始获取缓存
        /// </summary>
        /// <param name="aopContext"></param>
        public override void Before(AopContext aopContext)
        {
            var key = GetCacheKey(aopContext);
            if (RedisServiceType == null)
            {
                var memoryCache = aopContext.ServiceProvider.GetService<IMemoryCache>();
                aopContext.Invocation.ReturnValue = memoryCache.Get(key);
                return;
            }

            var redisCache = (IDatabase)aopContext.ServiceProvider.GetService(RedisServiceType);
            if (redisCache == null) throw new Exception("请注册 Redis 服务 " + RedisServiceType.FullName);
            var value = redisCache.StringGet(key);
            aopContext.Invocation.ReturnValue = string.IsNullOrWhiteSpace(value) ?
                null : JsonConvert.DeserializeObject(value, aopContext.Invocation.Method.ReturnParameter.ParameterType);
        }

        /// <summary>
        /// 之后 开始存储缓存
        /// </summary>
        /// <param name="aopContext"></param>
        /// <exception cref="Exception"></exception>
        public override void After(AopContext aopContext)
        {
            if (aopContext.Invocation.ReturnValue == null)
            {
                return;
            }

            if (RedisServiceType == null)
            {
                this.CreateMemoryCache(aopContext, aopContext.Invocation.ReturnValue);
                return;
            }

            this.CreateRedisCache(aopContext, aopContext.Invocation.ReturnValue);
        }

        /// <summary>
        /// 之前 开始获取缓存
        /// </summary>
        /// <param name="aopContext"></param>
        public override void Before<TResult>(AopContext aopContext)
        {
            var key = GetCacheKey(aopContext);
            if (RedisServiceType == null)
            {
                var memoryCache = aopContext.ServiceProvider.GetService<IMemoryCache>();
                aopContext.Invocation.ReturnValue = memoryCache.Get(key);
                return;
            }

            var redisCache = (IDatabase)aopContext.ServiceProvider.GetService(RedisServiceType);
            if (redisCache == null) throw new Exception("请注册 Redis 服务 " + RedisServiceType.FullName);
            var value = redisCache.StringGet(key);
            aopContext.Invocation.ReturnValue = string.IsNullOrWhiteSpace(value) ? null : JsonConvert.DeserializeObject<TResult>(value);
        }

        /// <summary>
        /// 之后 开始存储缓存
        /// </summary>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="aopContext"></param>
        /// <param name="result">对 task 使用了 awite 后的结果</param>
        /// <exception cref="Exception"></exception>
        public override void After<TResult>(AopContext aopContext, TResult result)
        {
            if (aopContext.Invocation.ReturnValue == null)
            {
                return;
            }

            if (RedisServiceType == null)
            {
                this.CreateMemoryCache(aopContext, result);
                return;
            }

            this.CreateRedisCache(aopContext, result);
        }

        /// <summary>
        /// 获取缓存 key
        /// </summary>
        /// <param name="aopContext"></param>
        /// <returns></returns>
        private string GetCacheKey(AopContext aopContext)
        {
            if (!string.IsNullOrWhiteSpace(CacheKey)) return CacheKey;

            var name = aopContext.Invocation.Method.Name;
            var prefix = aopContext.Invocation.Method.DeclaringType.FullName;
            return prefix + "." + name;
        }

        /// <summary>
        /// 创建 MemoryCache 缓存
        /// </summary>
        /// <param name="aopContext"></param>
        /// <param name="result"></param>
        private void CreateMemoryCache(AopContext aopContext, object result)
        {
            var memoryCache = aopContext.ServiceProvider.GetService<IMemoryCache>();

            var key = GetCacheKey(aopContext);

            if (CacheDuration <= 0)
            {
                memoryCache.Set(key, result);
            }
            else
            {
                memoryCache.Set(key, result, TimeSpan.FromSeconds(CacheDuration));
            }
        }

        /// <summary>
        /// 创建 Redis 缓存
        /// </summary>
        /// <param name="aopContext"></param>
        /// <param name="result"></param>
        /// <exception cref="Exception"></exception>
        private void CreateRedisCache(AopContext aopContext, object result)
        {
            var redisCache = (IDatabase)aopContext.ServiceProvider.GetService(RedisServiceType);
            if (redisCache == null) throw new Exception("请注册 Redis 服务 " + RedisServiceType.FullName);

            var key = GetCacheKey(aopContext);

            if (CacheDuration <= 0)
            {
                redisCache.StringSet(key, JsonConvert.SerializeObject(result));
            }
            else
            {
                redisCache.StringSet(key, JsonConvert.SerializeObject(result), TimeSpan.FromSeconds(CacheDuration));
            }
        }


    }
}