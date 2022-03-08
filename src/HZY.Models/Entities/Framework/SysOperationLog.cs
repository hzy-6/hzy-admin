using System;
using HZY.Models.Entities.BaseEntitys;

namespace HZY.Models.Entities.Framework;

/// <summary>
/// 操作日志
/// </summary>
public class SysOperationLog : DefaultBaseEntity<Guid>
{
    /// <summary>
    /// 接口地址
    /// </summary>
    public string Api { get; set; }

    /// <summary>
    /// ip地址
    /// </summary>
    public string Ip { get; set; }

    /// <summary>
    /// 表单信息
    /// </summary>
    public string Form { get; set; }

    /// <summary>
    /// json表单信息
    /// </summary>
    public string FormBody { get; set; }

    /// <summary>
    /// 地址栏信息
    /// </summary>
    public string QueryString { get; set; }

    /// <summary>
    /// 接口耗时（毫秒）
    /// </summary>
    public long TakeUpTime { get; set; }

    /// <summary>
    /// 浏览器名称
    /// </summary>
    public string Browser { get; set; }

    /// <summary>
    /// 系统名称
    /// </summary>
    public string OS { get; set; }

    /// <summary>
    /// 当前操作人id
    /// </summary>
    public Guid? UserId { get; set; }


}
