using HZY.Infrastructure;
using HZY.Infrastructure.SerilogUtil;
using Serilog;
using HZY.Framework.Core;
using HZY.Web.Host.Endpoints;

try
{
    var app = WebApplication.CreateBuilder(args)
         // 加入 hzy framework
         .AddHzyFramework()
         // 构建
         .Build()
         // 使用 hzy framework
         .UseHzyFramework()
         // 启动主端点 miniapi
         .MapMainEndpoints();
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
