using HZY.Framework.Core.AspNetCore;
using HZY.Infrastructure;
using Microsoft.AspNetCore.Builder;

namespace HZY.EntityFramework
{
    /// <summary>
    /// 程序启动器
    /// </summary>
    public class EntityFrameworkStartup : Startup
    {
        public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
        {
            var services = webApplicationBuilder.Services;
            var configuration = webApplicationBuilder.Configuration;
            var appConfiguration = new AppConfiguration(configuration);

            //配置efcore
            services.AddEntityFramework(appConfiguration, webApplicationBuilder);


        }

        public override void Configure(WebApplication webApplication)
        {
            // 使用 DbContext
            webApplication.UseEntityFramework();


        }


    }
}
