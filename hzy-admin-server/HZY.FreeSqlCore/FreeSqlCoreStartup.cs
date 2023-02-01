using HZY.Framework.Core.AspNetCore;
using HZY.Infrastructure;
using Microsoft.AspNetCore.Builder;

namespace HZY.FreeSqlCore
{
    /// <summary>
    /// 程序启动器
    /// </summary>
    public class FreeSqlCoreStartup : Startup<FreeSqlCoreStartup>
    {
        public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
        {
            var services = webApplicationBuilder.Services;
            var configuration = webApplicationBuilder.Configuration;
            var appConfiguration = new AppConfiguration(configuration);
            var prefixString = appConfiguration.Configs.Namespace + ".";

            //配置freesql
            services.AddFreeSql(appConfiguration, $"{prefixString}{nameof(FreeSqlCore)}");
        }

        public override void Configure(WebApplication webApplication)
        {


        }


    }
}
