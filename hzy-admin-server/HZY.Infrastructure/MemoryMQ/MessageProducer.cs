using HZY.Infrastructure.MemoryMQ.Interfaces;
using HZY.Infrastructure.MessageQueue.Models;

namespace HZY.Infrastructure.MemoryMQ
{
  public class MessageProducer : IMessageProducer<MessageQueueContext>
  {
    private readonly MessageChannel<MessageQueueContext> channel;

    public MessageProducer(MessageChannel<MessageQueueContext> channel)
    {
      this.channel = channel;
    }

    public void Dispose()
    {

    }

    public async ValueTask ProduceAsync(string key, object message, Action<object, IServiceProvider> action, CancellationToken cancellationToken = default)
    {
      await channel.Channel.Writer.WriteAsync(new MessageQueueContext(key, message, action), cancellationToken);
    }
  }
}