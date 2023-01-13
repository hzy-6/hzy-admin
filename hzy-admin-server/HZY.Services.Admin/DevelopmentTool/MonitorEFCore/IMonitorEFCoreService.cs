using HZY.Framework.EntityFrameworkRepositories.Monitor.Models;
using HZY.Framework.AutoRegisterIOC;

namespace HZY.Services.Admin.DevelopmentTool.MonitorEFCore
{
    public interface IMonitorEFCoreService : ITransientDependency
    {
        /// <summary>
        /// 获取 EFCore 监控上下文
        /// </summary>
        /// <returns></returns>
        EntityFrameworkRepositoriesMonitorContext GetEFCoreMonitorContext();

        /// <summary>
        /// 获取 EFCore Sql 监控上下文 耗时排行榜
        /// </summary>
        /// <returns></returns>
        List<EntityFrameworkRepositoriesMonitorSqlContext> GetTimeConsumingRanking();

        /// <summary>
        /// 获取 EFCore Sql 监控上下文 最新数据
        /// </summary>
        /// <returns></returns>
        List<EntityFrameworkRepositoriesMonitorSqlContext> GetNewest();

    }
}
