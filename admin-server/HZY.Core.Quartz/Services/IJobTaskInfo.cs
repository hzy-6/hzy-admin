namespace HZY.Core.Quartz.Services;

/// <summary>
/// 作业任务信息
/// </summary>
public interface IJobTaskInfo
{

    /// <summary>
    /// 任务名称
    /// </summary>
    public string? Name { get; set; }

    /// <summary>
    /// 分组名称
    /// </summary>
    public string? GroupName { get; set; }

    /// <summary>
    /// 定时表达式
    /// </summary>
    public string? Cron { get; set; }

    /// <summary>
    /// 备注
    /// </summary>
    public string? Remark { get; set; }






}
