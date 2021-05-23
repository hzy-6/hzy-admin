using FreeRedis;
using HZY.Common.ScanDIService.Interface;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace HZY.Repository.Redis
{
    /// <summary>
    /// Redis 仓储
    /// </summary>
    public class RedisRepository : IDITransientSelf
    {
        private readonly RedisClient _redisClient;
        private readonly ILogger _logger;

        //public RedisRepository(RedisClient redisClient, ILogger<RedisRepository> logger)
        //{
        //    _redisClient = redisClient;
        //    _logger = logger;
        //}

        /// <summary>
        /// 设置 plc 原数据
        /// </summary>
        /// <param name="key"></param>
        /// <param name="data"></param>
        public void SetPlcOriginalData(string key, string data)
        {
            _redisClient.Publish(key, data);
        }

        /// <summary>
        /// 监听器
        /// </summary>
        /// <param name="key"></param>
        public void Listener(string key)
        {
            _redisClient.Subscribe(key, (message, data) =>
            {
                _logger.LogInformation($"Message={message} Data={JsonConvert.SerializeObject(data)}");
            });
        }

    }
}
