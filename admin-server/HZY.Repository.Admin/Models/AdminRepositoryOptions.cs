namespace HZY.Repository.Admin.Models;

/// <summary>
/// admin 仓储配置
/// </summary>
public class AdminRepositoryOptions
{

    /// <summary>
    /// 数据库类型
    /// </summary>
    public DefaultDatabaseType DefaultDatabaseType { get; set; } = DefaultDatabaseType.SqlServer;

    /// <summary>
    /// 是否监控 efcore
    /// </summary>
    public bool IsMonitorEFCore { get; set; } = false;

}
