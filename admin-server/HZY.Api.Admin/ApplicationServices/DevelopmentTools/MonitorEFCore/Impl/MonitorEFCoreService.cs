namespace HZY.Api.Admin.ApplicationServices.DevelopmentTools.MonitorEFCore.Impl;

/// <summary>
/// 监控 EFCore 服务
/// </summary>
public class MonitorEFCoreService : IMonitorEFCoreService
{
    /// <summary>
    /// GetEFCoreMonitorContext
    /// </summary>
    /// <returns></returns>
    public EntityFrameworkRepositoriesMonitorContext? GetEFCoreMonitorContext()
    {
        return RepositoryEntityFrameworkMonitorCache.Context;
    }

    /// <summary>
    /// GetNewest
    /// </summary>
    /// <returns></returns>
    public List<EntityFrameworkRepositoriesMonitorSqlContext>? GetNewest()
    {
        return RepositoryEntityFrameworkMonitorCache.SqlContext?.OrderByDescending(w => w.Time).Take(20).ToList();
    }

    /// <summary>
    /// GetTimeConsumingRanking
    /// </summary>
    /// <returns></returns>
    public List<EntityFrameworkRepositoriesMonitorSqlContext>? GetTimeConsumingRanking()
    {
        return RepositoryEntityFrameworkMonitorCache.SqlContext?.OrderByDescending(w => w.ElapsedMilliseconds).Take(20).ToList();
    }



}
