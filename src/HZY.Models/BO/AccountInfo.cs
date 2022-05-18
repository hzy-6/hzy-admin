using HZY.Models.DTO;
using HZY.Models.DTO.Framework;
using HZY.Models.Entities.Framework;
using System;
using System.Collections.Generic;

namespace HZY.Models.BO;

/// <summary>
/// 账户 业务对象
/// </summary>
public class AccountInfo : SysUser
{
    /// <summary>
    /// 角色 集合
    /// </summary>
    public List<SysRole> SysRoles { get; set; }

    /// <summary>
    /// 所属岗位
    /// </summary>
    public List<SysPost> SysPosts { get; set; }

    /// <summary>
    /// 所属组织
    /// </summary>
    public SysOrganization SysOrganization { get; set; }

    /// <summary>
    /// 是否超级管理员
    /// </summary>
    public bool IsAdministrator { get; set; }

    /// <summary>
    /// 菜单集合
    /// </summary>
    public List<SysMenuTreeDto> Menus { get; set; }

    /// <summary>
    /// 菜单功能集合
    /// </summary>
    public List<Dictionary<string, object>> MenuPowers { get; set; }
}