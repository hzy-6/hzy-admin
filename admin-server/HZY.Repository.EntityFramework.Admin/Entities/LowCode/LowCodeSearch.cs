namespace HZY.Repository.EntityFramework.Admin.Entities.LowCode;

/// <summary>
/// 低代码 检索配置
/// </summary>
public class LowCodeSearch : DefaultEntity
{

    /// <summary>
    /// 表id
    /// </summary>
    public Guid Low_Code_TableId { get; set; }

    /// <summary>
    /// 表
    /// </summary>
    public Guid Low_Code_Table_InfoId { get; set; }

}
