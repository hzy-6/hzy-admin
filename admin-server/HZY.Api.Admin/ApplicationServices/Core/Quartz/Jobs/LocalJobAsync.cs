namespace HZY.Api.Admin.ApplicationServices.Core.Quartz.Jobs;

/// <summary>
/// 本地任务
/// </summary>
public class LocalJobAsync : QuartzJobBase<QuartzJob>, ITransientSelfDependency
{
    private string text = string.Empty;

    public LocalJobAsync(ILogger<LocalJobAsync> logger) : base(logger)
    {

    }

    protected override Task BeforeExecutionAsync(IServiceProvider serviceProvider, QuartzJob quartzJobInfo)
    {
        var time = DateTime.Now;

        text = $"任务={quartzJobInfo.Name}|组={quartzJobInfo.GroupName}|{time:yyyy-MM-dd}|Time={time: HH:mm:ss:fff} -";

        return base.BeforeExecutionAsync(serviceProvider, quartzJobInfo);
    }

    protected override async Task OnSuccessAsync(
        IServiceProvider serviceProvider,
        QuartzJob quartzJobInfo,
        object? result)
    {
        var timeConsuming = _stopwatch.ElapsedMilliseconds / 1000;

        _logger.LogInformation($"{text} {DateTime.Now.ToString("HH:mm:ss:fff")} 耗时={timeConsuming}s - {result}");

        var taskId = quartzJobInfo?.Id ?? Guid.Empty;

        var jobLoggerService = serviceProvider.GetService<IJobLoggerService>();
        var taskService = serviceProvider.GetService<ITaskService>();
        if (jobLoggerService is null) return;
        if (taskService is null) return;

        await taskService.UpdateExecuteTime(taskId, DateTime.Now);

        var endTime = $"{DateTime.Now:HH:mm:ss:fff}";

        //运行结束记录
        text += $"{endTime}|耗时={timeConsuming}s|结果={result}";
        jobLoggerService.Write(new QuartzJobLog()
        {
            Id = Guid.NewGuid(),
            JobId = taskId,
            Text = text
        });
    }

    protected override Task OnExceptionAsync(IServiceProvider serviceProvider, QuartzJob quartzJobInfo, Exception exception)
    {
        text = "异常=" + exception.Message;
        _logger.LogError(exception, $"{GetType().FullName} - {exception.Message}");
        return base.OnExceptionAsync(serviceProvider, quartzJobInfo, exception);
    }

}
