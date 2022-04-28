using System;

namespace HZY.Infrastructure.Permission.Attributes;

/// <summary>
/// 控制器 接口 描述
/// </summary>
[AttributeUsage(AttributeTargets.Class, AllowMultiple = true, Inherited = true)]
public class ControllerDescriptorAttribute : Attribute
{
    /// <summary>
    /// 用于接口权限鉴定 菜单id
    /// </summary>
    public string MenuId { get; set; }

    /// <summary>
    /// 控制器显示名称
    /// </summary>
    public string DisplayName { get; set; }

    /// <summary>
    /// 控制器描述
    /// </summary>
    public ControllerDescriptorAttribute()
    {

    }


}