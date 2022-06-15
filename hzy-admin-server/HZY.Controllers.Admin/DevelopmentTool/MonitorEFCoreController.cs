using HZY.Infrastructure.Controllers;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Services.Admin.DevelopmentTool.MonitorEFCore;
using HzyEFCoreRepositories.Monitor.Models;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Controllers.Admin.DevelopmentTool
{
    /// <summary>
    /// EFCore 监控 控制器
    /// </summary>
    [ControllerDescriptor(MenuId = "33")]
    public class MonitorEFCoreController : AdminBaseController<IMonitorEFCoreService>
    {
        public MonitorEFCoreController(IMonitorEFCoreService defaultService) : base(defaultService)
        {

        }

        /// <summary>
        /// 获取 EFCore 监控上下文
        /// </summary>
        /// <returns></returns>
        [ActionDescriptor(DisplayName = "获取 EFCore 监控上下文")]
        [HttpPost("GetEFCoreMonitorContext")]
        public EFCoreMonitorContext GetEFCoreMonitorContext()
        {
            return _defaultService.GetEFCoreMonitorContext();
        }

        /// <summary>
        /// 获取 EFCore Sql 监控上下文 耗时排行榜
        /// </summary>
        /// <returns></returns>
        [ActionDescriptor(DisplayName = "获取 EFCore Sql 监控上下文 耗时排行榜")]
        [HttpPost("GetTimeConsumingRanking")]
        public List<EFCoreMonitorSqlContext> GetTimeConsumingRanking()
        {
            return _defaultService.GetTimeConsumingRanking();
        }

        /// <summary>
        /// 获取 EFCore Sql 监控上下文 最新数据
        /// </summary>
        /// <returns></returns>
        [ActionDescriptor(DisplayName = "获取 EFCore Sql 监控上下文 最新数据")]
        [HttpPost("GetNewest")]
        public List<EFCoreMonitorSqlContext> GetNewest()
        {
            return _defaultService.GetNewest();
        }



    }
}
