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

        //
        foreach (var item in App.JobTaskInfos.Where(w => w.ScheduledAttribute.InMemory))
        {
            _quartzJobService.RunAsync<QuartzJobTaskInfo, MemoryJob>(new QuartzJobTaskInfo()
            {
                Cron = item.ScheduledAttribute.Cron,
                GroupName = item.ScheduledAttribute.GroupName ?? "default",
                Name = item.ScheduledAttribute.Name ?? item.Key,
                Remark = item.ScheduledAttribute.Remark,
                // key 如果放入了 HZY.Api.CalcCenter.ApplicationServices.ServiceBus.Publishs.AppPublish>TestPublishAuto 表示执行函数
                Key = item.Key
            }).Wait()
           ;
        }
    }



}
