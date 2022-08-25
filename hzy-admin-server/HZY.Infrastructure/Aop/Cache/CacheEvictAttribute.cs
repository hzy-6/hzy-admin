using System.Collections;
using System.Reflection;
using HzyScanDiService;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.DependencyInjection;
using StackExchange.Redis;

namespace HZY.Infrastructure.Aop.Cache
{
    /// <summary>
    /// 清除缓存AOP
    /// </summary>
    [AttributeUsage(AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
    public class CacheEvictAttribute : BaseCacheAttribute
    {
        private readonly Type _cacheClassType;
        private readonly string _actionName;

        public CacheEvictAttribute()
        {

        }

        /// <summary>
        /// 用于设置 默认 缓存key 需要 ，自动组合默认缓存名称
        /// </summary>
        /// <param name="cacheClassType">缓存 类 类型</param>
        /// <param name="actionName">缓存函数名称</param>
        public CacheEvictAttribute(Type cacheClassType, string actionName)
        {
            _cacheClassType = cacheClassType;
            _actionName = actionName;
        }

        protected override string GetCacheKey(AopContext context)
        {
            if (_cacheClassType != null && !string.IsNullOrWhiteSpace(_actionName))
            {
                return _cacheClassType?.FullName + "." + _actionName;
            }

            return base.GetCacheKey(context);
        }

        /// <summary>
        /// 移除时机  默认方法执行完
        /// </summary>
        /// <value></value>
        public bool BeforeRun { get; set; } = false;

        /// <inheritdoc/>
        public override void Before(AopContext aopContext)
        {
            if (BeforeRun)
            {
                RemoveKey(aopContext);
            }
        }

        /// <inheritdoc/>
        public override void Before<TResult>(AopContext aopContext)
        {
            if (BeforeRun)
            {
                RemoveKey(aopContext);
            }
        }

        /// <inheritdoc/>
        public override void After(AopContext aopContext)
        {
            if (!BeforeRun)
            {
                RemoveKey(aopContext);
            }
        }
        /// <inheritdoc/>

        public override void After<TResult>(AopContext aopContext, TResult result)
        {
            if (!BeforeRun)
            {
                RemoveKey(aopContext);
            }
        }

        /// <summary>
        /// 移除key
        /// </summary>
        /// <param name="aopContext"></param>
        private void RemoveKey(AopContext aopContext)
        {
            if (RedisServiceType == null)
            {
                RemoveMemoryKey(aopContext);
            }
            else
            {
                RemoveRedisKey(aopContext);
            }
        }

        /// <summary>
        /// 移除redis key
        /// </summary>
        /// <param name="aopContext"></param>
        private void RemoveRedisKey(AopContext aopContext)
        {
            var cacheKey = GetCacheKey(aopContext);
            if (cacheKey.Contains('*'))
            {
                RemoveRedisGroupKey(aopContext, cacheKey);
            }
            else
            {
                var redisCache = GetDatabase(aopContext);
                redisCache.KeyDelete(cacheKey);
            }
        }

        /// <summary>
        /// 移除Redis分组的key
        /// </summary>
        /// <param name="aopContext"></param>
        /// <param name="cacheKey"></param>
        private void RemoveRedisGroupKey(AopContext aopContext, string cacheKey)
        {
            var redisMultiplexer = GetMultiplexer(aopContext);
            List<RedisKey> redisKeys = new List<RedisKey>();
            var endPoints = redisMultiplexer.GetEndPoints();
            foreach (var endPoint in endPoints)
            {
                var server = redisMultiplexer.GetServer(endPoint);
                foreach (var key in server.Keys(pattern: cacheKey))
                {
                    redisKeys.Add(key);
                }
            }

            var redisCache = GetDatabase(aopContext);
            redisCache.KeyDelete(redisKeys.ToArray());
        }

        /// <summary>
        /// 移除内存key
        /// </summary>
        /// <param name="aopContext"></param>
        private void RemoveMemoryKey(AopContext aopContext)
        {
            var cacheKey = GetCacheKey(aopContext);
            var cache = aopContext.ServiceProvider.CreateScope().ServiceProvider.GetRequiredService<IMemoryCache>();
            // 是否要进行前缀或后缀匹配
            if (cacheKey.StartsWith('*'))
            {
                var pattern = cacheKey.Substring(1, cacheKey.Length - 1);
                RemoveMemoryGroupKey(pattern, cache, false);
            }
            else if (cacheKey.EndsWith('*'))
            {
                var pattern = cacheKey.Substring(0, cacheKey.Length - 1);
                RemoveMemoryGroupKey(pattern, cache, true);
            }
            else
            {
                cache.Remove(cacheKey);
            }
        }

        /// <summary>
        /// 移除内存缓存分组的 key
        /// </summary>
        /// <param name="pattern"></param>
        /// <param name="memoryCache"></param>
        /// <param name="isStart"></param>
        private void RemoveMemoryGroupKey(string pattern, IMemoryCache memoryCache, bool isStart)
        {
            var entries = memoryCache.GetType().GetField("_entries", BindingFlags.Instance | BindingFlags.NonPublic)?.GetValue(memoryCache) as IDictionary;
            if (entries != null)
            {
                List<string> keys = new List<string>();

                if (isStart)
                {
                    // 前缀模式匹配
                    foreach (var key in entries.Keys)
                    {
                        var k = key as string;
                        if (k != null)
                        {
                            if (k.StartsWith(pattern))
                            {
                                keys.Add(k);
                            }
                        }
                    }
                }
                else
                {
                    // 尾缀模式匹配
                    foreach (var key in entries.Keys)
                    {
                        var k = key as string;
                        if (k != null)
                        {
                            if (k.EndsWith(pattern))
                            {
                                keys.Add(k);
                            }
                        }
                    }
                }

                foreach (var key in keys)
                {
                    memoryCache.Remove(key);
                }
            }
            else
            {
                throw new Exception("前缀或尾缀匹配不可用!");
            }
        }

        private IConnectionMultiplexer GetMultiplexer(AopContext aopContext)
        {
            var redisService = aopContext.ServiceProvider.GetRequiredService(RedisServiceType);
            var propertyInfos = redisService.GetType().GetProperties(BindingFlags.Instance | BindingFlags.Public);
            var databasePropertyInfo = propertyInfos.FirstOrDefault(w => w.PropertyType == typeof(IConnectionMultiplexer));
            if (databasePropertyInfo == null)
            {
                throw new Exception($"Redis服务 {RedisServiceType.FullName} 找不到属性 public IConnectionMultiplexer {nameof(IConnectionMultiplexer)} {{get;}}");
            }
            // 获取 idatabase
            var redisCache = (IConnectionMultiplexer)databasePropertyInfo.GetValue(redisService);
            if (redisCache == null)
            {
                throw new Exception($"Redis服务 {RedisServiceType.FullName} 属性 public IConnectionMultiplexer {nameof(IConnectionMultiplexer)} {{get;}} 是 null ");
            }

            return redisCache;
        }
    }
}