namespace HZY.Api.Admin.ApplicationServices.Core.Quartz;

/// <summary>
/// Quartz 启动配置
/// </summary>
public static class QuartzConfig
{

    /// <summary>
    /// 启动 quartz
    /// </summary>
    /// <param name="app"></param>
    public static void UseQuartzStartup(this IApplicationBuilder app)
    {
        using var scope = app.ApplicationServices.CreateScope();
        var _taskService = scope.ServiceProvider.GetRequiredService<ITaskService>();
        _taskService.RecoveryTaskAsync().Wait();

    }


}
