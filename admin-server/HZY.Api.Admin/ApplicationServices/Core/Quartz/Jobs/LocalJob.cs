namespace HZY.Api.Admin.ApplicationServices.Core.Quartz.Jobs;

/// <summary>
/// 本地任务
/// </summary>
[DisallowConcurrentExecution]
public class LocalJob : LocalJobAsync, ITransientSelfDependency
{
    public LocalJob(ILogger<LocalJob> logger) : base(logger)
    {

    }

}
