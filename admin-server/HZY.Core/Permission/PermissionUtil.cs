﻿namespace HZY.Core.Permission;

/// <summary>
/// 权限工具
/// </summary>
public class PermissionUtil
{
    /// <summary>
    /// 获取控制器 的 ControllerDescriptorAttribute 特性
    /// </summary>
    /// <param name="type"></param>
    /// <returns></returns>
    public static ControllerDescriptorAttribute? GetControllerDescriptorAttribute(Type type)
    {
        var customAttributes = type.GetCustomAttributes();
        return (ControllerDescriptorAttribute?)customAttributes.FirstOrDefault(w => w is ControllerDescriptorAttribute);
    }

    /// <summary>
    /// 获取控制器 的 ControllerDescriptorAttribute 特性
    /// </summary>
    /// <param name="controllerBase"></param>
    /// <returns></returns>
    public static ControllerDescriptorAttribute? GetControllerDescriptorAttribute(ControllerBase controllerBase)
    {
        if (controllerBase == null) return default;
        var customAttributes = controllerBase.GetType().GetCustomAttributes();
        return (ControllerDescriptorAttribute?)customAttributes.FirstOrDefault(w => w is ControllerDescriptorAttribute);
    }

    /// <summary>
    /// 获取控制器 的 ControllerDescriptorAttribute 特性
    /// </summary>
    /// <param name="controllerType"></param>
    /// <returns></returns>
    public static ControllerDescriptorAttribute? GetControllerDescriptorAttributeByType(Type controllerType)
    {
        if (controllerType == null) return default;
        var customAttributes = controllerType.GetCustomAttributes();
        return (ControllerDescriptorAttribute?)customAttributes.FirstOrDefault(w => w is ControllerDescriptorAttribute);
    }

    /// <summary>
    /// 获取 Action 描述标记特性
    /// </summary>
    /// <param name="actionDescriptor"></param>
    /// <returns></returns>
    public static ActionDescriptorAttribute? GetActionDescriptorAttribute(ActionDescriptor actionDescriptor)
    {
        return (ActionDescriptorAttribute?)actionDescriptor.EndpointMetadata.FirstOrDefault(w => w is ActionDescriptorAttribute);
    }

    /// <summary>
    /// 获取当前控制器的显示名称
    /// </summary>
    /// <param name="type"></param>
    /// <returns></returns>
    public static string? GetControllerDisplayName(Type type)
    {
        return GetControllerDescriptorAttribute(type)?.DisplayName;
    }

    /// <summary>
    /// 获取当前控制器的显示名称
    /// </summary>
    /// <param name="controllerBase"></param>
    /// <returns></returns>
    public static string? GetControllerDisplayName(ControllerBase controllerBase)
    {
        return GetControllerDescriptorAttribute(controllerBase)?.DisplayName;
    }


}
