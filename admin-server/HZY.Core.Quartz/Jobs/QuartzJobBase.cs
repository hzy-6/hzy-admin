namespace HZY.Core.Quartz.Jobs;

/// <summary>
/// 任务基础类
/// </summary>
/// <typeparam name="TQuartzJobInfo"></typeparam>
public abstract class QuartzJobBase<TQuartzJobInfo> : IJob
    where TQuartzJobInfo : class, IQuartzJobInfoEntity
{
    protected readonly ILogger _logger;
    protected readonly Stopwatch _stopwatch;

    public QuartzJobBase(ILogger logger)
    {
        _logger = logger;
        _stopwatch = new Stopwatch();
    }

    public virtual async Task Execute(IJobExecutionContext context)
    {
        var quartzJobTask = context.MergedJobDataMap.Get(QuartzStartupConfig.JobTaskKey) as TQuartzJobInfo;

        if (quartzJobTask == null)
        {
            _logger.LogWarning("quartzJobTask is NULL !");
            return;
        }

        using var scope = App.CreateScope();
        if (scope is null) return;
        _stopwatch.Restart();

        await this.BeforeExecutionAsync(scope.ServiceProvider, quartzJobTask);

        object? result = null;

        try
        {
            result = await this.RunAsync(scope.ServiceProvider, quartzJobTask);
            // 执行成功
            _stopwatch.Stop();
            await this.OnSuccessAsync(scope.ServiceProvider, quartzJobTask, result);
        }
        catch (Exception ex)
        {
            // 执行成功
            _stopwatch.Stop();
            _logger.LogError(ex, $"{this.GetType().FullName}.Execute Execution failed : {ex.Message}");
            result = ex.Message;
            await this.OnExceptionAsync(scope.ServiceProvider, quartzJobTask, ex);
        }
        finally
        {
            await this.OnExitAsync(scope.ServiceProvider, quartzJobTask, result);
        }
    }

    /// <summary>
    /// 运行逻辑
    /// </summary>
    /// <param name="serviceProvider"></param>
    /// <param name="quartzJobInfo"></param>
    /// <returns></returns>
    protected virtual async Task<object?> RunAsync(IServiceProvider serviceProvider,
        TQuartzJobInfo quartzJobInfo)
    {
        object? result = null;

        var jobTaskInfo = App.JobTaskInfos.FirstOrDefault(w => w.Key == quartzJobInfo.JobPoint);

        if (jobTaskInfo == null)
        {
            _logger.LogWarning($"jobTaskInfo is NULL !");
            result += "jobTaskInfo is NULL !";
            return result;
        }

        var jobTaskObject = ActivatorUtilities.CreateInstance(serviceProvider, jobTaskInfo.ClassType);// di 创建服务

        var method = jobTaskObject.GetType().GetMethod(jobTaskInfo.MethodInfo.Name);
        var methodResult = method?.Invoke(jobTaskObject, Array.Empty<object>());

        // 异步函数处理
        if (methodResult is Task)
        {
            if (methodResult.GetType().IsGenericType)
            {
                //await (Task)methodResult;
                var _value = methodResult.GetType().GetProperty(nameof(Task<object>.Result))?.GetValue(methodResult);
                result = _value?.ToString();
            }
            else
            {
                await ((Task)methodResult).WaitAsync(CancellationToken.None);
            }
        }
        else
        {
            result = methodResult?.ToString();
        }

        return result;
    }

    /// <summary>
    /// 执行前
    /// </summary>
    /// <param name="serviceProvider"></param>
    /// <param name="quartzJobInfo"></param>
    /// <returns></returns>
    protected virtual Task BeforeExecutionAsync(IServiceProvider serviceProvider, TQuartzJobInfo quartzJobInfo)
    {
        return Task.CompletedTask;
    }

    /// <summary>
    /// 执行后，退出
    /// </summary>
    /// <param name="serviceProvider"></param>
    /// <param name="quartzJobInfo"></param>
    /// <param name="result"></param>
    /// <returns></returns>
    protected virtual Task OnExitAsync(
        IServiceProvider serviceProvider,
        TQuartzJobInfo quartzJobInfo,
        object? result)
    {
        return Task.CompletedTask;
    }

    /// <summary>
    /// 成功执行
    /// </summary>
    /// <param name="serviceProvider"></param>
    /// <param name="quartzJobInfo"></param>
    /// <param name="result"></param>
    /// <returns></returns>
    protected virtual Task OnSuccessAsync(IServiceProvider serviceProvider,
        TQuartzJobInfo quartzJobInfo,
        object? result)
    {
        return Task.CompletedTask;
    }

    /// <summary>
    /// 异常处理
    /// </summary>
    /// <param name="serviceProvider"></param>
    /// <param name="quartzJobInfo"></param>
    /// <param name="exception"></param>
    /// <returns></returns>
    protected virtual Task OnExceptionAsync(
        IServiceProvider serviceProvider,
        TQuartzJobInfo quartzJobInfo,
        Exception exception)
    {
        return Task.CompletedTask;
    }

}
