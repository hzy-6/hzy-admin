using AutoMapper;
using HZY.EntityFramework.Repositories.Admin.Core;
using HZY.Infrastructure.ApiResultManage;
using HZY.Models.Entities.Quartz;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Quartz.Impl.Triggers;

namespace HZY.Managers.Quartz.Impl
{
    /// <summary>
    /// 任务服务
    /// </summary>
    public class TaskService : ITaskService
    {
        private readonly IAdminRepository<QuartzJobTask> _quartzJobTaskRepository;
        private readonly IQuartzJobService _quartzJobService;
        private readonly ILogger<TaskService> _logger;

        public TaskService(IAdminRepository<QuartzJobTask> quartzJobTaskRepository,
            IQuartzJobService quartzJobService,
            ILogger<TaskService> logger)
        {
            _quartzJobTaskRepository = quartzJobTaskRepository;
            _quartzJobService = quartzJobService;
            _logger = logger;
        }

        public async Task<IEnumerable<QuartzJobTask>> FindListAsync(string filter = null)
        {
            var query = _quartzJobTaskRepository.SelectNoTracking
                .OrderByDescending(w => w.State)
                .ThenBy(w => w.GroupName)
                .ThenBy(w => w.Name)
                .ThenBy(w => w.CreationTime)
                ;

            if (!string.IsNullOrWhiteSpace(filter))
            {
                filter = filter.ToLower();
                return query
                     .Where(w => w.Name.ToLower().Contains(filter) || w.GroupName.ToLower().Contains(filter) || w.ApiUrl.ToLower().Contains(filter) || (!string.IsNullOrWhiteSpace(w.Remark) ? w.Remark.ToLower().Contains(filter) : false))
                     ;
            }

            return (await query.ToListAsync()) ?? new List<QuartzJobTask>();
        }

        public async Task<QuartzJobTask> SaveAsync(QuartzJobTask form)
        {
            if (!IsValidExpression(form.Cron))
            {
                throw new MessageBox("任务 Cron 时间规则不正确!");
            }

            var isRun = false;
            var jobTask = await _quartzJobTaskRepository.FindByIdAsync(form.Id);

            if (jobTask == null)
            {
                if (await _quartzJobTaskRepository.AnyAsync(w => w.Name == form.Name))
                {
                    throw new MessageBox($"任务名称{form.Name} , 已存在！");
                }

                await _quartzJobTaskRepository.InsertAsync(form);
            }
            else
            {
                if (await _quartzJobTaskRepository.AnyAsync(w => w.Name == form.Name && w.Id != jobTask.Id))
                {
                    throw new MessageBox($"任务名称{form.Name} , 已存在！");
                }

                isRun = jobTask.State == QuartzJobTaskStateEnum.运行中 && form.State == QuartzJobTaskStateEnum.运行中;

                if (isRun)
                {
                    await this.CloseByIdAsync(jobTask);
                    form.State = QuartzJobTaskStateEnum.未运行;
                }

                await _quartzJobTaskRepository.UpdateByIdAsync(form);
            }

            if (isRun)
            {
                await RunByIdAsync(jobTask);
            }

            return form;
        }

        public async Task<bool> DeleteAsync(List<Guid> ids)
        {
            var jobTasks = await _quartzJobTaskRepository.SelectNoTracking.Where(w => ids.Contains(w.Id)).ToListAsync();

            foreach (var jobTask in jobTasks)
            {
                if (jobTask.State == QuartzJobTaskStateEnum.运行中)
                {
                    await this.CloseByIdAsync(jobTask);
                }

                await _quartzJobTaskRepository.DeleteByIdAsync(jobTask.Id);
            }

            return true;
        }

        /// <summary>
        /// 根据Id 查询 任务
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<QuartzJobTask> FindByIdAsync(Guid id)
        {
            return await _quartzJobTaskRepository.FindByIdAsync(id) ?? new QuartzJobTask();
        }

