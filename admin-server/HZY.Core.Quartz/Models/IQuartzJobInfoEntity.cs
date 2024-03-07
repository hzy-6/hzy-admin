namespace HZY.Core.Quartz.Models;

/// <summary>
/// 作业任务信息
/// </summary>
public interface IQuartzJobInfoEntity
{
    /// <summary>
    /// 定时任务 key
    /// </summary>
    public string? JobPoint { get; set; }

    /// <summary>
    /// 任务名称
    /// </summary>
    public string? Name { get; set; }

    /// <summary>
    /// 分组名称
    /// </summary>
    public string? GroupName { get; set; }

    /// <summary>
    /// 间隔表达式
    /// </summary>
    public string? Cron { get; set; }

    /// <summary>
    /// 备注
    /// </summary>
    public string? Remark { get; set; }

    /// <summary>
    /// 执行时间
    /// </summary>
    //public DateTime? ExecuteTime { get; set; }

    ///// <summary>
    ///// 运行状态
    ///// </summary>
    //public QuartzJobTaskStateEnum State { get; set; }

    ///// <summary>
    ///// 任务类型
    ///// </summary>
    //public JobTaskType Type { get; set; }

    ///// <summary>
    ///// 作业点
    ///// </summary>
    //public string? JobPoint { get; set; }

    ///// <summary>
    ///// 请求方式
    ///// </summary>
    //public QuartzJobTaskRequsetModeEnum? RequsetMode { get; set; }






}
