namespace HZY.Core.Quartz.Jobs;

/// <summary>
/// 异步任务
/// </summary>
public class MemoryJobAsync : QuartzJobBase<QuartzJobEntity>, ITransientSelfDependency
{
    private string text = string.Empty;

    public MemoryJobAsync(ILogger<MemoryJobAsync> logger) : base(logger)
    {

    }

    protected override Task BeforeExecutionAsync(IServiceProvider serviceProvider, QuartzJobEntity quartzJobInfo)
    {
        var time = DateTime.Now;

        text = $"任务={quartzJobInfo.Name}|组={quartzJobInfo.GroupName}|{time:yyyy-MM-dd}|Time={time: HH:mm:ss:fff} -";

        return base.BeforeExecutionAsync(serviceProvider, quartzJobInfo);
    }

    protected override Task OnSuccessAsync(
        IServiceProvider serviceProvider,
        QuartzJobEntity quartzJobInfo,
        object? result)
    {
        var timeConsuming = _stopwatch.ElapsedMilliseconds / 1000;

        _logger.LogInformation($"{text} {DateTime.Now.ToString("HH:mm:ss:fff")} 耗时={timeConsuming}s  - {result}");

        return base.OnSuccessAsync(serviceProvider, quartzJobInfo, result);
    }

    protected override Task OnExceptionAsync(IServiceProvider serviceProvider, QuartzJobEntity quartzJobInfo, Exception exception)
    {
        _logger.LogError(exception, $"{this.GetType().FullName} - {exception.Message}");
        return base.OnExceptionAsync(serviceProvider, quartzJobInfo, exception);
    }
}

