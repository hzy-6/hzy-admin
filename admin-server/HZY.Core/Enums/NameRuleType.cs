namespace HZY.Core.Enums;

/// <summary>
/// 命名规则类型
/// </summary>
public enum NameRuleType
{
    /// <summary>
    /// 默认类型  请使用驼峰命名法
    /// </summary>
    Default,

    /// <summary>
    /// 蛇形命名法 
    /// </summary>
    SnakeCase,

    /// <summary>
    /// 全大写蛇形命名法
    /// </summary>
    UpperSnakeCase,

    /// <summary>
    /// 全大写命名
    /// </summary>
    Upper,

    /// <summary>
    /// 全小写命名
    /// </summary>
    Lower
}