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
        /// <summary>
        /// 启动
        /// </summary>
        public static void Build()
        {
            var now = DateTime.Now;

            Serilog.Log.Logger = new LoggerConfiguration()
                .Enrich.With(new DateTimeNowEnricher())
                .MinimumLevel.Debug()//最小记录级别
                .Enrich.FromLogContext()//记录相关上下文信息 
                .MinimumLevel.Override("Microsoft", LogEventLevel.Information)//对其他日志进行重写,除此之外,目前框架只有微软自带的日志组件
                .WriteTo.Console()//输出到控制台
                .WriteTo.File($"{AppDomain.CurrentDomain.BaseDirectory}/AppLogs/{now.Year}/{now.Month}/.log", LogEventLevel.Information, rollingInterval: RollingInterval.Day)
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