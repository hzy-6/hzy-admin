using System;
using HZY.Models.Entities.BaseEntitys;

namespace HZY.Models.Entities.Framework;

/// <summary>
/// 角色菜单功能绑定
/// </summary>
public class SysRoleMenuFunction : DefaultBaseEntity<Guid>
{
    public Guid RoleId { get; set; }
    public int MenuId { get; set; }
    public Guid MenuFunctionId { get; set; }
}
