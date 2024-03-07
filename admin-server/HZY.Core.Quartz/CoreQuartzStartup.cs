namespace HZY.Core.Quartz;

/// <summary>
/// 
/// </summary>
public class CoreQuartzStartup : StartupModule<CoreQuartzStartup>
{
    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        var services = webApplicationBuilder.Services;

        //注册ISchedulerFactory的实例。
        services.AddTransient<ISchedulerFactory, StdSchedulerFactory>();

    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {
        var _quartzJobService = webApplication.Services.GetService<IQuartzJobService>();

        if (_quartzJobService is null) return;

        // 从内存中获取任务列表
        var memoryJobList = App.JobTaskInfos.Where(w => w.ScheduledAttribute.JobTaskType == QuartzJobTaskType.Memory);
        foreach (var item in memoryJobList)
        {
            _quartzJobService.RunAsync<QuartzJobEntity, MemoryJob>(new QuartzJobEntity()
            {
                Cron = item.ScheduledAttribute.Cron,
                GroupName = item.ScheduledAttribute.GroupName ?? "default",
                Name = item.ScheduledAttribute.Name ?? item.Key,
                Remark = item.ScheduledAttribute.Remark,
                // key 如果放入了 HZY.Api.CalcCenter.ApplicationServices.ServiceBus.Publishs.AppPublish>TestPublishAuto 表示执行函数
                JobPoint = item.Key
            }).Wait()
           ;
        }

        // 异步任务
        var memoryJobAsyncList = App.JobTaskInfos.Where(w => w.ScheduledAttribute.JobTaskType == QuartzJobTaskType.MemoryAsync);
        foreach (var item in memoryJobAsyncList)
        {
            _quartzJobService.RunAsync<QuartzJobEntity, MemoryJobAsync>(new QuartzJobEntity()
            {
                Cron = item.ScheduledAttribute.Cron,
                GroupName = item.ScheduledAttribute.GroupName ?? "default",
                Name = item.ScheduledAttribute.Name ?? item.Key,
                Remark = item.ScheduledAttribute.Remark,
                // key 如果放入了 HZY.Api.CalcCenter.ApplicationServices.ServiceBus.Publishs.AppPublish>TestPublishAuto 表示执行函数
                JobPoint = item.Key
            }).Wait()
           ;
        }
    }



}
