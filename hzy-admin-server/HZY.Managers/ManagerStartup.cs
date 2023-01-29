using HZY.Framework.Core.AspNetCore;
using HZY.Infrastructure;
using HZY.Managers.Quartz;
using HZY.Managers.SignalRs;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.DependencyInjection;

namespace HZY.Managers
{
    /// <summary>
    /// 程序启动器
    /// </summary>
    public class ManagerStartup : Startup
    {
        public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
        {
            var services = webApplicationBuilder.Services;
            var configuration = webApplicationBuilder.Configuration;
            var appConfiguration = new AppConfiguration(configuration);

            // 添加定时任务 quartz
            services.AddQuartzStartup();

            //SignalR
            services.AddSignalR();

        }

        public override void Configure(WebApplication webApplication)
        {
            var appConfiguration = webApplication.Services.GetRequiredService<AppConfiguration>();

            // 启动定时任务
            if (appConfiguration.Configs.IsRunQuartzTask)
            {
                webApplication.UseQuartzStartup();
            }

            //SignalR
            webApplication.AddSignalRHubs();

        }


    }
}
