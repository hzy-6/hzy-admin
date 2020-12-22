using System;
using System.Collections.Generic;
using HZY.Models.Framework;

namespace HZY.Admin.Objects.Dto
{
    /// <summary>
    /// 系统账户表单
    /// </summary>
    public class SysUserFormDto
    {
        public SysUser Model { get; set; }
        public List<Guid> RoleIds { get; set; }
        public List<SysRole> AllRoles { get; set; }
    }
}