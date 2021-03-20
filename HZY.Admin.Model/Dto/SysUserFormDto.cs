using System;
using System.Collections.Generic;
using HZY.Repository.Entity.Framework;

namespace HZY.Admin.Model.Dto
{
    /// <summary>
    /// 系统账户表单
    /// </summary>
    public class SysUserFormDto
    {
        public SysUser Form { get; set; }
        public List<Guid> RoleIds { get; set; }
        public List<SysRole> AllRoles { get; set; }
    }
}