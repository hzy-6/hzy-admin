using DotNetty.Buffers;
using DotNetty.Transport.Channels;
using HZY.Infrastructure.SerilogUtil;
using HZY.Services.CodeScanner.Sessions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Services.CodeScanner.ChannelHandler
{
    /*
        * 
        * Channel的生命周期 ：
        * 1.ChannelRegistered 先注册
        * 2.ChannelActive 再被激活
        * 3.ChannelRead 客户端与服务端建立连接之后的会话（数据交互）
        * 4.ChannelReadComplete 读取客户端发送的消息完成之后
        * error. ExceptionCaught 如果在会话过程当中出现dotnetty框架内部异常都会通过Caught方法返回给开发者
        * 5.ChannelInactive 使当前频道处于未激活状态
        * 6.ChannelUnregistered 取消注册
        * 
    */


    /// <summary>
    /// 服务通道处理器
    /// </summary>
    public class EchoServerChannelHandler : ChannelHandlerAdapter
    {
        /// <summary>
        /// 读取通道数据
        /// </summary>
        /// <param name="context"></param>
        /// <param name="message"></param>
        public override void ChannelRead(IChannelHandlerContext context, object message)
        {
            var buffer = message as IByteBuffer;
            if (buffer != null)
            {
                AppSession.Send($"{context.Channel.RemoteAddress.ToString()} 说：{buffer.ToString(Encoding.UTF8)}");
            }

            //AppSession.Send(message, context);

            //context.WriteAndFlushAsync(message);
        }

        /// <summary>
        /// 读取通道数据完成
        /// </summary>
        /// <param name="context"></param>
        public override void ChannelReadComplete(IChannelHandlerContext context) => context.Flush();

        /// <summary>
        /// 通道 异常
        /// </summary>
        /// <param name="context"></param>
        /// <param name="exception"></param>
        public override void ExceptionCaught(IChannelHandlerContext context, Exception exception)
        {
            LogUtil.Log.Debug("EchoServerChannelHandler > ExceptionCaught > 异常", exception);
            context.CloseAsync();
            AppSession.Remove(context.Channel);
        }

        /// <summary>
        /// 通道注册事件
        /// </summary>
        /// <param name="context"></param>
        public override void ChannelRegistered(IChannelHandlerContext context)
        {
            base.ChannelRegistered(context);
            AppSession.Add(context.Channel);
        }

        /// <summary>
        /// 通道取消注册
        /// </summary>
        /// <param name="context"></param>
        public override void ChannelUnregistered(IChannelHandlerContext context)
        {
            base.ChannelUnregistered(context);
            context.CloseAsync();
            AppSession.Remove(context.Channel);
        }

        /// <summary>
        /// 通道活跃
        /// </summary>
        /// <param name="context"></param>
        public override void ChannelActive(IChannelHandlerContext context)
        {
            base.ChannelActive(context);
            AppSession.Add(context.Channel);
        }

        /// <summary>
        /// 通道不活跃
        /// </summary>
        /// <param name="context"></param>
        public override void ChannelInactive(IChannelHandlerContext context)
        {
            base.ChannelInactive(context);
            context.CloseAsync();
            AppSession.Remove(context.Channel);
        }

        /// <summary>
        /// 添加通道
        /// </summary>
        /// <param name="context"></param>
        public override void HandlerAdded(IChannelHandlerContext context)
        {
            base.HandlerAdded(context);
            AppSession.Add(context.Channel);
        }

        /// <summary>
        /// 移除通道
        /// </summary>
        /// <param name="context"></param>
        public override void HandlerRemoved(IChannelHandlerContext context)
        {
            base.HandlerRemoved(context);
            context.CloseAsync();
            AppSession.Remove(context.Channel);
        }





    }
}
