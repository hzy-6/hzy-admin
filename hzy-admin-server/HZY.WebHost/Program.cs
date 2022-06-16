using System;
using HZY.Infrastructure.Filters;
using HZY.Infrastructure.MessageQueue;
using HZY.Infrastructure.SerilogUtil;
using HZY.Infrastructure.TextJson;
using HZY.WebHost.Configure;
using HZY.WebHost.Filters;
using Serilog;
using System.Text.Encodings.Web;
using System.Text.Json;
using System.Text.Unicode;

try
{
    LogUtil.Build();

    #region 创建主机和服务

    var builder = WebApplication.CreateBuilder(args);

    //地址
    //builder.WebHost.UseUrls("http://*:5600", "http://localhost:5600");
    //builder.WebHost.UseUrls("http://*:5600");

    LogUtil.Log.Warning("Web 主机开始启动...");
    //服务构建
    AppConfigureServices.Build(builder);
    #endregion

    #region 应用服务

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
