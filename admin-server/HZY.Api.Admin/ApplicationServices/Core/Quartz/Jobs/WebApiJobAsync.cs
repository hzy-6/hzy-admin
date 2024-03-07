namespace HZY.Api.Admin.ApplicationServices.Core.Quartz.Jobs;

public class WebApiJobAsync : QuartzJobBase<QuartzJob>, ITransientSelfDependency
{
    private string text = string.Empty;

    public WebApiJobAsync(ILogger<WebApiJob> logger) : base(logger)
    {

    }

    protected override Task BeforeExecutionAsync(IServiceProvider serviceProvider, QuartzJob quartzJobInfo)
    {
        var time = DateTime.Now;

        text = $"任务={quartzJobInfo.Name}|组={quartzJobInfo.GroupName}|{time:yyyy-MM-dd}|Time={time: HH:mm:ss:fff} -";

        return base.BeforeExecutionAsync(serviceProvider, quartzJobInfo);
    }

    protected override async Task<object?> RunAsync(IServiceProvider serviceProvider, QuartzJob quartzJobInfo)
    {
        var result = await RequestAsync(quartzJobInfo.RequestMode ?? QuartzJobRequestModeEnum.Post, quartzJobInfo!.JobPoint!);

        if (!result.IsSuccess)
        {
            _logger.LogError($"Web Api RequestAsync(); 请求失败! WebApi 返回结果:{result.Message}");
        }

        return result;
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


    /// <summary>
    /// 请求数据
    /// </summary>
    /// <param name="requsetMode"></param>
    /// <param name="apiUrl"></param>
    /// <param name="headerKeyValue"></param>
    /// <returns></returns>
    private async Task<(bool IsSuccess, string Message)> RequestAsync(
        QuartzJobRequestModeEnum requsetMode,
        string apiUrl,
        string? headerKeyValue = null
        )
    {
        try
        {
            var headerKey = "HZY.Quartz.Job.Request";
            var headerValue = "Success";

            if (!string.IsNullOrWhiteSpace(headerKeyValue) && headerKeyValue.Contains("="))
            {
                headerKey = headerKeyValue.Split('=')[0];
                headerValue = headerKeyValue.Split('=')[1];
            }

            var flurlRequest = apiUrl.WithHeader(headerKey, headerValue);
            if (flurlRequest == null)
            {
                return (false, "flurlRequest 空指针！");
            }

            IFlurlResponse? flurResponse = default;

            if (requsetMode == QuartzJobRequestModeEnum.Delete)
            {
                flurResponse = await flurlRequest.DeleteAsync();
            }

            if (requsetMode == QuartzJobRequestModeEnum.Post)
            {
                flurResponse = await flurlRequest.PostAsync();
            }

            if (requsetMode == QuartzJobRequestModeEnum.Get)
            {
                flurResponse = await flurlRequest.GetAsync();
            }

            if (flurResponse == null)
            {
                return (false, "flurResponse 空指针！");
            }

            var result = await flurResponse.GetStringAsync();

            if (string.IsNullOrWhiteSpace(result))
            {
                return (false, "result 空指针！");
            }

            return (true, result);
        }
        catch (Exception ex)
        {
            _logger.LogError(ex, $"接口请求异常【ApiRequestService 》RequestAsync】：{ex.Message}");
            return (false, ex.Message);
        }

    }
}
