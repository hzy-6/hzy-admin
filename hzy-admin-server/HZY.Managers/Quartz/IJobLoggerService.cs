using HZY.Managers.Quartz.Models;
using HzyScanDiService;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Managers.Quartz
{
    /// <summary>
    /// Job 运行 日志
    /// </summary>
    public interface IJobLoggerService : ISingletonDependency
    {

        void Write(JobLoggerInfo jobLoggerInfo);

        IEnumerable<JobLoggerInfo> FindListById(Guid tasksId);

    }
}
