using HzyScanDiService;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.DependencyInjection;
using Newtonsoft.Json;

namespace HZY.Infrastructure.Aop.Cache
{
  /// <summary>
  /// 缓存AOP
  /// </summary>
  [AttributeUsage(AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
  public class CacheableAttribute : BaseCacheAttribute
  {
    /// <summary>
    /// 缓存时长 (秒) 默认存储 10s 如果0代表永久
    /// </summary>
    /// <value></value>
    public long CacheDuration { get; set; } = 10;

    /// <inheritdoc/>
    public override void Before(AopContext aopContext)
    {
      if (RedisServiceType == null)
      {
        GetMemoryCache(aopContext);
        return;
      }

      GetRedisCache(aopContext);
    }
    /// <inheritdoc/>

    public override void Before<TResult>(AopContext aopContext)
    {
      if (RedisServiceType == null)
      {
        GetMemoryCache(aopContext);
        return;
      }

      GetRedisCache<TResult>(aopContext);
    }

    /// <inheritdoc/>
    public override void After(AopContext aopContext)
    {
      if (aopContext.Invocation.ReturnValue == null)
      {
        return;
      }

      CreateCache(aopContext, aopContext.Invocation.ReturnValue);
    }
    /// <inheritdoc/>

    public override void After<TResult>(AopContext aopContext, TResult result)
    {
      if (aopContext.Invocation.ReturnValue == null)
      {
        return;
      }

      CreateCache(aopContext, result);
    }

    /// <summary>
    /// 获取 MemoryCache 缓存
    /// </summary>
    /// <param name="aopContext"></param>
    private void GetMemoryCache(AopContext aopContext)
    {
      var key = GetCacheKey(aopContext);
      var memoryCache = aopContext.ServiceProvider.GetRequiredService<IMemoryCache>();
      aopContext.Invocation.ReturnValue = memoryCache.Get(key);
    }

    /// <summary>
    /// 获取 RedisCache 缓存
    /// </summary>
    /// <param name="aopContext"></param>
    private void GetRedisCache(AopContext aopContext)
    {
      var key = GetCacheKey(aopContext);
      var redisCache = GetDatabase(aopContext);
      var value = redisCache.StringGet(key);
      aopContext.Invocation.ReturnValue = string.IsNullOrWhiteSpace(value) ? null : JsonConvert.DeserializeObject(value, aopContext.Invocation.Method.ReturnType);
    }

    /// <summary>
    /// 获取 RedisCache 缓存
    /// </summary>
    /// <param name="aopContext"></param>
    private void GetRedisCache<TResult>(AopContext aopContext)
    {
      var key = GetCacheKey(aopContext);
      var redisCache = GetDatabase(aopContext);
      var value = redisCache.StringGet(key);
      aopContext.Invocation.ReturnValue = string.IsNullOrWhiteSpace(value) ? null : JsonConvert.DeserializeObject<TResult>(value);
    }

    /// <summary>
    /// 创建缓存
    /// </summary>
    /// <param name="aopContext"></param>
    /// <param name="result"></param>
    private void CreateCache(AopContext aopContext, object result)
    {
      if (RedisServiceType == null)
      {
        CreateMemoryCache(aopContext, result);
        return;
      }

      CreateRedisCache(aopContext, result);
    }

    /// <summary>
    /// 创建内存缓存
    /// </summary>
    /// <param name="aopContext"></param>
    /// <param name="result"></param>
    private void CreateMemoryCache(AopContext aopContext, object result)
    {
      var memoryCache = aopContext.ServiceProvider.GetRequiredService<IMemoryCache>();
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
    /// 创建Redis缓存
    /// </summary>
    /// <param name="aopContext"></param>
    /// <param name="result"></param>
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
  }
}