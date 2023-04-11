namespace HZY.Core.Permission.Attributes;

/// <summary>
/// action 功能模块描述
/// </summary>
[AttributeUsage(AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
public class ActionDescriptorAttribute : Attribute
{
    /// <summary>
    /// 功能名称
    /// </summary>
    private readonly string _functionName;

    /// <summary>
    /// 接口显示名称
    /// </summary>
    public string? DisplayName { get; set; }

    public ActionDescriptorAttribute()
    {

    }

    public ActionDescriptorAttribute(string functionName)
    {
        _functionName = functionName;
    }

    /// <summary>
    /// 获取功能名称
    /// </summary>
    /// <returns></returns>
    public string? GetFunctionName() => _functionName;

}