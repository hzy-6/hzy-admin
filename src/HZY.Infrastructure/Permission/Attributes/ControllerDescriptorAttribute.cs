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
    private readonly string _menuId;

    /// <summary>
    /// 控制器描述
    /// </summary>
    /// <param name="menuId">用于接口权限鉴定 菜单id</param>
    public ControllerDescriptorAttribute(string menuId)
    {
        _menuId = menuId;
    }

    /// <summary>
    /// 获取菜单 Id
    /// </summary>
    /// <returns></returns>
    public string GetMenuId() => this._menuId;

}