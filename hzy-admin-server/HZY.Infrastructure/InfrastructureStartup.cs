using HZY.Framework.AutoRegisterIOC;
using HZY.Framework.Core.AspNetCore;
using HZY.Framework.Core.Utils;
using HZY.Infrastructure.Redis;
using HZY.Infrastructure.SerilogUtil;
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
            var prefixString = appConfiguration.Configs.Namespace + ".";

            // 日志配置
            webApplicationBuilder.LogUtilBuild();

            LogUtil.Log.Warning("Web 主机开始启动...");

            //扫描服务自动化注册
            services.AddAutoRegisterIOC(AssemblyUtil.GetAssemblyList(prefixString).ToList());

            //配置redis
            services.AddRedisService(appConfiguration.ConnectionStrings.Redis);
        }

        public override void Configure(WebApplication webApplication)
        {
            //服务扫描 - 使用 host
            webApplication.UseHost();

            //获取到服务启动地址
            AppConfiguration.Urls = webApplication.Urls.ToArray();
        }


    }
}
