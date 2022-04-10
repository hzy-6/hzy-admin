using HzyEFCoreRepositories.Monitor;
using HzyEFCoreRepositories.Monitor.Models;
using HzyScanDiService.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Services.Admin.DevelopmentTool.MonitorEFCore
{
    public interface IMonitorEFCoreService : IDiTransient
    {
        /// <summary>
        /// 获取 EFCore 监控上下文
        /// </summary>
        /// <returns></returns>
        EFCoreMonitorContext GetEFCoreMonitorContext();

        /// <summary>
        /// 获取 EFCore Sql 监控上下文 耗时排行榜
        /// </summary>
        /// <returns></returns>
        List<EFCoreMonitorSqlContext> GetTimeConsumingRanking();

        /// <summary>
        /// 获取 EFCore Sql 监控上下文 最新数据
        /// </summary>
        /// <returns></returns>
        List<EFCoreMonitorSqlContext> GetNewest();

    }
}
