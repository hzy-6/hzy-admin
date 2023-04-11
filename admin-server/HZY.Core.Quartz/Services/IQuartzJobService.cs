namespace HZY.Core.Quartz.Services;

/// <summary>
/// 
/// </summary>
public interface IQuartzJobService : ITransientDependency
{

    /// <summary>
    /// 开始运行一个任务调度器
    /// </summary>
    /// <typeparam name="TJobTaskInfo"></typeparam>
    /// <typeparam name="TJob"></typeparam>
    /// <param name="jobTaskInfo"></param>
    /// <returns></returns>
    Task<bool> RunAsync<TJobTaskInfo, TJob>(TJobTaskInfo jobTaskInfo)
        where TJobTaskInfo : IJobTaskInfo
        where TJob : IJob
        ;

    /// <summary>
    /// 关闭任务调度
    /// </summary>
    /// <param name="tasks"></param>
    /// <returns></returns>
    Task<bool> CloseAsync<TJobTaskInfo>(TJobTaskInfo tasks)
        where TJobTaskInfo : IJobTaskInfo
        ;



}
