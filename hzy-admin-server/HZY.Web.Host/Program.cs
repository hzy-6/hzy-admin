using HZY.Infrastructure;
using HZY.Infrastructure.SerilogUtil;
using HZY.Web.Host.Configure;
using HZY.Web.Host.Endpoints;
using Serilog;

try
{
    var app = WebApplication.CreateBuilder(args)
         // 日志配置
         .LogUtilBuild()
         // 服务注册
         .AppConfigureServicesBuild()
         // 构建
         .Build()
         // 使用服务和配置
         .AppConfigureBuild()
         // 启动主端点 miniapi
         .MapMainEndpoints()
     ;

    app.Start();
    app.Urls.First();

    //获取到服务启动地址
    AppConfiguration.Urls = app.Urls.ToArray();
    
    //以下是 netcore 实现方式
    //var server = app.Services.GetService<IServer>();
    //var url = server.Features.Get<IServerAddressesFeature>().Addresses.First();

    app.WaitForShutdown();

}
catch (Exception ex)
{
    LogUtil.Log.Fatal(ex, "主机意外终止...");
    throw;
}
finally
{
    Log.CloseAndFlush();
}
