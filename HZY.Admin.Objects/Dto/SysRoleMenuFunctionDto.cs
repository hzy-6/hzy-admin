using System;
using System.Collections.Generic;

namespace HZY.Admin.Objects.Dto
{
    public class SysRoleMenuFunctionDto
    {
        public Guid RoleId { get; set; }
        public Guid MenuId { get; set; }
        public List<Guid> FunctionIds { get; set; }
    }
}