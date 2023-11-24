namespace HZY.Repository.Admin.Entities.ApprovalFlow;

/// <summary>
/// 流程步骤可审批人记录表
/// </summary>
[EntityDescription(FieldIgnored = true)]
public class FlowApprovalStepHistoryUser : DefaultEntity<Guid>
{
    /// <summary>
    /// 审批步骤id
    /// </summary>
    /// <value></value>
    public Guid FlowApprovalStepHistoryId { get; set; }

    /// <summary>
    /// 流程节点Id
    /// </summary>
    /// <value></value>
    public Guid FlowNodeId { get; set; }

    /// <summary>
    /// 审批节点名称
    /// </summary>
    /// <value></value>
    public string? FlowNodeName { get; set; }

    /// <summary>
    /// 审批人Id
    /// </summary>
    /// <value></value>
    public Guid UserId { get; set; }

    /// <summary>
    /// 审批人名称
    /// </summary>
    /// <value></value>
    public string? UserName { get; set; }
}