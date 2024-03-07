namespace HZY.Repository.Admin.Entities.Quartz;

/// <summary>
/// 作业任务 日志
/// </summary>
[EntityDescription(FieldIgnored = true)]
[Table("quartz_job_task_log")]
public class QuartzJobLog : DefaultEntity
{
    /// <summary>
    /// 任务id
    /// </summary>
    [Column("JobTaskId")]
    public Guid JobId { get; set; }

    /// <summary>
    /// 任务日志
    /// </summary>
    public string? Text { get; set; }


}