        /// <summary>
        /// 根据任务id 运行任务调度
        /// </summary>
        /// <param name="quartzJobTask"></param>
        /// <returns></returns>
        public async Task<bool> RunByIdAsync(QuartzJobTask quartzJobTask)
        {
            if (quartzJobTask.Id == Guid.Empty) return true;

            if (quartzJobTask.State == QuartzJobTaskStateEnum.运行中)
            {
                return true;
            }

            var result = await _quartzJobService.RunAsync(quartzJobTask);

            if (result)
            {
                quartzJobTask.State = QuartzJobTaskStateEnum.运行中;
            }

            await _quartzJobTaskRepository.UpdateByIdAsync(quartzJobTask);

            return result;
        }

        /// <summary>
        /// 根据任务id 关闭任务调度
        /// </summary>
        /// <param name="quartzJobTask"></param>
        /// <returns></returns>
        public async Task<bool> CloseByIdAsync(QuartzJobTask quartzJobTask)
        {
            if (quartzJobTask.State == QuartzJobTaskStateEnum.未运行)
            {
                return true;
            }

            bool result = false;

            try
            {
                result = await _quartzJobService.CloseAsync(quartzJobTask);
            }
            catch (Exception ex)
            {
                //tasks.State = QuartzJobTaskStateEnum.未运行;
                //await _taskService.SaveAsync(tasks);
                throw new MessageBox(ex.Message);
            }
            finally
            {
                //if (result)
                //{
                //    data.State = QuartzJobTaskStateEnum.未运行;
                //}
                quartzJobTask.State = QuartzJobTaskStateEnum.未运行;
            }

            await _quartzJobTaskRepository.UpdateByIdAsync(quartzJobTask);

            return result;
        }

        /// <summary>
        /// 更新执行时间
        /// </summary>
        /// <param name="tasksId"></param>
        /// <param name="dateTime"></param>
        /// <returns></returns>
        public async Task<bool> UpdateExecuteTime(Guid tasksId, DateTime dateTime)
        {
            var jobTask = await _quartzJobTaskRepository.SelectNoTracking.Where(w => w.Id == tasksId)
                .ExecuteUpdateAsync(w => w.SetProperty(t => t.ExecuteTime, t => dateTime))
                ;

            return jobTask > 0;
        }

        /// <summary>
        /// 验证 Cron 表达式是否有效
        /// </summary>
        /// <param name="cronExpression"></param>
        /// <returns></returns>
        private bool IsValidExpression(string cronExpression)
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

        /// <summary>
        /// 对任务数据 状态 重置 恢复运行状态
        /// </summary>
        /// <returns></returns>
        public async Task<bool> RecoveryTaskAsync()
        {
            try
            {
                var result = (await FindListAsync())?.ToList() ?? new List<QuartzJobTask>();

                if (result == null || result.Count == 0)
                {
                    //初始化模拟数据
                    //  /QuartzTasks/Test
                    result.Add(new QuartzJobTask
                    {
                        Id = Guid.NewGuid(),
                        CreationTime = DateTime.Now,
                        ApiUrl = "http://localhost:5600/api/job/JobTest/Test",
                        Cron = "0/10 * * * * ?",
                        ExecuteTime = DateTime.Now,
                        Name = "默认测试接口",
                        GroupName = "TEST",
                        HeaderToken = "",
                        Remark = "用于测试",
                        RequsetMode = QuartzJobTaskRequsetModeEnum.Get,
                        State = QuartzJobTaskStateEnum.运行中
                    });
                }

                foreach (var item in result.Where(w => w.State == QuartzJobTaskStateEnum.运行中))
                {
                    item.State = QuartzJobTaskStateEnum.未运行;
                    item.ExecuteTime = null;
                    await SaveAsync(item);
                    //自动恢复任务机制
                    await RunByIdAsync(item);
                }

            }
            catch (Exception ex)
            {
                if (ex is not MessageBox)
                {
                    _logger.LogError(ex, $"自动开启任务错误 [{DateTime.Now}] : {ex.Message}");
                }
            }

            return true;
        }


    }
}
