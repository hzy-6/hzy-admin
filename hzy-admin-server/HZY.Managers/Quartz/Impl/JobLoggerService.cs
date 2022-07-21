using System.Collections.Concurrent;
using HZY.Infrastructure.Redis;
using HZY.Managers.Quartz.Models;
using Newtonsoft.Json;

namespace HZY.Managers.Quartz.Impl
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

        public IEnumerable<JobLoggerInfo> FindListById(Guid tasksId,int page,int size)
        {
            if (tasksId == Guid.Empty) return new ConcurrentBag<JobLoggerInfo>();
            int start = (page - 1) * size;
            int end = page * size;
            var jobLoggers = _redisService.Database.ListRange($"{JobLoggerKey}:{tasksId}", start, end);
            List<JobLoggerInfo> jobLoggerInfos = new List<JobLoggerInfo>();
            foreach (var jobLogger in jobLoggers)
            {
                var logger = JsonConvert.DeserializeObject<JobLoggerInfo>(jobLogger);
                if (logger != null)
                {
                    jobLoggerInfos.Add(logger);
                }
            }

            return jobLoggerInfos;
        }

        public void Write(JobLoggerInfo jobLoggerInfo)
        {
            if (jobLoggerInfo == null) return;
            var tasksId = jobLoggerInfo?.TasksId ?? Guid.Empty;

            var key = $"{JobLoggerKey}:{tasksId}";
            var length = _redisService.Database.ListLength(key);
            if (ListMaxValue > 0 && length >= ListMaxValue)
            {
                long count = length - ListMaxValue + 1;
                for (int i = 0; i < count; i++)
                {
                    _redisService.Database.ListRightPop(key);
                }
            }

            _redisService.Database.ListLeftPush(key, JsonConvert.SerializeObject(jobLoggerInfo));
            _redisService.Database.KeyExpire(key, TimeSpan.FromDays(1));
        }
    }
}
