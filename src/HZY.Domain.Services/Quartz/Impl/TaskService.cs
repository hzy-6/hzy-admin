using AutoMapper;
using HZY.Domain.Services.Quartz.Models;
using HZY.Infrastructure.ApiResultManage;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Quartz.Impl.Triggers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Domain.Services.Quartz.Impl
{
    /// <summary>
    /// 任务服务
    /// </summary>
    public class TaskService : ITaskService
    {
        private readonly IDataService _fileDataService;
        private readonly IMapper _mapper;
        private readonly IQuartzJobService _quartzJobService;
        private string TasksKey = "HZY.Infrastructure.Quartz:Tasks";
        private readonly ILogger<TaskService> _logger;

        public TaskService(IDataService fileDataService,
            IMapper mapper,
            IQuartzJobService quartzJobService,
            ILogger<TaskService> logger)
        {
            _fileDataService = fileDataService;
            //初始化 FileData服务
            _fileDataService.Init(TasksKey);
            _mapper = mapper;
            _quartzJobService = quartzJobService;
            _logger = logger;
        }

        public async Task<IEnumerable<Tasks>> FindListAsync(string filter = null)
        {
            var data = await _fileDataService.ReadDataAsync<Tasks>();

            data ??= new List<Tasks>();
            var query = data?.OrderByDescending(w => w.State)
                 .ThenBy(w => w.GroupName)
                 .ThenBy(w => w.Name)
                 .ThenBy(w => w.CreateTime);

            if (!string.IsNullOrWhiteSpace(filter))
            {
                filter = filter.ToLower();
                return query
                     .Where(w => w.Name.ToLower().Contains(filter) || w.GroupName.ToLower().Contains(filter) || w.ApiUrl.ToLower().Contains(filter) || (!string.IsNullOrWhiteSpace(w.Remark) ? w.Remark.ToLower().Contains(filter) : false))
                     ;
            }

            return query.ToList() ?? new List<Tasks>();
        }

        public async Task<Tasks> SaveAsync(Tasks form)
        {
            if (!IsValidExpression(form.Cron))
            {
                throw new MessageBox("任务 Cron 时间规则不正确!");
            }

            var data = (await this.FindListAsync())?.ToList() ?? new List<Tasks>();
            var tasksByProjectId = await this.FindListAsync();

            var tasks = data.Find(w => w.Id == form.Id);

            var isRun = false;

            if (tasks == null)
            {
                if (tasksByProjectId.Any(w => w.Name == form.Name))
                {
                    throw new MessageBox($"任务名称{form.Name} , 已存在！");
                }

                form.Id = Guid.NewGuid();
                tasks = _mapper.Map<Tasks, Tasks>(form);
                tasks.CreateTime = DateTime.Now;
                data.Add(tasks);
            }
            else
            {
                isRun = tasks.State == TasksStateEnum.运行中 && form.State == TasksStateEnum.运行中;

                //验证是否在运行状态
                //if (tasks.State == StateEnum.运行中 && form.State == StateEnum.运行中)
                //{
                //    throw new MessageBox("任务运行中，请先关闭在修改!");
                //}

                if (tasksByProjectId.Any(w => w.Name == form.Name && w.Id != tasks.Id))
                {
                    throw new MessageBox($"任务名称{form.Name} , 已存在！");
                }

                tasks = _mapper.Map(form, tasks);

                if (isRun)
                {
                    await this.CloseByIdAsync(tasks.Id ?? Guid.Empty);
                    tasks.State = TasksStateEnum.未运行;
                }
            }

            await _fileDataService.WriteDataAsync(data);

            if (isRun)
            {
                await RunByIdAsync(tasks.Id ?? Guid.Empty);
            }

            return tasks;
        }

        public async Task<bool> DeleteAsync(List<Guid> ids)
        {
            foreach (var id in ids)
            {
                var data = (await this.FindListAsync())?.ToList() ?? new List<Tasks>();
                var tasks = data.Find(w => w.Id == id);
                if (tasks == null) return true;

                //验证是否在运行状态
                if (tasks.State == TasksStateEnum.运行中)
                {
                    await this.CloseByIdAsync(id);
                }

                data.RemoveAt(data.IndexOf(tasks));

                await _fileDataService.WriteDataAsync(data);
            }

            return true;
        }

        /// <summary>
        /// 根据Id 查询 任务
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Tasks> FindByIdAsync(Guid id)
        {
            var data = (await this.FindListAsync())?.ToList() ?? new List<Tasks>();
            return data.Find(w => w.Id == id) ?? new Tasks();
        }

        /// <summary>
        /// 根据任务id 运行任务调度
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> RunByIdAsync(Guid id)
        {
            if (id == Guid.Empty) return true;

            var data = await this.FindByIdAsync(id);

            if (data.State == TasksStateEnum.运行中)
            {
                return true;
            }

            var result = await _quartzJobService.RunAsync(data);

            if (result)
            {
                data.State = TasksStateEnum.运行中;
            }

            await this.SaveAsync(data);

            return result;
        }

        /// <summary>
        /// 根据任务id 关闭任务调度
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<bool> CloseByIdAsync(Guid id)
        {
            var data = await this.FindByIdAsync(id);

            if (data.State == TasksStateEnum.未运行)
            {
                return true;
            }

            bool result = false;

            try
            {
                result = await _quartzJobService.CloseAsync(data);
            }
            catch (Exception ex)
            {
                //tasks.State = TasksStateEnum.未运行;
                //await _taskService.SaveAsync(tasks);
                throw new MessageBox(ex.Message);
            }
            finally
            {
                //if (result)
                //{
                //    data.State = TasksStateEnum.未运行;
                //}
                data.State = TasksStateEnum.未运行;
                await this.SaveAsync(data);
            }

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
            var data = (await this.FindListAsync())?.ToList() ?? new List<Tasks>();

            if (data == null || data.Count == 0) return false;

            var tasks = data.Find(w => w.Id == tasksId);
            if (tasks == null) return false;
            tasks.ExecuteTime = dateTime;
            return await _fileDataService.WriteDataAsync(data);
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
                var result = (await FindListAsync())?.ToList() ?? new List<Tasks>();

                if (result == null || result.Count == 0)
                {
                    //初始化模拟数据
                    //  /QuartzTasks/Test
                    result.Add(new Tasks
                    {
                        Id = Guid.NewGuid(),
                        CreateTime = DateTime.Now,
                        ApiUrl = "http://localhost:5600/api/job/JobTest/Test",
                        Cron = "0/59 * * * * ?",
                        ExecuteTime = DateTime.Now,
                        Name = "默认测试接口",
                        GroupName = "TEST",
                        HeaderToken = "",
                        Remark = "用于测试",
                        RequsetMode = TasksRequsetModeEnum.Get,
                        State = TasksStateEnum.运行中
                    });
                }

                foreach (var item in result.Where(w => w.State == TasksStateEnum.运行中))
                {
                    item.State = TasksStateEnum.未运行;
                    item.ExecuteTime = null;
                    await SaveAsync(item);
                    //自动恢复任务机制
                    await RunByIdAsync(item.Id.Value);
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
