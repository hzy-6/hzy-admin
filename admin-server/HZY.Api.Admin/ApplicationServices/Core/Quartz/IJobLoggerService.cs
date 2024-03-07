namespace HZY.Api.Admin.ApplicationServices.Core.Quartz;

/// <summary>
/// Job 运行 日志
/// </summary>
public interface IJobLoggerService : ITransientDependency
{
    void Write(QuartzJobLog jobLoggerInfo);

    List<QuartzJobLog> FindListById(Guid tasksId, int page, int size, out int total);

}