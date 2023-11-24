﻿namespace HZY.Core.Quartz.Services;

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
    /// 开始运行一个任务调度器
    /// </summary>
    /// <param name="taskName">任务名称唯一</param>
    /// <param name="cron">任务表达式</param>
    /// <param name="call">被执行事件</param>
    /// <param name="groupName">分组</param>
    /// <returns></returns>
    Task<(string? TaskName, string? GroupName)> RunAsync(string taskName, string cron, Action<(string GroupName, string TaskName)> call, string groupName = "default-group")
        ;

    /// <summary>
    /// 关闭任务调度
    /// </summary>
    /// <param name="taskName">任务名称</param>
    /// <param name="groupName">组名称</param>
    /// <returns></returns>
    Task<bool> CloseAsync(string taskName, string groupName = "default-group");



}
