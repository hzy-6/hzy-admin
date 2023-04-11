namespace HZY.Repository.EntityFramework.Admin.Entities.Systems;

/// <summary>
/// 用户鱼岗位绑定表
/// </summary>
public class SysUserPost : DefaultEntity
{
    /// <summary>
    /// 账户Id
    /// </summary>
    public Guid UserId { get; set; }

    /// <summary>
    /// 岗位Id
    /// </summary>
    public Guid PostId { get; set; }
}
