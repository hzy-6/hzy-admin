using HZY.Framework.AutoRegisterIOC;
using HZY.Models.Entities.Quartz;

namespace HZY.Managers.Quartz
{
    /// <summary>
    /// Job 运行 日志
    /// </summary>
    public interface IJobLoggerService : ITransientDependency
    {
        void Write(QuartzJobTaskLog jobLoggerInfo);

        List<QuartzJobTaskLog> FindListById(Guid tasksId, int page, int size);

    }
}
