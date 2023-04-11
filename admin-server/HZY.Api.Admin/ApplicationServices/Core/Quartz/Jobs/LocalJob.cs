namespace HZY.Api.Admin.ApplicationServices.Core.Quartz.Jobs;

/// <summary>
/// 本地任务
/// </summary>
[DisallowConcurrentExecution]
public class LocalJob : IJob, ITransientSelfDependency
{
    private readonly Stopwatch _stopwatch;
    private readonly ILogger<WebApiJob> _logger;

    public LocalJob(ILogger<WebApiJob> logger)
    {
        _stopwatch = new Stopwatch();
        _logger = logger;
    }

    public async Task Execute(IJobExecutionContext context)
    {
        try
        {
            _stopwatch.Restart();

            var jobTaskString = context.MergedJobDataMap.GetString(QuartzStartupConfig.JobTaskKey)?.ToString();

            if (string.IsNullOrWhiteSpace(jobTaskString))
            {
                _logger.LogError($"jobTaskString is NULL !");
                return;
            }

            using var scope = App.CreateScope();
            var _jobLoggerService = scope.ServiceProvider.GetService<IJobLoggerService>();
            var quartzJobTask = JsonConvert.DeserializeObject<QuartzJobTask>(jobTaskString);

            if (quartzJobTask == null)
            {
                _logger.LogError("quartzJobTask is NULL !");
                return;
            }

            var jobTaskInfo = App.JobTaskInfos.FirstOrDefault(w => w.Key == quartzJobTask.JobPoint);

            if (jobTaskInfo == null)
            {
                _logger.LogError($"jobTaskInfo is NULL !");
                return;
            }

            var jobTaskObject = ActivatorUtilities.CreateInstance(scope.ServiceProvider, jobTaskInfo.ClassType);// di 创建服务

            if (jobTaskObject == null)
            {
                _logger.LogError($"jobTaskObject is not a dependency injection service ! [{jobTaskInfo.ClassType}]");
                return;
            }

            var time = DateTime.Now;
            var taskId = quartzJobTask?.Id ?? Guid.Empty;

            var text = $"任务={quartzJobTask.Name}|组={quartzJobTask.GroupName}|{time:yyyy-MM-dd}|Time={time: HH:mm:ss:fff} - ";

            var result = "执行完成";

            try
            {
                var method = jobTaskObject.GetType().GetMethod(jobTaskInfo.MethodInfo.Name);
                var methodResult = method?.Invoke(jobTaskObject, Array.Empty<object>());

                // 异步函数处理
                if (methodResult is Task)
                {
                    if (methodResult.GetType().IsGenericType)
                    {
                        var _value = methodResult.GetType().GetProperty(nameof(Task<object>.Result)).GetValue(methodResult);

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
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"Managers.Quartz.Jobs.LocalJob.Execute Execution failed : {ex.Message}");
                result = ex.Message;
            }

            result = result ?? "执行完成";

            var _taskService = scope.ServiceProvider.GetService<ITaskService>();

            await _taskService.UpdateExecuteTime(taskId, time);

            _stopwatch.Stop();

            var endTime = $"{DateTime.Now:HH:mm:ss:fff}";

            //运行结束记录
            text += $"{endTime}|结果={result}|耗时={_stopwatch.ElapsedMilliseconds} 毫秒";
            _jobLoggerService.Write(new QuartzJobTaskLog()
            {
                Id = Guid.NewGuid(),
                JobTaskId = taskId,
                Text = text
            });
        }
        catch (Exception ex)
        {
            var message = $@">>>>>>>>>>>>>>> 定时任务 {nameof(LocalJob)} Message={ex.Message}\r\n
StackTrace={ex.StackTrace}\r\n
Source={ex.Source}\r\n";

            _logger.LogError(ex, message, null);
        }
    }
}
