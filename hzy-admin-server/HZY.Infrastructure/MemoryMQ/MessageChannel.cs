using System.Threading.Channels;

namespace HZY.Infrastructure.MemoryMQ
{
  public class MessageChannel<T>
  {
    public Channel<T> Channel { get; }

    public MessageChannel()
    {
      Channel = System.Threading.Channels.Channel.CreateUnbounded<T>();
    }
  }
}