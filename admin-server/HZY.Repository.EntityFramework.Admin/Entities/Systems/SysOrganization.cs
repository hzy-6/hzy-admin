namespace HZY.Repository.EntityFramework.Admin.Entities.Systems;

/// <summary>
/// 组织机构
/// </summary>
public class SysOrganization : DefaultEntityIdentityIntKey
{
    /// <summary>
    /// 组织名称
    /// </summary>
    public string? Name { get; set; }

    /// <summary>
    /// 组织排序号
    /// </summary>
    public int? OrderNumber { get; set; }

    /// <summary>
    /// 等级码
    /// </summary>
    public string? LevelCode { get; set; }

    /// <summary>
    /// 负责人
    /// </summary>
    public string? Leader { get; set; }

    /// <summary>
    /// 联系电话
    /// </summary>
    public string? Phone { get; set; }

    /// <summary>
    /// 邮箱
    /// </summary>
    public string? Email { get; set; }

    /// <summary>
    /// 状态
    /// </summary>
    public StateEnum? State { get; set; } = StateEnum.正常;

    /// <summary>
    /// 父级Id
    /// </summary>
    public int? ParentId { get; set; }

}

