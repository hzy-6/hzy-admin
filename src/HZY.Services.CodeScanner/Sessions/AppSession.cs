using DotNetty.Transport.Channels;
using HZY.Infrastructure.SerilogUtil;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Services.CodeScanner.Sessions
{
    /// <summary>
    /// 扫码器 session 会话操作集合
    /// </summary>
    public class AppSession
    {
        private readonly static List<IChannel> _channels;
        private readonly static object _lock = new object();

        static AppSession()
        {
            _channels = new List<IChannel>();
        }

        /// <summary>
        /// 添加 通道上下文
        /// </summary>
        /// <param name="context"></param>
        public static void Add(IChannel context)
        {
            lock (_lock)
            {
                if (_channels.Any(w => w.RemoteAddress.ToString() == context.RemoteAddress.ToString())) return;

                _channels.Add(context);
            }
        }

        /// <summary>
        /// 移除数据
        /// </summary>
        public static void Remove(IChannel context)
        {
            lock (_lock)
            {
                if (!_channels.Any(w => w.RemoteAddress.ToString() == context.RemoteAddress.ToString())) return;

                _channels.RemoveAt(_channels.IndexOf(context));
            }
        }

        /// <summary>
        /// 根据条件获取通道上下文
        /// </summary>
        /// <param name="predicate"></param>
        /// <returns></returns>
        public static IChannel Get(Func<IChannel, bool> predicate)
        {
            return _channels.Where(predicate).FirstOrDefault();
        }

        /// <summary>
        /// 发送数据
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="message"></param>
        /// <param name="predicate"></param>
        public static void Send<T>(T message, Func<IChannel, bool> predicate)
        {
            var channel = Get(predicate);
            if (channel == null) return;

            channel.WriteAndFlushAsync(message);
        }

        /// <summary>
        /// 发送数据
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="message"></param>
        /// <param name=""></param>
        /// <returns></returns>
        public static void Send<T>(T message, IChannel context)
        {
            var channel = Get(w => w.RemoteAddress.ToString() == context.RemoteAddress.ToString());
            if (channel == null) return;

            channel.WriteAndFlushAsync(message);
        }

        /// <summary>
        /// 发送数据
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="message"></param>
        /// <returns></returns>
        public static void Send<T>(T message)
        {
            foreach (var item in _channels)
            {
                try
                {
                    item.WriteAndFlushAsync(message);
                }
                catch (Exception ex)
                {
                    LogUtil.Log.Warning($"设备[{item.RemoteAddress}]发送数据失败!" + ex.Message, ex);
                    continue;
                }

            }
        }


    }
}
