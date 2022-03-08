using HZY.Infrastructure.ScanDIService.Interface;
using HZY.Quartz.Entitys;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Infrastructure.Quartz
{
    /// <summary>
    /// Job 运行 日志
    /// </summary>
    public interface IJobLoggerService : IDiSingleton
    {

        void Write(JobLoggerInfo jobLoggerInfo);

        IEnumerable<JobLoggerInfo> FindListById(Guid tasksId);

    }
}
