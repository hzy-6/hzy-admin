using System;
using System.Collections.Generic;
using HZY.Repository.Domain.Framework;

namespace HZY.Admin.Services.Dto
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