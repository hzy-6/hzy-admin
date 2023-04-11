namespace HZY.Repository.EntityFramework.Admin.Entities.ApprovalFlow;

/// <summary>
/// 审批发起表
/// </summary>
public class FlowApproval : DefaultEntity<Guid>
{

    /// <summary>
    /// 流程发起人Id
    /// </summary>
    /// <value></value>
    public Guid UserId { get; set; }

    /// <summary>
    /// 流程发起人名称
    /// </summary>
    /// <value></value>
    public string? UserName { get; set; }

    /// <summary>
    /// 流程发起时间
    /// </summary>
    /// <value></value>
    public DateTime LaunchTime { get; set; }

    /// <summary>
    /// 表单Id
    /// </summary>
    /// <value></value>
    public Guid FormId { get; set; }

    /// <summary>
    /// 审批流Id
    /// </summary>
    /// <value></value>
    public Guid FlowId { get; set; }

    /// <summary>
    /// 审批流编码
    /// </summary>
    /// <value></value>
    public string? FlowCode { get; set; }

    /// <summary>
    /// 审批流名称
    /// </summary>
    /// <value></value>
    public string? FlowName { get; set; }

}