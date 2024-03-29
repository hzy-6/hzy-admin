﻿namespace HZY.Repository.Admin.Entities.Systems;

/// <summary>
/// 岗位
/// </summary>
[EntityDescription(FieldIgnored = true)]
public class SysPost : DefaultEntity
{
    /// <summary>
    /// 编号
    /// </summary>
    public int? Number { get; set; }

    /// <summary>
    /// 岗位编码
    /// </summary>
    public string? Code { get; set; }

    /// <summary>
    /// 岗位名称
    /// </summary>
    public string? Name { get; set; }

    /// <summary>
    /// 状态
    /// </summary>
    public StateEnum State { get; set; } = StateEnum.正常;

    /// <summary>
    /// 备注
    /// </summary>
    public string? Remarks { get; set; }
}

/// <summary>
/// 状态 枚举
/// </summary>
public enum StateEnum
{
    正常 = 1,
    停用
}

