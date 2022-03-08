using System;
using HZY.Models.Entities.BaseEntitys;

namespace HZY.Models.Entities.Framework;

/// <summary>
/// 用户与角色绑定
/// </summary>
public class SysUserRole : DefaultBaseEntity<Guid>
{
    public Guid UserId { get; set; }
    public Guid RoleId { get; set; }
}