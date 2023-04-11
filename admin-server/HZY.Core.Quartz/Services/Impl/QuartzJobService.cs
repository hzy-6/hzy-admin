namespace HZY.Core.Quartz.Services.Impl;

/// <summary>
/// 任务调度服务
/// </summary>
public class QuartzJobService : IQuartzJobService
{
    private readonly ISchedulerFactory _schedulerFactory;
    private readonly DIJobFactory _dIJobFactory;

    /// <summary>
    /// 任务调度服务
    /// </summary>
    /// <param name="schedulerFactory"></param>
    /// <param name="dIJobFactory"></param>
    public QuartzJobService(ISchedulerFactory schedulerFactory, DIJobFactory dIJobFactory)
    {
        _schedulerFactory = schedulerFactory;
        _dIJobFactory = dIJobFactory;
    }

    /// <summary>
    /// 开始运行一个调度器
    /// </summary>
    /// <typeparam name="TJobTaskInfo"></typeparam>
    /// <typeparam name="TJob"></typeparam>
    /// <param name="jobTaskInfo"></param>
    /// <returns></returns>
    public async Task<bool> RunAsync<TJobTaskInfo, TJob>(TJobTaskInfo jobTaskInfo)
        where TJobTaskInfo : IJobTaskInfo
        where TJob : IJob
    {
        //1、通过调度工厂获得调度器
        var scheduler = await _schedulerFactory.GetScheduler();
        var taskName = $"{jobTaskInfo.GroupName}>{jobTaskInfo.Name}";
        //2、创建一个触发器
        var trigger = TriggerBuilder.Create()
            .WithIdentity(taskName, jobTaskInfo.GroupName)
            .StartNow()
            .WithDescription(jobTaskInfo.Remark)
            // 触发表达式 0 0 0 1 1 ?
            .WithCronSchedule(jobTaskInfo.Cron)
            .Build();

        //3、创建任务
        IJobDetail jobDetail = null;

        jobDetail = JobBuilder.Create<TJob>()
                            .WithIdentity(taskName, jobTaskInfo.GroupName)
                            .UsingJobData(QuartzStartupConfig.JobTaskKey, JsonConvert.SerializeObject(jobTaskInfo))
                            .Build()
                            ;

        //4、写入 Job 实例工厂 解决 Job 中取 ioc 对象
        scheduler.JobFactory = _dIJobFactory;

        //5、将触发器和任务器绑定到调度器中
        await scheduler.ScheduleJob(jobDetail, trigger);

        //6、开启调度器
        await scheduler.Start();

        return await Task.FromResult(true);
    }

    /// <summary>
    /// 关闭调度器
    /// </summary>
    /// <typeparam name="TJobTaskInfo"></typeparam>
    /// <param name="tasks"></param>
    /// <returns></returns>
    public async Task<bool> CloseAsync<TJobTaskInfo>(TJobTaskInfo tasks)
        where TJobTaskInfo : IJobTaskInfo
    {
        IScheduler scheduler = await _schedulerFactory.GetScheduler();
        var jobKeys = (await scheduler
            .GetJobKeys(GroupMatcher<JobKey>.GroupEquals(tasks.GroupName)))
            .ToList();
        var taskName = $"{tasks.GroupName}>{tasks.Name}";

        if (jobKeys == null || jobKeys.Count() == 0)
        {
            MessageBox.Show($"Group not found [{tasks.GroupName}]");
        }

        JobKey jobKey = jobKeys
        .FirstOrDefault(w => scheduler.GetTriggersOfJob(w).Result.Any(x => (x as CronTriggerImpl).Name == taskName));

        if (jobKey == null)
        {
            MessageBox.Show($"Trigger not found [{taskName}]");
        }
        //
        var triggers = await scheduler.GetTriggersOfJob(jobKey);
        ITrigger trigger = triggers?.Where(x => (x as CronTriggerImpl).Name == taskName).FirstOrDefault();

        if (trigger == null)
        {
            MessageBox.Show($"Trigger not found [{taskName}]");
        }
        //
        await scheduler.PauseTrigger(trigger.Key);
        await scheduler.UnscheduleJob(trigger.Key);// 移除触发器
        await scheduler.DeleteJob(trigger.JobKey);

        return await Task.FromResult(true);
    }






}
