using HZY.Domain.Services.Quartz.Jobs;
using HZY.Domain.Services.Quartz.Models;
using HZY.Infrastructure.ApiResultManage;
using Quartz;
using Quartz.Impl.Matchers;
using Quartz.Impl.Triggers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Domain.Services.Quartz.Impl
{
    /// <summary>
    /// 任务调度服务
    /// </summary>
    public class QuartzJobService : IQuartzJobService
    {
        private readonly ISchedulerFactory _schedulerFactory;
        private readonly ResultfulApiJobFactory _resultfulApiJobFactory;

        public QuartzJobService(ISchedulerFactory schedulerFactory, ResultfulApiJobFactory resultfulApiJobFactory)
        {
            _schedulerFactory = schedulerFactory;
            _resultfulApiJobFactory = resultfulApiJobFactory;
        }

        /// <summary>
        /// 开始运行一个调度器
        /// </summary>
        /// <param name="tasks"></param>
        /// <returns></returns>
        public async Task<bool> RunAsync(Tasks tasks)
        {
            //1、通过调度工厂获得调度器
            var scheduler = await _schedulerFactory.GetScheduler();
            var taskName = $"{tasks.GroupName}>{tasks.Name}";
            //2、创建一个触发器
            var trigger = TriggerBuilder.Create()
                .WithIdentity(taskName, tasks.GroupName)
                .StartNow()
                .WithDescription(tasks.Remark)
                // 触发表达式 0 0 0 1 1 ?
                .WithCronSchedule(tasks.Cron)
                .Build();

            //3、创建任务
            var jobDetail = JobBuilder.Create<ResultfulApiJob>()
                            .WithIdentity(taskName, tasks.GroupName)
                            .UsingJobData("TasksId", tasks.Id.ToString())
                            .Build();

            //4、写入 Job 实例工厂 解决 Job 中取 ioc 对象
            scheduler.JobFactory = _resultfulApiJobFactory;

            //5、将触发器和任务器绑定到调度器中
            await scheduler.ScheduleJob(jobDetail, trigger);

            //6、开启调度器
            await scheduler.Start();

            return await Task.FromResult(true);
        }

        /// <summary>
        /// 关闭调度器
        /// </summary>
        /// <param name="tasks"></param>
        /// <returns></returns>
        public async Task<bool> CloseAsync(Tasks tasks)
        {
            IScheduler scheduler = await _schedulerFactory.GetScheduler();
            var jobKeys = (await scheduler
                .GetJobKeys(GroupMatcher<JobKey>.GroupEquals(tasks.GroupName)))
                .ToList();
            var taskName = $"{tasks.GroupName}>{tasks.Name}";

            if (jobKeys == null || jobKeys.Count() == 0)
            {
                throw new MessageBox($"未找到分组:{tasks.GroupName}");
            }

            JobKey jobKey = jobKeys
            .FirstOrDefault(w => scheduler.GetTriggersOfJob(w).Result.Any(x => (x as CronTriggerImpl).Name == taskName));

            if (jobKey == null)
            {
                throw new MessageBox($"未找到触发器:{taskName}");
            }
            //
            var triggers = await scheduler.GetTriggersOfJob(jobKey);
            ITrigger trigger = triggers?.Where(x => (x as CronTriggerImpl).Name == taskName).FirstOrDefault();

            if (trigger == null)
            {
                throw new MessageBox($"未找到触发器:{taskName}");
            }
            //
            await scheduler.PauseTrigger(trigger.Key);
            await scheduler.UnscheduleJob(trigger.Key);// 移除触发器
            await scheduler.DeleteJob(trigger.JobKey);

            return await Task.FromResult(true);
        }







    }
}
