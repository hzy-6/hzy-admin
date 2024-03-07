namespace HZY.Api.Admin.ApplicationServices.Core.Quartz.Impl;

/// <summary>
/// 任务服务
/// </summary>
public class TaskService : ITaskService
{
    private readonly IRepository<QuartzJob> _quartzJobTaskRepository;
    private readonly IQuartzJobService _quartzJobService;
    private readonly ILogger<TaskService> _logger;

    public TaskService(IRepository<QuartzJob> quartzJobTaskRepository,
        IQuartzJobService quartzJobService,
        ILogger<TaskService> logger)
    {
        _quartzJobTaskRepository = quartzJobTaskRepository;
        _quartzJobService = quartzJobService;
        _logger = logger;
    }

    public async Task<List<QuartzJob>> FindListAsync(string? filter = null)
    {
        var query = _quartzJobTaskRepository.SelectNoTracking
            .OrderByDescending(w => w.Type)
            .ThenBy(w => w.State)
            .ThenBy(w => w.GroupName)
            .ThenBy(w => w.Name)
            .ThenBy(w => w.CreationTime)
            ;

        var result = new List<QuartzJob>();

        if (!string.IsNullOrWhiteSpace(filter))
        {
            filter = filter.ToLower();
            result = await query
                 .Where(w =>
                 w.Name!.ToLower().Contains(filter) ||
                 w.GroupName!.ToLower().Contains(filter) ||
                 w.JobPoint!.ToLower().Contains(filter) ||
                 (!string.IsNullOrWhiteSpace(w.Remark) ? w.Remark.ToLower().Contains(filter) : false))
                 .ToListAsync()
                 ;
        }

        result = await query.ToListAsync() ?? new List<QuartzJob>();

        // 运行状态判断
        foreach (var item in result)
        {
            var trigger = await _quartzJobService.GetTrigger(item.Name!, item.GroupName!);
            item.State = trigger is not null;
        }

        return result;
    }

