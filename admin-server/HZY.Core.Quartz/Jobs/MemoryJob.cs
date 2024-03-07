namespace HZY.Core.Quartz.Jobs;

/// <summary>
/// 本地同步任务
/// </summary>
[DisallowConcurrentExecution]
public class MemoryJob : MemoryJobAsync
{
    public MemoryJob(ILogger<MemoryJob> logger) : base(logger)
    {
    }
}
