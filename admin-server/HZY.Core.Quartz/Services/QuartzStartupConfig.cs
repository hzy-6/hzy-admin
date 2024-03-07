namespace HZY.Core.Quartz.Services;

/// <summary>
/// Quartz 启动配置
/// </summary>
public static class QuartzStartupConfig
{
    /// <summary>
    /// 作业任务 Key 名称
    /// </summary>
    public static readonly string JobTaskKey = nameof(IQuartzJobInfoEntity);

    /// <summary>
    /// 任务信息 key 名称
    /// </summary>
    public static readonly string JobTaskInfoKey = nameof(IQuartzJobInfoEntity);

    /// <summary>
    /// 任务信息回调 key 名称
    /// </summary>
    public static readonly string JobTaskInfoCallKey = nameof(IQuartzJobInfoEntity) + "Call";

}
