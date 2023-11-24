namespace HZY.Repository.Admin.Entities.Quartz;

/// <summary>
/// 作业任务 日志
/// </summary>
[EntityDescription(FieldIgnored = true)]
public class QuartzJobTaskLog : DefaultEntity
{
    /// <summary>
    /// 任务id
    /// </summary>
    public Guid JobTaskId { get; set; }

    /// <summary>
    /// 任务日志
    /// </summary>
    public string? Text { get; set; }


}
