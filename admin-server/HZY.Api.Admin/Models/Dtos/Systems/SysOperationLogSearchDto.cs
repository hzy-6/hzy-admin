namespace HZY.Api.Admin.Models.Dtos.Systems;

public class SysOperationLogSearchDto : SysOperationLog
{

    /// <summary>
    /// 开始时间
    /// </summary>
    public DateTime? StartTime { get; set; }

    /// <summary>
    /// 结束时间
    /// </summary>
    public DateTime? EndTime { get; set; }


}
