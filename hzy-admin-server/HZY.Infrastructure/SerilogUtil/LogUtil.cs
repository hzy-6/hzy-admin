using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Hosting;
using Serilog;
using Serilog.Core;
using Serilog.Events;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Infrastructure.SerilogUtil
{
    /// <summary>
    /// 日志工具
    /// </summary>
    public static class LogUtil
    {
        static string LogFilePath(string LogEvent) =>
            $@"{AppDomain.CurrentDomain.BaseDirectory}/AppLogs/{DateTime.Now.Year}/{DateTime.Now.Month}/{DateTime.Now.Day}/{LogEvent}/.log";

        /// <summary>
        /// 启动
        /// </summary>
        public static void Build(WebApplicationBuilder builder)
        {
            var now = DateTime.Now;

            var logger = new LoggerConfiguration()
                .Enrich.With(new DateTimeNowEnricher())
                .MinimumLevel.Debug()//最小记录级别
                .Enrich.FromLogContext()//记录相关上下文信息 
                .MinimumLevel.Override(nameof(Microsoft), LogEventLevel.Debug)//对其他日志进行重写,除此之外,目前框架只有微软自带的日志组件
                ;

            if (builder.Environment.IsDevelopment())
            {
                logger.WriteTo.Console();
            }

            Serilog.Log.Logger = logger
                .WriteTo.Logger(lg =>
                {
                    lg.Filter
                    .ByIncludingOnly(p => p.Level == LogEventLevel.Debug)
                    .WriteTo.File(LogFilePath(nameof(LogEventLevel.Debug)), rollingInterval: RollingInterval.Day, rollOnFileSizeLimit: true);
                })
                .WriteTo.Logger(lg =>
                {
                    lg.Filter
                    .ByIncludingOnly(p => p.Level == LogEventLevel.Information)
                    .WriteTo.File(LogFilePath(nameof(LogEventLevel.Information)), rollingInterval: RollingInterval.Day, rollOnFileSizeLimit: true);
                })
                .WriteTo.Logger(lg =>
                {
                    lg.Filter
                    .ByIncludingOnly(p => p.Level == LogEventLevel.Warning)
                    .WriteTo.File(LogFilePath(nameof(LogEventLevel.Warning)), rollingInterval: RollingInterval.Day, rollOnFileSizeLimit: true);
                })
                .WriteTo.Logger(lg =>
                {
                    lg.Filter
                    .ByIncludingOnly(p => p.Level == LogEventLevel.Error)
                    .WriteTo.File(LogFilePath(nameof(LogEventLevel.Error)), rollingInterval: RollingInterval.Day, rollOnFileSizeLimit: true);
                })
                .WriteTo.Logger(lg =>
                {
                    lg.Filter
                    .ByIncludingOnly(p => p.Level == LogEventLevel.Fatal)
                    .WriteTo.File(LogFilePath(nameof(LogEventLevel.Fatal)), rollingInterval: RollingInterval.Day, rollOnFileSizeLimit: true);
                })
                .CreateLogger();
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

}