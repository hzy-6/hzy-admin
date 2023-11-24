namespace HZY.Repository.Admin.Entities.Systems;

/// <summary>
/// 数据权限子表
/// </summary>
[EntityDescription(FieldIgnored = true)]
public class SysDataAuthorityCustom : DefaultEntity
{

    /// <summary>
    ///  SysDataAuthorityId => 备注: 数据权限主表Id
    /// </summary>
    public Guid? SysDataAuthorityId { get; set; }


    /// <summary>
    ///  SysOrganizationId => 备注: 组织Id
    /// </summary>
    public int SysOrganizationId { get; set; }


}