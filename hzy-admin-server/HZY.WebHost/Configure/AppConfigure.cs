using HZY.Domain.Services.Quartz;
using HZY.EFCore;
using HZY.Infrastructure;
using HZY.Infrastructure.MemoryMQ.Interfaces;
using HZY.Infrastructure.MessageQueue;
using HZY.Infrastructure.MessageQueue.Models;
using HZY.WebHost.Middlewares;
using HzyScanDiService;

namespace HZY.WebHost.Configure;

public class AppConfigure
{
    /// <summary>
    /// 配置构建
    /// </summary>
    /// <param name="app"></param>
    public static void Build(WebApplication app)
    {
        var env = app.Environment;
        var serviceProvider = app.Services;

        var memoryMQ = app.Services.GetRequiredService<IMessageConsumer<MessageQueueContext>>();

        if (app.Environment.IsDevelopment())
        {
            app.UseDeveloperExceptionPage();
            //app.UseSwagger();
            //app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "HZY.WebHost v1"));
        }

        app.UseHttpsRedirection();

        app.UseRouting();

        app.UseStaticFiles();

        var appConfiguration = app.Services.GetRequiredService<AppConfiguration>();

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
        memoryMQ.StartAsync().Wait();
        #endregion

        #region 启动定时任务
        if (appConfiguration.Configs.IsRunQuartzTask)
        {
            var _taskService = app.Services.GetRequiredService<ITaskService>();
            _taskService.RecoveryTaskAsync().Wait();
        }
        #endregion

        #region 使用 DbContext
        EFCoreModule.UseAdminDbContext(serviceProvider);
        #endregion

        app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
    }

}