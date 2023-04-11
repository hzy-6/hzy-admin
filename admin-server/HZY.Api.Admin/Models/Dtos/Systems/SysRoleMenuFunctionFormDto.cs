namespace HZY.Api.Admin.Models.Dtos.Systems;

public class SysRoleMenuFunctionFormDto
{
    public Guid RoleId { get; set; }
    public int MenuId { get; set; }
    public List<Guid> MenuFunctionIdList { get; set; }
}