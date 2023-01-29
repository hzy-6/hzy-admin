using HZY.Framework.AutoRegisterIOC;
using HZY.Models.Entities.Quartz;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Quartz;
using System.Diagnostics;

namespace HZY.Managers.Quartz.Jobs
{
    /// <summary>
    /// Resultful 风格 Api Job
    /// </summary>
    [DisallowConcurrentExecution]
    public class ResultfulApiJob : IJob, ITransientSelfDependency
    {
        private readonly IApiRequestService _apiRequestService;
        private readonly ILogger<ResultfulApiJob> _logger;
        private readonly Stopwatch _stopwatch;

        public ResultfulApiJob(IApiRequestService apiRequestService, ILogger<ResultfulApiJob> logger)
        {
            _apiRequestService = apiRequestService;
            _logger = logger;
            _stopwatch = new Stopwatch();
        }

        public async Task Execute(IJobExecutionContext context)
        {
            try
            {
                _stopwatch.Restart();

                var tasksId = context.MergedJobDataMap.GetString(QuartzStartupConfig.JobTaskId)?.ToString();

                if (string.IsNullOrWhiteSpace(tasksId))
                {
                    _logger.LogError($"{QuartzStartupConfig.JobTaskId} 空!");
                    return;
                }

                using var scope = IOCUtil.CreateScope();
                var _taskService = scope.ServiceProvider.GetService<ITaskService>();
                var _jobLoggerService = scope.ServiceProvider.GetService<IJobLoggerService>();
                var quartzJobTask = await _taskService.FindByIdAsync(Guid.Parse(tasksId));

                if (quartzJobTask == null)
                {
                    _logger.LogError("tasks 空!");
                    return;
                }

                //运行开始记录
                //_jobLogger.Write(new JobLoggerInfo()
                //{
                //    Id = Guid.NewGuid(),
                //    TasksId = tasks.Id ?? Guid.Empty,
                //    Text = $"[执行任务Start] Id={tasks.Id}、Name={tasks.Name}、GroupName={tasks.GroupName}",
                //    CreateTime = DateTime.Now
                //});

                var time = DateTime.Now;
                var taskId = quartzJobTask?.Id ?? Guid.Empty;

                var text = $"任务={quartzJobTask.Name}|组={quartzJobTask.GroupName}|{time:yyyy-MM-dd}|StartTime={time: HH:mm:ss:fff}|";

                var result = await _apiRequestService.RequestAsync(quartzJobTask.RequsetMode, quartzJobTask.ApiUrl, quartzJobTask.HeaderToken);

                if (result.IsSuccess)
                {
                    await _taskService.UpdateExecuteTime(taskId, time);
                }
                else
                {
                    _logger.LogError($"Web Api RequestAsync(); 请求失败! WebApi 返回结果:{result.Message}");
                }

                _stopwatch.Stop();

                var endTime = $"{DateTime.Now:HH:mm:ss:fff}";

                //运行结束记录
                text += $"EndTime={endTime}|耗时={_stopwatch.ElapsedMilliseconds} 毫秒|结果={result.Message}";
                _jobLoggerService.Write(new QuartzJobTaskLog()
                {
                    Id = Guid.NewGuid(),
                    JobTaskId = taskId,
                    Text = text
                });
            }
            catch (Exception ex)
            {
                var message = $@"Message={ex.Message}\r\n
StackTrace={ex.StackTrace}\r\n
Source={ex.Source}\r\n";

                _logger.LogError(ex, message, null);
            }
        }
    }
}
