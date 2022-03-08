using HZY.Models.Entities.Framework;
using System;
using System.Collections.Generic;

namespace HZY.Models.DTO;

/// <summary>
/// 系统账户表单
/// </summary>
public class SysUserFormDto
{
    public SysUser Form { get; set; }
    public List<Guid> RoleIds { get; set; }
    public List<SysRole> AllRoleList { get; set; }
    public List<Guid> PostIds { get; set; }
    public List<SysPost> AllPostList { get; set; }

}