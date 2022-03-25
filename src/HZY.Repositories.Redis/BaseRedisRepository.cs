using HZY.Infrastructure.Redis;
using HzyScanDiService.Interface;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace HZY.Repositories.Redis;

/// <summary>
/// Redis 仓储
/// </summary>
public class BaseRedisRepository : IDiTransientSelf
{
    //private readonly IRedisService _redisService;
    //private readonly ILogger _logger;

    //public RedisRepository(IRedisService redisService, ILogger<RedisRepository> logger)
    //{
    //    _redisService = redisService;
    //    _logger = logger;
    //}

    ///// <summary>
    ///// 设置 plc 原数据
    ///// </summary>
    ///// <param name="key"></param>
    ///// <param name="data"></param>
    //public void SetPlcOriginalData(string key, string data)
    //{
    //    _redisService.Database.Publish(key, data);
    //}

    ///// <summary>
    ///// 监听器
    ///// </summary>
    ///// <param name="key"></param>
    //public void Listener(string key)
    //{
    //    _redisService.Multiplexer.GetSubscriber().Subscribe(key, (message, data) =>
    //    {
    //        _logger.LogInformation($"Message={message} Data={JsonConvert.SerializeObject(data)}");
    //    });
    //}

}
