using DotNetty.Codecs;
using DotNetty.Common.Internal.Logging;
using DotNetty.Handlers.Logging;
using DotNetty.Handlers.Tls;
using DotNetty.Transport.Bootstrapping;
using DotNetty.Transport.Channels;
using DotNetty.Transport.Channels.Sockets;
using DotNetty.Transport.Libuv;
using HZY.Services.CodeScanner.Codec;
using HZY.Infrastructure.SerilogUtil;
using HzyScanDiService.Extensions;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Serilog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using HZY.Services.CodeScanner.ChannelHandler;

namespace HZY.Services.CodeScanner
{
    /// <summary>
    /// 扫码器服务
    /// </summary>
    public class CodeScannerServer
    {
        private static readonly string settingPrefix = "CodeScanner";
        public static readonly string Ip;
        public static readonly int Port;
        /// <summary>
        /// 
        /// </summary>
        public static readonly bool UseLibuv = true;
        /// <summary>
        /// 是否需要证书
        /// </summary>
        public static readonly bool IsSsl = false;
        /// <summary>
        /// 通道
        /// </summary>
        private static IChannel _channel = null;
        /// <summary>
        /// 老板组
        /// </summary>
        private static IEventLoopGroup bossGroup;
        /// <summary>
        /// 员工组
        /// </summary>
        private static IEventLoopGroup workerGroup;

        static CodeScannerServer()
        {
            using var scope = ServiceProviderExtensions.CreateScope();
            var configuration = scope.ServiceProvider.GetService<IConfiguration>();

            Ip = configuration[$"{settingPrefix}:{nameof(Ip)}"];
            Port = Convert.ToInt32(configuration[$"{settingPrefix}:{nameof(Port)}"]);

        }

        /// <summary>
        /// 运行服务
        /// </summary>
        /// <returns></returns>
        public static async Task<IChannel> RunServerAsync()
        {
            if (_channel != null) return _channel;

            //配置日志
            InternalLoggerFactory.DefaultFactory = new LoggerFactory().AddSerilog(LogUtil.Log);

            //初始化 老板组 和 员工组
            if (CodeScannerServer.UseLibuv)
            {
                var dispatcher = new DispatcherEventLoopGroup();
                bossGroup = dispatcher;
                workerGroup = new WorkerEventLoopGroup(dispatcher);
            }
            else
            {
                bossGroup = new MultithreadEventLoopGroup(1);
                workerGroup = new MultithreadEventLoopGroup();
            }

            //设置证书
            X509Certificate2 tlsCertificate = null;
            if (CodeScannerServer.IsSsl)
            {
                tlsCertificate = new X509Certificate2(AppDomain.CurrentDomain.BaseDirectory + "/dotnetty.com.pfx", "password");
            }

            var bootstrap = new ServerBootstrap();
            bootstrap.Group(bossGroup, workerGroup);
            //设置通道类型
            if (CodeScannerServer.UseLibuv)
            {
                bootstrap.Channel<TcpServerChannel>();
            }
            else
            {
                bootstrap.Channel<TcpServerSocketChannel>();
            }

            //设置服务
            bootstrap
                .Option(ChannelOption.SoBacklog, 100)
                .Handler(new LoggingHandler("SRV-LSTN"))
                //保持长连接
                .ChildOption(ChannelOption.SoKeepalive, true)
                //取消延迟发送
                .ChildOption(ChannelOption.TcpNodelay, true)
                //端口复用
                .ChildOption(ChannelOption.SoReuseport, true)
                //
                .ChildHandler(new ActionChannelInitializer<IChannel>(channel =>
                {
                    IChannelPipeline pipeline = channel.Pipeline;
                    if (tlsCertificate != null)
                    {
                        pipeline.AddLast("tls", TlsHandler.Server(tlsCertificate));
                    }
                    pipeline.AddLast(new LoggingHandler("SRV-CONN"));
                    //编码器
                    pipeline.AddLast("framing-enc", new SendMessageFrameEncoder());
                    //解码器 这里采用换行符解码器
                    pipeline.AddLast("framing-dec", new LineBasedFrameDecoder(2048));
                    //接收数据处理器
                    pipeline.AddLast("echo", new EchoServerChannelHandler());
                }));

            if (string.IsNullOrWhiteSpace(CodeScannerServer.Ip))
            {
                _channel = await bootstrap.BindAsync(CodeScannerServer.Port);
            }
            else
            {
                _channel = await bootstrap.BindAsync(IPAddress.Parse(CodeScannerServer.Ip), CodeScannerServer.Port);
            }

            return _channel;
        }

        /// <summary>
        /// 关闭通道 和 socket 资源
        /// </summary>
        public static async Task<IChannel> CloseAsync()
        {
            if (_channel == null) return default;

            await _channel.CloseAsync();

            if (bossGroup != null && workerGroup != null)
            {
                await Task.WhenAll(
                bossGroup.ShutdownGracefullyAsync(TimeSpan.FromMilliseconds(100), TimeSpan.FromSeconds(1)),
                workerGroup.ShutdownGracefullyAsync(TimeSpan.FromMilliseconds(100), TimeSpan.FromSeconds(1)));
            }

            return _channel;
        }




    }
}
