namespace HZY.Api.Admin.Controllers.DevelopmentTools;

/// <summary>
/// EFCore 监控 控制器
/// </summary>
[ControllerDescriptor(MenuId = "33")]
public class MonitorEFCoreController : AdminControllerBase<IMonitorEFCoreService>
{
    public MonitorEFCoreController(IMonitorEFCoreService defaultService) : base(defaultService)
    {

    }

    /// <summary>
    /// 获取 EFCore 监控上下文
    /// </summary>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "获取 EFCore 监控上下文")]
    [HttpPost]
    public EntityFrameworkRepositoriesMonitorContext GetEFCoreMonitorContext()
    {
        return _defaultService.GetEFCoreMonitorContext();
    }

    /// <summary>
    /// 获取 EFCore Sql 监控上下文 耗时排行榜
    /// </summary>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "获取 EFCore Sql 监控上下文 耗时排行榜")]
    [HttpPost]
    public List<EntityFrameworkRepositoriesMonitorSqlContext> GetTimeConsumingRanking()
    {
        return _defaultService.GetTimeConsumingRanking();
    }

    /// <summary>
    /// 获取 EFCore Sql 监控上下文 最新数据
    /// </summary>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "获取 EFCore Sql 监控上下文 最新数据")]
    [HttpPost]
    public List<EntityFrameworkRepositoriesMonitorSqlContext> GetNewest()
    {
        return _defaultService.GetNewest();
    }



}
