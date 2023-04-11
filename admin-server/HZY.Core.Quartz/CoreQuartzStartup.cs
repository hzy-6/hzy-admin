namespace HZY.Core.Quartz;

/// <summary>
/// 
/// </summary>
public class CoreQuartzStartup : Startup<CoreQuartzStartup>
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
                GroupName = item.ScheduledAttribute.GroupName,
                Name = item.ScheduledAttribute.Name,
                Remark = item.ScheduledAttribute.Remark,
                Key = item.Key
            }).Wait()
           ;
        }
    }



}
