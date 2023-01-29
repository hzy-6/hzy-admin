using HZY.Framework.Core.AspNetCore;
using HZY.Infrastructure.Redis;
using Microsoft.AspNetCore.Builder;

namespace HZY.Infrastructure
{
    /// <summary>
    /// 程序启动器
    /// </summary>
    public class InfrastructureStartup : Startup
    {
        public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
        {
            var services = webApplicationBuilder.Services;
            var configuration = webApplicationBuilder.Configuration;
            var appConfiguration = new AppConfiguration(configuration);

            //配置redis
            services.AddRedisService(appConfiguration.ConnectionStrings.Redis);
        }

        public override void Configure(WebApplication webApplication)
        {

        }


    }
}
