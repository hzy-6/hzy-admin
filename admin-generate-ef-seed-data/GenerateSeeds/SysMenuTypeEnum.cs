namespace GenerateSeeds;

public enum SysMenuTypeEnum
{
    目录 = 1,
    菜单
}

public enum SysMenuModeEnum
{
    普通 = 1,
    微前端
}

/// <summary>
/// 状态情况
/// </summary>
public enum QuartzJobTaskStateEnum
{
    未运行,
    运行中
}

/// <summary>
/// 类型
/// </summary>
public enum QuartzJobTaskTypeEnum
{
    /// <summary>
    /// webapi 远程程序
    /// </summary>
    WebApi = 1,
    /// <summary>
    /// 本地程序
    /// </summary>
    Local
}


/// <summary>
/// 请求方式
/// </summary>
public enum QuartzJobTaskRequsetModeEnum
{
    Post,
    Get,
    Delete
}


