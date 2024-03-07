namespace HZY.Core.Quartz.Models;

public interface IQuartzJobLogEntity
{
    /// <summary>
    /// 任务id
    /// </summary>
    public Guid JobId { get; set; }

    /// <summary>
    /// 任务日志
    /// </summary>
    public string? Text { get; set; }

}
