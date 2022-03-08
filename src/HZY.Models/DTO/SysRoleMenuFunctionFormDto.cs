using System;
using System.Collections.Generic;

namespace HZY.Models.DTO;

public class SysRoleMenuFunctionFormDto
{
    public Guid RoleId { get; set; }
    public int MenuId { get; set; }
    public List<Guid> MenuFunctionIdList { get; set; }
}