using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using HZY.Models.Entities.BaseEntitys;

namespace HZY.Models.Entities.Framework;

/// <summary>
/// 岗位
/// </summary>
public class SysPost : DefaultBaseEntity<Guid>
{
    /// <summary>
    /// 编号
    /// </summary>
    public int? Number { get; set; }

    /// <summary>
    /// 岗位编码
    /// </summary>
    public string Code { get; set; }

    /// <summary>
    /// 岗位名称
    /// </summary>
    public string Name { get; set; }

    /// <summary>
    /// 状态
    /// </summary>
    public StateEnum State { get; set; } = StateEnum.正常;

    /// <summary>
    /// 备注
    /// </summary>
    public string Remarks { get; set; }
}

/// <summary>
/// 状态 枚举
/// </summary>
public enum StateEnum
{
    正常 = 1,
    停用
}

