using HZY.Infrastructure.SerilogUtil;
using HZY.WebHost.Configure;
using HZY.WebHost.Endpoints;
using Serilog;

try
{
    WebApplication.CreateBuilder(args)
        // 日志配置
        .LogUtilBuild()
        // 服务构建
        .AppConfigureServicesBuild()
        // 使用服务
        .AppConfigureBuild()
        // 启动主端点 miniapi
        .MapMainEndpoints()
        //启动运行
        .Run()
    ;
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
