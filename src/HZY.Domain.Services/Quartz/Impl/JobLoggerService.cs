using HZY.Domain.Services.Quartz.Models;
using HZY.Infrastructure.Redis;
using Newtonsoft.Json;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Domain.Services.Quartz.Impl
{
    /// <summary>
    /// Job 运行 日志
    /// </summary>
    public class JobLoggerService : IJobLoggerService
    {
        private ConcurrentBag<JobLoggerInfo> jobLoggerInfos;
        private string JobLoggerKey = "HZY.Infrastructure.Quartz:JobLogger";
        private long ListMaxValue = 9999;//集合最大值
        private readonly IRedisService _redisService;

        public JobLoggerService(IRedisService redisService)
        {
            jobLoggerInfos ??= new ConcurrentBag<JobLoggerInfo>();
            _redisService = redisService;
        }

        public IEnumerable<JobLoggerInfo> FindListById(Guid tasksId)
        {
            if (tasksId == Guid.Empty) return new ConcurrentBag<JobLoggerInfo>();
            var json = _redisService.Database.StringGet($"{JobLoggerKey}:{tasksId}");
            return string.IsNullOrWhiteSpace(json) ? new List<JobLoggerInfo>() : JsonConvert.DeserializeObject<List<JobLoggerInfo>>(json);
        }

        public void Write(JobLoggerInfo jobLoggerInfo)
        {
            if (jobLoggerInfo == null) return;
            var tasksId = jobLoggerInfo?.TasksId ?? Guid.Empty;

            var list = this.FindListById(tasksId)?.ToList() ?? new List<JobLoggerInfo>();
            if (list.Count > ListMaxValue)
            {
                list.Clear();
                list ??= new List<JobLoggerInfo>();
            }

            list.Add(jobLoggerInfo);

            _redisService.Database.StringSet($"{JobLoggerKey}:{tasksId}", JsonConvert.SerializeObject(list), TimeSpan.FromDays(1));
        }





    }
}
