using HzyEFCoreRepositories.Monitor;
using HzyEFCoreRepositories.Monitor.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Services.Admin.DevelopmentTool.MonitorEFCore.Impl
{
    /// <summary>
    /// 监控 EFCore 服务
    /// </summary>
    public class MonitorEFCoreService : IMonitorEFCoreService
    {
        public EFCoreMonitorContext GetEFCoreMonitorContext()
        {
            return MonitorEFCoreCache.Context;
        }

        public List<EFCoreMonitorSqlContext> GetNewest()
        {
            return MonitorEFCoreCache.SqlContext.OrderByDescending(w => w.Time).Take(20).ToList();
        }

        public List<EFCoreMonitorSqlContext> GetTimeConsumingRanking()
        {
            return MonitorEFCoreCache.SqlContext.OrderByDescending(w => w.ElapsedMilliseconds).Take(20).ToList();
        }



    }
}
