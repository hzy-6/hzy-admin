namespace HZY.Repository.Admin.Entities.Systems;

/// <summary>
/// 用户与角色绑定
/// </summary>
[EntityDescription(FieldIgnored = true)]
public class SysUserRole : DefaultEntity
{
    public Guid UserId { get; set; }
    public Guid RoleId { get; set; }
}