﻿namespace HZY.Core.Logs;

/// <summary>
/// 日志工具
/// </summary>
public static class LogUtil
{
    static string LogFilePath(string LogEvent) =>
        $@"{AppDomain.CurrentDomain.BaseDirectory}/AppLogs/{LogEvent}/{LogEvent}_.log";

    /// <summary>
    /// 启动
    /// </summary>
    /// <param name="builder"></param>
    /// <returns></returns>
    public static WebApplicationBuilder AddLogUtil(this WebApplicationBuilder builder)
    {
        var fileMaxSize = 1 * 1024 * 1024 * 8;

        var logger = new LoggerConfiguration()
            .Enrich.With(new DateTimeNowEnricher())
            .Enrich.FromLogContext()//记录相关上下文信息
            ;

        logger.WriteTo.Console();

        //if (builder.Environment.IsDevelopment())
        {
            logger.WriteTo
                .File(LogFilePath("All"), LogEventLevel.Debug, rollingInterval: RollingInterval.Day, rollOnFileSizeLimit: true, fileSizeLimitBytes: fileMaxSize);
            logger.MinimumLevel.Debug();//最小记录级别
            logger.MinimumLevel.Override(nameof(Microsoft), LogEventLevel.Debug);//对其他日志进行重写,除此之外,目前框架只有微软自带的日志组件
        }
        //else
        //{
        //    logger.WriteTo
        //        .File(LogFilePath("All"), LogEventLevel.Warning, rollingInterval: RollingInterval.Day, rollOnFileSizeLimit: true, fileSizeLimitBytes: fileMaxSize);
        //    logger.MinimumLevel.Warning();//最小记录级别
        //    logger.MinimumLevel.Override(nameof(Microsoft), LogEventLevel.Warning);//对其他日志进行重写,除此之外,目前框架只有微软自带的日志组件
        //}

        Serilog.Log.Logger = logger
            .WriteTo.Logger(lg =>
            {
                lg.Filter
                .ByIncludingOnly(p => p.Level == LogEventLevel.Debug)
                .WriteTo.File(LogFilePath(nameof(LogEventLevel.Debug)), rollingInterval: RollingInterval.Day, rollOnFileSizeLimit: true, fileSizeLimitBytes: fileMaxSize);
            })
            .WriteTo.Logger(lg =>
            {
                lg.Filter
                .ByIncludingOnly(p => p.Level == LogEventLevel.Information)
                .WriteTo.File(LogFilePath(nameof(LogEventLevel.Information)), rollingInterval: RollingInterval.Day, rollOnFileSizeLimit: true, fileSizeLimitBytes: fileMaxSize);
            })
            .WriteTo.Logger(lg =>
            {
                lg.Filter
                .ByIncludingOnly(p => p.Level == LogEventLevel.Warning)
                .WriteTo.File(LogFilePath(nameof(LogEventLevel.Warning)), rollingInterval: RollingInterval.Day, rollOnFileSizeLimit: true, fileSizeLimitBytes: fileMaxSize);
            })
            .WriteTo.Logger(lg =>
            {
                lg.Filter
                .ByIncludingOnly(p => p.Level == LogEventLevel.Error)
                .WriteTo.File(LogFilePath(nameof(LogEventLevel.Error)), rollingInterval: RollingInterval.Day, rollOnFileSizeLimit: true, fileSizeLimitBytes: fileMaxSize);
            })
            .WriteTo.Logger(lg =>
            {
                lg.Filter
                .ByIncludingOnly(p => p.Level == LogEventLevel.Fatal)
                .WriteTo.File(LogFilePath(nameof(LogEventLevel.Fatal)), rollingInterval: RollingInterval.Day, rollOnFileSizeLimit: true, fileSizeLimitBytes: fileMaxSize);
            })
            .CreateLogger();

        // log 日志配置
        builder.Host.UseSerilog();

        return builder;
    }

    /// <summary>
    /// 日志对象
    /// </summary>
    public static ILogger Log => Serilog.Log.Logger;
}

/// <summary>
/// 时间处理
/// </summary>
class DateTimeNowEnricher : ILogEventEnricher
{
    public void Enrich(LogEvent logEvent, ILogEventPropertyFactory propertyFactory)
    {
        logEvent.AddPropertyIfAbsent(propertyFactory.CreateProperty(
            "DateTimeNow", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")));
    }
}