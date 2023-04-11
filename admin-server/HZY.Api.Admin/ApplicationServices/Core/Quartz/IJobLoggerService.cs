namespace HZY.Api.Admin.ApplicationServices.Core.Quartz;

/// <summary>
/// Job 运行 日志
/// </summary>
public interface IJobLoggerService : ITransientDependency
{
    void Write(QuartzJobTaskLog jobLoggerInfo);

    List<QuartzJobTaskLog> FindListById(Guid tasksId, int page, int size);

}
