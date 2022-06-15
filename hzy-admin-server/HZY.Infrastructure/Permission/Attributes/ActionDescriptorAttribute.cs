using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Infrastructure.Permission.Attributes;

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
    public string DisplayName { get; set; }

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
    public string GetFunctionName() => this._functionName;

}