namespace HZY.Api.Admin.Models.Dtos.Systems;

/// <summary>
/// 组织机构树
/// </summary>
public class SysOrganizationTreeDto : SysOrganization
{

    public List<SysOrganizationTreeDto> Children { get; set; } = new List<SysOrganizationTreeDto>();

}
