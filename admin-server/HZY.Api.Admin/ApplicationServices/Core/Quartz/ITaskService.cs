namespace HZY.Api.Admin.ApplicationServices.Core.Quartz;

/// <summary>
/// 任务 Job 服务
/// </summary>
public interface ITaskService : ITransientDependency
{

    /// <summary>
    /// 查询列表
    /// </summary>
    /// <returns></returns>
    Task<IEnumerable<QuartzJobTask>> FindListAsync(string filter = null);

    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    Task<QuartzJobTask> SaveAsync(QuartzJobTask form);

    /// <summary>
    /// 删除数据
    /// </summary>
    /// <returns></returns>
    Task<bool> DeleteAsync(List<Guid> ids);

    /// <summary>
    /// 根据Id 查询 任务
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    Task<QuartzJobTask> FindByIdAsync(Guid id);

    /// <summary>
    /// 根据任务id 运行任务调度
    /// </summary>
    /// <param name="quartzJobTask"></param>
    /// <returns></returns>
    Task<bool> RunByIdAsync(QuartzJobTask quartzJobTask);

    /// <summary>
    /// 根据任务id 关闭任务调度
    /// </summary>
    /// <param name="quartzJobTask"></param>
    /// <returns></returns>
    Task<bool> CloseByIdAsync(QuartzJobTask quartzJobTask);

    /// <summary>
    /// 更新执行时间
    /// </summary>
    /// <param name="tasksId"></param>
    /// <param name="dateTime"></param>
    /// <returns></returns>
    Task<bool> UpdateExecuteTime(Guid tasksId, DateTime dateTime);

    /// <summary>
    /// 恢复任务
    /// </summary>
    /// <returns></returns>
    Task<bool> RecoveryTaskAsync();

}
