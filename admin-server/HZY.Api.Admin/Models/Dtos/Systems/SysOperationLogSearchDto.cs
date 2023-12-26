namespace HZY.Api.Admin.Models.Dtos.Systems;

public class SysOperationLogSearchDto : SysOperationLog
{

    /// <summary>
    /// 时间区间
    /// </summary>
    public DateTime[]? RangeTime { get; set; }

    /// <summary>
    /// 开始时间
    /// </summary>
    public DateTime? StartTime => RangeTime != null && RangeTime?.Length == 2 ? RangeTime[0].Date : null;

    /// <summary>
    /// 结束时间
    /// </summary>
    public DateTime? EndTime 
        => RangeTime != null && RangeTime?.Length == 2 ? new DateTime(RangeTime[1].Date.Year, RangeTime[1].Date.Month, RangeTime[1].Date.Day, 23, 59, 59) : null;



}
