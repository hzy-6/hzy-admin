using DotNetty.Buffers;
using DotNetty.Codecs;
using DotNetty.Transport.Channels;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Services.CodeScanner.Codec
{
    /// <summary>
    /// 发送消息 帧 编码器
    /// </summary>
    public class SendMessageFrameEncoder : MessageToByteEncoder<object>
    {
        protected override void Encode(IChannelHandlerContext context, object message, IByteBuffer output)
        {
            if (message is string)
            {
                //var buffer = Unpooled.CopiedBuffer((string)message, Encoding.Default);
                output.WriteBytes(Encoding.UTF8.GetBytes((string)message));
            }

        }
    }
}
