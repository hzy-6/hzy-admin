using HZY.Domain.Services.Quartz;
using HZY.Infrastructure;
using HZY.Infrastructure.MessageQueue;
using HZY.WebHost.Middlewares;
using HzyScanDiService;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using System;

namespace HZY.WebHost.Configure;

public class AppConfigure
{
    /// <summary>
    /// 配置构建
    /// </summary>
    /// <param name="app"></param>
    /// <param name="env"></param>
    /// <param name="serviceProvider"></param>
    /// <param name="messageQueueProvider"></param>
    public static void Build(WebApplication app, IWebHostEnvironment env, IServiceProvider serviceProvider, IMessageQueueProvider messageQueueProvider)
    {
        var appConfiguration = app.Services.GetRequiredService<AppConfiguration>();

        app.UseStaticFiles();

        #region 注册服务提供者

        serviceProvider.UseServiceProvider();

        #endregion

        #region JWT

        app.UseAuthentication();
        app.UseAuthorization();

        #endregion

        #region Swagger

        //启用中间件服务生成Swagger作为JSON终结点
        app.UseSwagger();
        //启用中间件服务对swagger-ui，指定Swagger JSON终结点
        app.UseSwaggerUI(option =>
        {
            foreach (var item in AppConfigureServices.GetVersionList()) option.SwaggerEndpoint($"{item}/swagger.json", item);
            option.RoutePrefix = "swagger";
        });

        #endregion

        #region 使用跨域 警告: 通过终结点路由，CORS 中间件必须配置为在对UseRouting和UseEndpoints的调用之间执行。 配置不正确将导致中间件停止正常运行。

        app.UseCors("WebHostCors");

        #endregion

        #region 使用 Api 耗时计算中间件
        app.UseMiddleware<TakeUpTimeMiddleware>();
        #endregion

        #region 消息队列启动
        messageQueueProvider.RunAsync().Wait();
        #endregion

        #region 启动定时任务
        if (appConfiguration.Configs.IsRunQuartzTask)
        {
            var _taskService = app.Services.GetRequiredService<ITaskService>();
            _taskService.RecoveryTaskAsync().Wait();
        }
        #endregion
    }


}