    public async Task<QuartzJob> SaveAsync(QuartzJob form)
    {
        if (string.IsNullOrWhiteSpace(form.Cron))
        {
            throw new MessageBox("Cron 不能为空!");
        }

        if (!_quartzJobService.IsValidExpression(form.Cron))
        {
            throw new MessageBox("任务 Cron 时间规则不正确!");

        }

        var isRun = false;
        var jobTask = await _quartzJobTaskRepository.FindByIdAsync(form.Id);

        if (jobTask == null)
        {
            if (await _quartzJobTaskRepository.AnyAsync(w => w.Name == form.Name && w.GroupName == form.GroupName))
            {
                throw new MessageBox($"任务名称{form.Name} , 已存在！");
            }

            await _quartzJobTaskRepository.InsertAsync(form);
        }
        else
        {
            if (await _quartzJobTaskRepository.AnyAsync(w => w.Name == form.Name && w.GroupName == form.GroupName && w.Id != jobTask.Id))
            {
                throw new MessageBox($"任务名称{form.Name} , 已存在！");
            }

            isRun = jobTask.State && form.State;

            if (isRun)
            {
                await CloseByIdAsync(jobTask);
                form.State = false;
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
            if (jobTask.State)
            {
                await CloseByIdAsync(jobTask);
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
    public async Task<QuartzJob> FindByIdAsync(Guid id)
    {
        return await _quartzJobTaskRepository.FindByIdAsync(id) ?? new QuartzJob();
    }

    /// <summary>
    /// 根据任务id 运行任务调度
    /// </summary>
    /// <param name="quartzJobTask"></param>
    /// <returns></returns>
    public async Task<bool> RunByIdAsync(QuartzJob quartzJobTask)
    {
        if (quartzJobTask.Id == Guid.Empty) return true;

        if (quartzJobTask.State)
        {
            return true;
        }

        var result = false;

        if (quartzJobTask.Type == QuartzJobTaskType.Http)
        {
            result = await _quartzJobService.RunAsync<IQuartzJobInfoEntity, WebApiJob>(quartzJobTask);
        }

        if (quartzJobTask.Type == QuartzJobTaskType.HttpAsync)
        {
            result = await _quartzJobService.RunAsync<IQuartzJobInfoEntity, WebApiJobAsync>(quartzJobTask);
        }

        if (quartzJobTask.Type == QuartzJobTaskType.Local)
        {
            result = await _quartzJobService.RunAsync<IQuartzJobInfoEntity, LocalJob>(quartzJobTask);
        }

        if (quartzJobTask.Type == QuartzJobTaskType.LocalAsync)
        {
            result = await _quartzJobService.RunAsync<IQuartzJobInfoEntity, LocalJobAsync>(quartzJobTask);
        }

        if (result)
        {
            quartzJobTask.State = true;
        }

        await _quartzJobTaskRepository.UpdateByIdAsync(quartzJobTask);

        return result;
    }

    /// <summary>
    /// 根据任务id 关闭任务调度
    /// </summary>
    /// <param name="quartzJobTask"></param>
    /// <returns></returns>
    public async Task<bool> CloseByIdAsync(QuartzJob quartzJobTask)
    {
        if (!quartzJobTask.State)
        {
            return true;
        }

        bool result = false;

        try
        {
            result = await _quartzJobService.CloseAsync(quartzJobTask.Name!, quartzJobTask.GroupName!);
        }
        catch (Exception ex)
        {
            MessageBox.Show(ex.Message);
        }
        finally
        {
            quartzJobTask.State = false;
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
        using var scope = App.CreateScope();
        using var quartzJobTaskRepository = scope?.ServiceProvider.GetService<IRepository<QuartzJob>>();

        if (quartzJobTaskRepository is null) return false;

        var jobTask = await quartzJobTaskRepository.SelectNoTracking
            .Where(w => w.Id == tasksId)
            .ExecuteUpdateAsync(w => w.SetProperty(t => t.ExecuteTime, t => dateTime))
            ;

        return jobTask > 0;
    }

    /// <summary>
    /// 获取job列表
    /// </summary>
    /// <returns></returns>
    private async Task<List<QuartzJob>> GetJobList()
    {
        var result = await FindListAsync() ?? new List<QuartzJob>();

        #region WebApi 服务
        //var jobPoint = $"http://localhost:{App.Urls.FirstOrDefault()}/api/job/JobTest/Test";
        //if (!result.Any(w => w.JobPoint == jobPoint))
        //{
        //    //初始化模拟数据
        //    //  /QuartzTasks/Test
        //    result.Add(new CalcQuartzJob
        //    {
        //        Id = Guid.NewGuid(),
        //        JobPoint = jobPoint,
        //        GroupName = "TEST",
        //        Name = "default test webapi",
        //        Cron = "0/10 * * * * ?",
        //        State = true,
        //        Type = QuartzJobTaskType.Http,
        //        Remark = "use test",
        //        RequestMode = QuartzJobRequestModeEnum.Get,
        //    });
        //}

        #endregion

        #region 本地任务

        //识别出本地任务加入数据库任务库
        var taskInfos = App.JobTaskInfos
                .Where(w => w.ScheduledAttribute.JobTaskType is not QuartzJobTaskType.Memory)
                .Where(w => w.ScheduledAttribute.JobTaskType is not QuartzJobTaskType.MemoryAsync)
                .ToList();

        foreach (var item in taskInfos)
        {
            if (result.Any(w => w.JobPoint == item.Key)) continue;

            var className = item.ClassType.Name;
            var functionName = item.MethodInfo.Name;

            var quartzJobTask = new QuartzJob();
            quartzJobTask.Key = item.Key;
            quartzJobTask.JobPoint = item.Key;
            quartzJobTask.GroupName = item.ScheduledAttribute.GroupName;
            quartzJobTask.Name = item.ScheduledAttribute.Name ?? className + "." + functionName;
            quartzJobTask.Cron = item.ScheduledAttribute.Cron;
            quartzJobTask.State = await _quartzJobService.GetTrigger(quartzJobTask.Name, quartzJobTask.GroupName!) is not null;
            quartzJobTask.Type = item.ScheduledAttribute.JobTaskType;
            quartzJobTask.Remark = item.ScheduledAttribute.Remark;

            result.Add(quartzJobTask);
        }

        #endregion

        return result;
    }


    /// <summary>
    /// 对任务数据 状态 重置 恢复运行状态
    /// </summary>
    /// <returns></returns>
    public async Task<bool> RecoveryTaskAsync()
    {
        try
        {
            var jobList = await GetJobList();
            if (jobList is null) return false;

            foreach (var item in jobList)
            {
                item.State = false;
                item.ExecuteTime = null;

                try
                {
                    await SaveAsync(item);
                }
                catch (Exception ex)
                {
                    // ignored
                }

                try
                {
                    //自动恢复任务机制
                    await RunByIdAsync(item);
                }
                catch (Exception ex)
                {
                    // ignored
                }
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
