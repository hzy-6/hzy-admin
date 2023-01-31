using HZY.Models.Entities.Quartz;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;
using Quartz.Impl;
using Quartz;
using HZY.Framework.Core.Utils;

namespace HZY.Managers.Quartz
{
    /// <summary>
    /// Quartz 启动配置
    /// </summary>
    public static class QuartzStartupConfig
    {
        /// <summary>
        /// 作业任务 id 名称
        /// </summary>
        public static readonly string JobTaskId = nameof(QuartzJobTask) + nameof(QuartzJobTask.Id);

        /// <summary>
        /// 添加 quartz
        /// </summary>
        /// <param name="services"></param>
        public static void AddQuartzStartup(this IServiceCollection services)
        {
            //注册ISchedulerFactory的实例。
            services.AddTransient<ISchedulerFactory, StdSchedulerFactory>();

        }

        /// <summary>
        /// 启动 quartz
        /// </summary>
        /// <param name="app"></param>
        public static void UseQuartzStartup(this IApplicationBuilder app)
        {
            using var scope = app.ApplicationServices.CreateScope();
            var _taskService = scope.ServiceProvider.GetRequiredService<ITaskService>();
            _taskService.RecoveryTaskAsync().Wait();

        }


    }
}
