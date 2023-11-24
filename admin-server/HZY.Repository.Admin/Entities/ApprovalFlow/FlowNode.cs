namespace HZY.Repository.Admin.Entities.ApprovalFlow;

/// <summary>
/// 工作流节点表
/// </summary>
[EntityDescription(FieldIgnored = true)]
public class FlowNode : DefaultEntity<Guid>
{
    /// <summary>
    /// 流程id
    /// </summary>
    /// <value></value>
    public Guid FlowId { get; set; }

    /// <summary>
    /// 序号
    /// </summary>
    /// <value></value>
    public int? Sort { get; set; }

    /// <summary>
    /// 节点名称
    /// </summary>
    /// <value></value>
    public string? Name { get; set; }

    /// <summary>
    /// 角色Id
    /// </summary>
    /// <value></value>
    public Guid RoleId { get; set; }

    /// <summary>
    /// 备注
    /// </summary>
    /// <value></value>
    public string? Remark { get; set; }
}