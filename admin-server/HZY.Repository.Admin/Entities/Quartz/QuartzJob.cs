namespace HZY.Repository.Admin.Entities.Quartz;

/// <summary>
/// 作业任务
/// </summary>
[EntityDescription(FieldIgnored = true)]
[Table("quartz_job_task")]
public class QuartzJob : DefaultEntity, IQuartzJobInfoEntity
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
    /// 间隔表达式
    /// </summary>
    public string? Cron { get; set; }

    /// <summary>
    /// 执行时间
    /// </summary>
    public DateTime? ExecuteTime { get; set; }

    /// <summary>
    /// 运行状态
    /// </summary>
    public bool State { get; set; }

    /// <summary>
    /// 备注
    /// </summary>
    public string? Remark { get; set; }

    /// <summary>
    /// 任务类型
    /// </summary>
    public QuartzJobTaskType Type { get; set; } = QuartzJobTaskType.Local;

    /// <summary>
    /// 作业点
    /// </summary>
    public string? JobPoint { get; set; }

    /// <summary>
    /// 请求方式
    /// </summary>
    [Column("RequsetMode")]
    public QuartzJobRequestModeEnum? RequestMode { get; set; }

    /// <summary>
    /// 非数据库字段
    /// </summary>
    [NotMapped]
    public string Key { get; set; } = string.Empty;
}
