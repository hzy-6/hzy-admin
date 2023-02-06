using HZY.Framework.AutoRegisterIOC;
using HZY.Framework.Core;
using HZY.Models.Entities.Quartz;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using Quartz;
using System.Diagnostics;

namespace HZY.Managers.Quartz.Jobs
{
    /// <summary>
    /// Resultful 风格 Api Job
    /// </summary>
    [DisallowConcurrentExecution]
    public class WebApiJob : IJob, ITransientSelfDependency
    {
        private readonly Stopwatch _stopwatch;
        private readonly IApiRequestService _apiRequestService;
        private readonly ILogger<WebApiJob> _logger;

        public WebApiJob(IApiRequestService apiRequestService, ILogger<WebApiJob> logger)
        {
            _stopwatch = new Stopwatch();
            _apiRequestService = apiRequestService;
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
                var _taskService = scope.ServiceProvider.GetService<ITaskService>();
                var _jobLoggerService = scope.ServiceProvider.GetService<IJobLoggerService>();
                var quartzJobTask = JsonConvert.DeserializeObject<QuartzJobTask>(jobTaskString);

                if (quartzJobTask == null)
                {
                    _logger.LogError("quartzJobTask is NULL !");
                    return;
                }

                var time = DateTime.Now;
                var taskId = quartzJobTask?.Id ?? Guid.Empty;

                var text = $"任务={quartzJobTask.Name}|组={quartzJobTask.GroupName}|{time:yyyy-MM-dd}|Time={time: HH:mm:ss:fff} - ";

                var result = await _apiRequestService.RequestAsync(quartzJobTask.RequsetMode ?? QuartzJobTaskRequsetModeEnum.Post, quartzJobTask.JobPoint);

                if (!result.IsSuccess)
                {
                    _logger.LogError($"Web Api RequestAsync(); 请求失败! WebApi 返回结果:{result.Message}");
                }

                await _taskService.UpdateExecuteTime(taskId, time);

                var endTime = $"{DateTime.Now:HH:mm:ss:fff}";

                _stopwatch.Stop();

                //运行结束记录
                text += $"{endTime}|结果={result.Message}|耗时={_stopwatch.ElapsedMilliseconds} 毫秒";
                _jobLoggerService.Write(new QuartzJobTaskLog()
                {
                    Id = Guid.NewGuid(),
                    JobTaskId = taskId,
                    Text = text
                });

            }
            catch (Exception ex)
            {
                var message = $@">>>>>>>>>>>>>>> 定时任务 {nameof(WebApiJob)} Message={ex.Message}\r\n
StackTrace={ex.StackTrace}\r\n
Source={ex.Source}\r\n";

                _logger.LogError(ex, message, null);
            }
        }
    }
}
