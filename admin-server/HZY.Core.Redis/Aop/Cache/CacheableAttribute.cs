namespace HZY.Core.Redis.Aop.Cache;

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

    /// <summary>
    /// 
    /// </summary>
    /// <param name="context"></param>
    public override void OnEntry(MethodContext context)
    {
        if (RedisServiceType == null)
        {
            GetMemoryCache(context);
            return;
        }

        GetRedisCache(context);
    }

    public override void OnException(MethodContext context)
    {

    }

    public override void OnSuccess(MethodContext context)
    {
        if (context.ReturnValue == null)
        {
            return;
        }

        CreateCache(context, context.ReturnValue);
    }

    public override void OnExit(MethodContext context)
    {

    }

    /// <summary>
    /// 获取 MemoryCache 缓存
    /// </summary>
    /// <param name="context"></param>
    private void GetMemoryCache(MethodContext context)
    {
        var key = GetCacheKey(context);
        var memoryCache = this.GetService<IMemoryCache>(context);
        context.ReplaceReturnValue(this, memoryCache.Get(key));
    }

    /// <summary>
    /// 获取 RedisCache 缓存
    /// </summary>
    /// <param name="context"></param>
    private void GetRedisCache(MethodContext context)
    {
        var key = GetCacheKey(context);
        var redisCache = GetDatabase(context);
        var value = redisCache.StringGet(key);

        var val = string.IsNullOrWhiteSpace(value) ? null : JsonConvert.DeserializeObject(value, context.RealReturnType);

        if (val == null) return;

        context.ReplaceReturnValue(this, val);
    }

    /// <summary>
    /// 创建缓存
    /// </summary>
    /// <param name="MethodContext"></param>
    /// <param name="result"></param>
    private void CreateCache(MethodContext MethodContext, object result)
    {
        if (RedisServiceType == null)
        {
            CreateMemoryCache(MethodContext, result);
            return;
        }

        CreateRedisCache(MethodContext, result);
    }

    /// <summary>
    /// 创建内存缓存
    /// </summary>
    /// <param name="context"></param>
    /// <param name="result"></param>
    private void CreateMemoryCache(MethodContext context, object result)
    {
        var memoryCache = this.GetService<IMemoryCache>(context);
        var key = GetCacheKey(context);

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
    /// <param name="context"></param>
    /// <param name="result"></param>
    private void CreateRedisCache(MethodContext context, object result)
    {
        var redisCache = GetDatabase(context);
        var key = GetCacheKey(context);

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