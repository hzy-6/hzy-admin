using HZY.Infrastructure.SerilogUtil;
using HZY.WebHost.Configure;
using HZY.WebHost.Endpoints;
using Serilog;

try
{
    WebApplication.CreateBuilder(args)
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
