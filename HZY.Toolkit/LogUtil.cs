using System;
using System.Text;

namespace HZY.Toolkit
{
    using NLog;

    /// <summary>
    /// 参考地址：  
    ///             https://www.cnblogs.com/muyeh/p/9788311.html 
    ///             https://www.cnblogs.com/qulianqing/p/7222177.html
    /// </summary>
    public static class LogUtil
    {
        private static Logger Logger { get; set; }

        public static void Init(Logger logger)
        {
            Logger = logger;
        }

        /// <summary>
        /// 日志对象
        /// </summary>
        /// <returns></returns>
        public static Logger GetLogger() => Logger;

        /// <summary>
        /// 写入日志
        /// </summary>
        /// <param name="text"></param>
        public static void Write(string text)
        {
            Logger.Info(text);
        }

        /// <summary>
        /// 写入日志
        /// </summary>
        /// <param name="text"></param>
        /// <param name="exception"></param>
        public static void Write(string text, Exception exception)
        {
            WriteError(exception, null, sb => { sb.Append($"{text}\r\n"); });
        }

        /// <summary>
        /// 写入日志
        /// </summary>
        /// <param name="exception"></param>
        /// <param name="userHostAddress"></param>
        /// <param name="callBack"></param>
        public static void WriteError(Exception exception, string userHostAddress,
            Action<StringBuilder> callBack = null)
        {
            var sb = new StringBuilder();
            var message = "异常信息: " + exception.Message;
            var source = "错误源:" + exception.Source;
            var stackTrace = "堆栈信息:" + exception.StackTrace;

            sb.Append($"\r\n");
            callBack?.Invoke(sb);
            if (!string.IsNullOrWhiteSpace(userHostAddress))
            {
                sb.Append($"{userHostAddress}\r\n");
            }

            if (!string.IsNullOrWhiteSpace(message))
            {
                sb.Append($"{message}\r\n");
            }

            if (!string.IsNullOrWhiteSpace(source))
            {
                sb.Append($"{source}\r\n");
            }

            if (!string.IsNullOrWhiteSpace(stackTrace))
            {
                sb.Append($"{stackTrace}\r\n");
            }

            Logger.Error(exception, sb.ToString());
        }
    }
}