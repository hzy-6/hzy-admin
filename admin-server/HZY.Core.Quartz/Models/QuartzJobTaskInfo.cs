namespace HZY.Core.Quartz.Models;

/// <summary>
/// 定时任务信息
/// </summary>
public class QuartzJobTaskInfo : IJobTaskInfo
{
    /// <summary>
    /// 
    /// </summary>
    public string Key { get; set; }
    /// <summary>
    /// 
    /// </summary>
    public string Name { get; set; }
    /// <summary>
    /// 
    /// </summary>
    public string GroupName { get; set; }
    /// <summary>
    /// 
    /// </summary>
    public string Cron { get; set; }
    /// <summary>
    /// 
    /// </summary>
    public string Remark { get; set; }
}
