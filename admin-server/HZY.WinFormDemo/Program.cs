namespace HZY.WinFormDemo;

internal static class Program
{
    /// <summary>
    ///  The main entry point for the application.
    /// </summary>
    [STAThread]
    static void Main()
    {
        // To customize application configuration such as set high DPI settings or default font,
        // see https://aka.ms/applicationconfiguration.
        ApplicationConfiguration.Initialize();

        // 设置 aspnetcore 启动端口 和 启动环境
        var args = new string[] { "--urls", "http://*:7070", Environments.Development };

        try
        {
            HzyApplication.Run<WinFormDemoStartup>(args, webApplicationBuilder =>
            {
                // 注册窗体
                webApplicationBuilder.Services.AddTransient<Form1>();
            }, app =>
            {
                // 从 ioc 容器中获取窗体
                var form1 = app.Services.GetService<Form1>();
                // 运行主窗体
                Application.Run(form1);
            });
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
    }
}