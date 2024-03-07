namespace HZY.Shared.Admin.Models.LowCodes;

/// <summary>
/// 
/// </summary>
public class GenDbTableDto : LowCodeTable
{
    /// <summary>
    /// 表字段信息
    /// </summary>
    /// <value></value>
    public List<LowCodeTableInfo> TableInfos { get; set; }

    /// <summary>
    /// 命名空间
    /// </summary>
    public string? Namespace { get; set; }
}