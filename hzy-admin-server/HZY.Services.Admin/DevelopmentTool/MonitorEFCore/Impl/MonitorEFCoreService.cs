using HZY.Framework.EntityFrameworkRepositories.Monitor;
using HZY.Framework.EntityFrameworkRepositories.Monitor.Models;
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
        public EntityFrameworkRepositoriesMonitorContext GetEFCoreMonitorContext()
        {
            return EntityFrameworkRepositoriesMonitorCache.Context;
        }

        public List<EntityFrameworkRepositoriesMonitorSqlContext> GetNewest()
        {
            return EntityFrameworkRepositoriesMonitorCache.SqlContext.OrderByDescending(w => w.Time).Take(20).ToList();
        }

        public List<EntityFrameworkRepositoriesMonitorSqlContext> GetTimeConsumingRanking()
        {
            return EntityFrameworkRepositoriesMonitorCache.SqlContext.OrderByDescending(w => w.ElapsedMilliseconds).Take(20).ToList();
        }



    }
}
