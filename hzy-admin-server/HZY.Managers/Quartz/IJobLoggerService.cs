using HZY.Managers.Quartz.Models;
using HzyScanDiService;

namespace HZY.Managers.Quartz
{
    /// <summary>
    /// Job 运行 日志
    /// </summary>
    public interface IJobLoggerService : ISingletonDependency
    {

        void Write(JobLoggerInfo jobLoggerInfo);

        IEnumerable<JobLoggerInfo> FindListById(Guid tasksId,int page,int size);

    }
}
