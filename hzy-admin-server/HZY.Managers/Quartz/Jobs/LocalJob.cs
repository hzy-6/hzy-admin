using HZY.Framework.AutoRegisterIOC;
using HZY.Framework.Core.Utils;
using HZY.Models.Entities.Quartz;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Quartz;
using System.Diagnostics;

namespace HZY.Managers.Quartz.Jobs
{
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

                var tasksId = context.MergedJobDataMap.GetString(QuartzStartupConfig.JobTaskId)?.ToString();

                if (string.IsNullOrWhiteSpace(tasksId))
                {
                    _logger.LogError($"{QuartzStartupConfig.JobTaskId} is NULL !");
                    return;
                }

                using var scope = IOCUtil.CreateScope();
                var _taskService = scope.ServiceProvider.GetService<ITaskService>();
                var _jobLoggerService = scope.ServiceProvider.GetService<IJobLoggerService>();
                var quartzJobTask = await _taskService.FindByIdAsync(Guid.Parse(tasksId));

                if (quartzJobTask == null)
                {
                    _logger.LogError("tasks is NULL !");
                    return;
                }

                var jobTaskInfo = AppUtil.JobTaskInfos[quartzJobTask.JobPoint];

                var jobTaskObject = scope.ServiceProvider.GetService(jobTaskInfo.ClassType);

                if (jobTaskObject == null)
                {
                    _logger.LogError($"jobTaskObject is not a dependency injection service ! [{jobTaskInfo.ClassType}]");
                    return;
                }

                var time = DateTime.Now;
                var taskId = quartzJobTask?.Id ?? Guid.Empty;

                var text = $"任务={quartzJobTask.Name}|组={quartzJobTask.GroupName}|{time:yyyy-MM-dd}|StartTime={time: HH:mm:ss:fff}|";

                try
                {
                    var method = jobTaskObject.GetType().GetMethod(jobTaskInfo.MethodInfo.Name);
                    method?.Invoke(jobTaskObject, Array.Empty<object>());
                }
                catch (Exception ex)
                {
                    _logger.LogError(ex, $"Managers.Quartz.Jobs.LocalJob.Execute Execution failed : {ex.Message}");
                }
                finally
                {
                    await _taskService.UpdateExecuteTime(taskId, time);

                    _stopwatch.Stop();

                    var endTime = $"{DateTime.Now:HH:mm:ss:fff}";

                    //运行结束记录
                    text += $"EndTime={endTime}|耗时={_stopwatch.ElapsedMilliseconds} 毫秒|结果=执行完成!";
                    _jobLoggerService.Write(new QuartzJobTaskLog()
                    {
                        Id = Guid.NewGuid(),
                        JobTaskId = taskId,
                        Text = text
                    });

                }
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
}
