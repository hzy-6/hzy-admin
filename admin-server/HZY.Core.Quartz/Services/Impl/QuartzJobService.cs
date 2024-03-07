namespace HZY.Core.Quartz.Services.Impl;

/// <summary>
/// 任务调度服务
/// </summary>
public class QuartzJobService : IQuartzJobService
{
    private readonly ISchedulerFactory _schedulerFactory;
    private readonly IJobFactory _dIJobFactory;
    private readonly ILogger _logger;

    public QuartzJobService(ISchedulerFactory schedulerFactory, IJobFactory dIJobFactory, ILogger<QuartzJobService> logger)
    {
        _schedulerFactory = schedulerFactory;
        _dIJobFactory = dIJobFactory;
        _logger = logger;
    }

    /// <summary>
    /// 开始运行一个调度器
    /// </summary>
    /// <typeparam name="TJobTaskInfo"></typeparam>
    /// <typeparam name="TJob"></typeparam>
    /// <param name="jobTaskInfo"></param>
    /// <returns></returns>
    public async Task<bool> RunAsync<TJobTaskInfo, TJob>(TJobTaskInfo jobTaskInfo)
        where TJobTaskInfo : IQuartzJobInfoEntity
        where TJob : IJob
    {
        if (jobTaskInfo == null) return false;

        // 运行前判断是否存在 如果存在则不运行
        var isTrigger = await this.GetTrigger(jobTaskInfo.Name!, jobTaskInfo.GroupName!);
        if (isTrigger is not null)
        {
            await this.CloseAsync(jobTaskInfo.Name!, jobTaskInfo.GroupName!);
        }

        //1、通过调度工厂获得调度器
        var scheduler = await _schedulerFactory.GetScheduler();
        var taskName = $"{jobTaskInfo.GroupName}>{jobTaskInfo.Name}";

        //2、创建一个触发器
        var trigger = TriggerBuilder.Create()
            .WithIdentity(taskName, jobTaskInfo.GroupName!)
            .StartNow()
            .WithDescription(jobTaskInfo.Remark)
            // 触发表达式 0 0 0 1 1 ?
            .WithCronSchedule(jobTaskInfo.Cron!)
            .Build();

        //3、创建任务
        var jobDataMap = new JobDataMap();
        jobDataMap.Put(QuartzStartupConfig.JobTaskKey, jobTaskInfo);
        var jobDetail = JobBuilder.Create<TJob>()
                            .WithIdentity(taskName, jobTaskInfo.GroupName!)
                            .UsingJobData(jobDataMap)
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
    /// 开始运行一个调度器
    /// </summary>
    /// <param name="taskName"></param>
    /// <param name="cron"></param>
    /// <param name="call"></param>
    /// <param name="groupName"></param>
    /// <returns></returns>
    public async Task<(string? TaskName, string? GroupName)> RunAsync(string taskName, string cron, Action<(string GroupName, string TaskName)> call, string groupName = "default-group")
    {
        if (string.IsNullOrWhiteSpace(taskName)) throw new ArgumentNullException(nameof(taskName));
        if (string.IsNullOrWhiteSpace(groupName)) throw new ArgumentNullException(nameof(groupName));
        if (call == null) throw new ArgumentNullException(nameof(call));

        // 运行前判断是否存在 如果存在则不运行
        var isTrigger = await this.GetTrigger(taskName, groupName);
        if (isTrigger is not null)
        {
            await this.CloseAsync(taskName, groupName);
        }

        var result = (groupName, taskName);

        //1、通过调度工厂获得调度器
        var scheduler = await _schedulerFactory.GetScheduler();
        var taskKey = $"{groupName}>{taskName}";

        //2、创建一个触发器
        var trigger = TriggerBuilder.Create()
            .WithIdentity(taskKey, groupName!)
            .StartNow()
            .WithDescription("轻量、快捷任务！")
            // 触发表达式 0 0 0 1 1 ?
            .WithCronSchedule(cron!)
            .Build();

        //3、创建任务
        var jobDataMap = new JobDataMap();
        jobDataMap.Put(QuartzStartupConfig.JobTaskInfoCallKey, () =>
        {
            call?.Invoke(result);
        });

        var jobDetail = JobBuilder.Create<MemoryEventJob>()
                            .WithIdentity(taskKey, groupName!)
                            .UsingJobData(jobDataMap)
                            .Build()
                            ;

        //4、写入 Job 实例工厂 解决 Job 中取 ioc 对象
        scheduler.JobFactory = _dIJobFactory;

        //5、将触发器和任务器绑定到调度器中
        await scheduler.ScheduleJob(jobDetail, trigger);

        //6、开启调度器
        await scheduler.Start();

        return result;
    }

    /// <summary>
    /// 关闭调度器
    /// </summary>
    /// <param name="taskName">任务名称</param>
    /// <param name="groupName">组名称</param>
    /// <returns></returns>
    public async Task<bool> CloseAsync(string taskName, string groupName = "default-group")
    {
        var scheduler = await _schedulerFactory.GetScheduler();
        var trigger = await this.GetTrigger(taskName, groupName);

        if (trigger == null)
        {
            return false;
        }

        // 任务暂停
        await scheduler.PauseTrigger(trigger.Key);
        // 移除触发器
        await scheduler.UnscheduleJob(trigger.Key);
        // 删除任务
        return await scheduler.DeleteJob(trigger.JobKey);
    }

    /// <summary>
    /// 判断任务是否存在 和 运行状态
    /// </summary>
    /// <param name="taskName"></param>
    /// <param name="groupName"></param>
    /// <returns></returns>
    public async Task<ITrigger?> GetTrigger(string taskName, string groupName = "default-group")
    {
        var scheduler = await _schedulerFactory.GetScheduler();
        var jobKeys = (await scheduler
            .GetJobKeys(GroupMatcher<JobKey>.GroupEquals(groupName)))
            .ToList();

        var key = $"{groupName}>{taskName}";

        if (jobKeys == null || jobKeys.Count() == 0)
        {
            // _logger.LogError($"Group not found [{groupName}]");
            return null;
        }

        var jobKey = jobKeys
        .FirstOrDefault(w => scheduler.GetTriggersOfJob(w).Result.Any(x => (x as CronTriggerImpl)?.Name == key));

        if (jobKey == null)
        {
            // _logger.LogError($"JobKey not found [{key}]");
            return null;
        }

        //
        var triggers = await scheduler.GetTriggersOfJob(jobKey!);
        var trigger = triggers?.Where(x => (x as CronTriggerImpl)?.Name == key)?.FirstOrDefault();

        if (trigger == null)
        {
            // _logger.LogError($"Trigger not found [{key}]");
            return null;
        }

        return trigger;
    }

    /// <summary>
    /// 验证 Cron 表达式是否有效
    /// </summary>
    /// <param name="cronExpression"></param>
    /// <returns></returns>
    public bool IsValidExpression(string cronExpression)
    {
        try
        {
            var trigger = new CronTriggerImpl();
            trigger.CronExpressionString = cronExpression;
            var date = trigger.ComputeFirstFireTimeUtc(null);
            return date != null;
        }
        catch //(Exception e)
        {
            return false;
        }

    }


}
