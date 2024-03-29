﻿namespace HZY.Repository.Admin.Entities.Systems;

/// <summary>
/// 角色菜单功能绑定
/// </summary>
[EntityDescription(FieldIgnored = true)]
public class SysRoleMenuFunction : DefaultEntity
{
    public Guid RoleId { get; set; }
    public int MenuId { get; set; }
    public Guid MenuFunctionId { get; set; }
}
