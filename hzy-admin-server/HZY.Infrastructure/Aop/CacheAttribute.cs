using System.Reflection;
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
        private Type RedisServiceType { get; }

        /// <summary>
        /// 缓存时长 (秒) 默认存储 10s 如果0代表永久
        /// </summary>
        public long CacheDuration { get; set; } = 10;

        /// <summary>
        /// 缓存数据
        /// </summary>
        public CacheAttribute()
        {

        }

        /// <summary>
        /// 缓存数据 需要传递 Redis 服务类型
        /// </summary>
        /// <param name="redisServiceType">Redis 服务类型</param>
        public CacheAttribute(Type redisServiceType)
        {
            RedisServiceType = redisServiceType;
        }

        /// <summary>
        /// 之前 开始获取缓存
        /// </summary>
        /// <param name="aopContext"></param>
        public override void Before(AopContext aopContext)
        {
            if (RedisServiceType == null)
            {
                this.GetMemoryCache(aopContext);
                return;
            }

            GetRedisCache(aopContext);
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
            if (RedisServiceType == null)
            {
                this.GetMemoryCache(aopContext);
                return;
            }

            this.GetRedisCache<TResult>(aopContext);
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
        /// 获取 MemoryCache 缓存
        /// </summary>
        /// <param name="aopContext"></param>
        private void GetMemoryCache(AopContext aopContext)
        {
            var key = GetCacheKey(aopContext);
            var memoryCache = aopContext.ServiceProvider.GetService<IMemoryCache>();
            aopContext.Invocation.ReturnValue = memoryCache.Get(key);
        }

        /// <summary>
        /// 创建 Redis 缓存
        /// </summary>
        /// <param name="aopContext"></param>
        /// <param name="result"></param>
        /// <exception cref="Exception"></exception>
        private void CreateRedisCache(AopContext aopContext, object result)
        {
            var redisCache = GetDatabase(aopContext);
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

        /// <summary>
        /// 获取 Redis 缓存
        /// </summary>
        /// <param name="aopContext"></param>
        /// <exception cref="Exception"></exception>
        private void GetRedisCache(AopContext aopContext)
        {
            var redisCache = GetDatabase(aopContext);
            var key = GetCacheKey(aopContext);
            var value = redisCache.StringGet(key);
            aopContext.Invocation.ReturnValue = string.IsNullOrWhiteSpace(value) ?
                null : JsonConvert.DeserializeObject(value, aopContext.Invocation.Method.ReturnParameter.ParameterType);
        }

        /// <summary>
        /// 获取 Redis 缓存
        /// </summary>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="aopContext"></param>
        /// <exception cref="Exception"></exception>
        private void GetRedisCache<TResult>(AopContext aopContext)
        {
            var redisCache = GetDatabase(aopContext);
            var key = GetCacheKey(aopContext);
            var value = redisCache.StringGet(key);
            aopContext.Invocation.ReturnValue = string.IsNullOrWhiteSpace(value) ? null : JsonConvert.DeserializeObject<TResult>(value);
        }

        /// <summary>
        /// 获取 Redis Database 对象
        /// </summary>
        /// <param name="aopContext"></param>
        /// <returns></returns>
        /// <exception cref="Exception"></exception>
        private IDatabase GetDatabase(AopContext aopContext)
        {
            var redisService = aopContext.ServiceProvider.GetService(RedisServiceType);
            if (redisService == null) throw new Exception("找不到 Redis 服务 " + RedisServiceType.FullName);
            var propertyInfos = redisService.GetType().GetProperties(BindingFlags.Instance | BindingFlags.Public);
            var databasePropertyInfo = propertyInfos.FirstOrDefault(w => w.Name == nameof(IDatabase.Database) && w.PropertyType == typeof(IDatabase));
            if (databasePropertyInfo == null)
            {
                throw new Exception($"Redis服务 {RedisServiceType.FullName} 找不到属性 public IDatabase {nameof(IDatabase.Database)} {{get;}}");
            }
            // 获取 idatabase
            var redisCache = (IDatabase)databasePropertyInfo.GetValue(redisService);
            if (redisCache == null)
            {
                throw new Exception($"Redis服务 {RedisServiceType.FullName} 属性 public IDatabase {nameof(IDatabase.Database)} {{get;}} 是 null ");
            }

            return redisCache;
        }

    }
}