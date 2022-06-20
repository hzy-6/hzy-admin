using HZY.Infrastructure.SerilogUtil;
using HZY.WebHost.Configure;
using Serilog;

try
{
  

    #region 创建主机

    var builder = WebApplication.CreateBuilder(args);

    LogUtil.Build(builder);

    //地址
    //builder.WebHost.UseUrls("http://*:5600", "http://localhost:5600");
    //builder.WebHost.UseUrls("http://*:5600");
    LogUtil.Log.Warning("Web 主机开始启动...");

    //服务构建
    AppConfigureServices.Build(builder);
    #endregion

    #region 服务构建
    var app = builder.Build();
    
    //配置构建
    AppConfigure.Build(app);
    app.Run();

    #endregion

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
