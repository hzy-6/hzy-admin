namespace HZY.Core.Quartz.Jobs;

/// <summary>
/// 本地事件任务
/// </summary>
[DisallowConcurrentExecution]
public class MemoryEventJob : IJob, ITransientSelfDependency
{
    private readonly ILogger<MemoryJob> _logger;

    public MemoryEventJob(ILogger<MemoryJob> logger)
    {
        _logger = logger;
    }

    /// <summary>
    /// 执行
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    public async Task Execute(IJobExecutionContext context)
    {
        // JobTaskInfoCallKey
        var jobTaskInfoCall = context.MergedJobDataMap.Get(QuartzStartupConfig.JobTaskInfoCallKey) as Action;
        if (jobTaskInfoCall == null)
        {
            _logger.LogError($"{nameof(jobTaskInfoCall)} is NULL !");
            return;
        }

        jobTaskInfoCall?.Invoke();
        await Task.CompletedTask;
    }


}
