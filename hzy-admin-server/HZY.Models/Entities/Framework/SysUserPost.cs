using System;
using HZY.Models.Entities.BaseEntitys;

namespace HZY.Models.Entities.Framework;

/// <summary>
/// 用户鱼岗位绑定表
/// </summary>
public class SysUserPost : DefaultBaseEntity<Guid>
{
    /// <summary>
    /// 账户Id
    /// </summary>
    public Guid UserId { get; set; }

    /// <summary>
    /// 岗位Id
    /// </summary>
    public Guid PostId { get; set; }
}
