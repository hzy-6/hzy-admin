using HZY.Infrastructure.Controllers;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Services.Admin.DevelopmentTool.MonitorEFCore;
using HZY.Framework.EntityFrameworkRepositories.Monitor.Models;
using Microsoft.AspNetCore.Mvc;

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
        public EntityFrameworkRepositoriesMonitorContext GetEFCoreMonitorContext()
        {
            return _defaultService.GetEFCoreMonitorContext();
        }

        /// <summary>
        /// 获取 EFCore Sql 监控上下文 耗时排行榜
        /// </summary>
        /// <returns></returns>
        [ActionDescriptor(DisplayName = "获取 EFCore Sql 监控上下文 耗时排行榜")]
        [HttpPost("GetTimeConsumingRanking")]
        public List<EntityFrameworkRepositoriesMonitorSqlContext> GetTimeConsumingRanking()
        {
            return _defaultService.GetTimeConsumingRanking();
        }

        /// <summary>
        /// 获取 EFCore Sql 监控上下文 最新数据
        /// </summary>
        /// <returns></returns>
        [ActionDescriptor(DisplayName = "获取 EFCore Sql 监控上下文 最新数据")]
        [HttpPost("GetNewest")]
        public List<EntityFrameworkRepositoriesMonitorSqlContext> GetNewest()
        {
            return _defaultService.GetNewest();
        }



    }
}
