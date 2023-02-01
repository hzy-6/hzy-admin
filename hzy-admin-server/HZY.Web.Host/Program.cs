using HZY.Infrastructure.SerilogUtil;
using Serilog;
using HZY.Framework.Core;

try
{
    await WebApplication.CreateBuilder(args)
         // 加入 hzy framework
         .AddHzyFramework(assemblyNames: new string[] { "HZY." })
         // 构建
         .Build()
         // 使用 hzy framework
         .UseHzyFramework()
         // 运行 app
         .RunAsync()
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
