using HZY.Infrastructure.MemoryMQ.Interfaces;
using HZY.Infrastructure.MessageQueue.Models;
using HZY.Infrastructure.SerilogUtil;

namespace HZY.Infrastructure.MemoryMQ
{
  public class MessageConsumer : IMessageConsumer<MessageQueueContext>
  {
    private readonly MessageChannel<MessageQueueContext> channel;
    private readonly IServiceProvider serviceProvider;

    public MessageConsumer(MessageChannel<MessageQueueContext> channel, IServiceProvider serviceProvider)
    {
      this.channel = channel;
      this.serviceProvider = serviceProvider;
    }

    private CancellationTokenSource source = new CancellationTokenSource();
    public CancellationTokenSource Source => source;

    public void Cancel()
    {
      source.Cancel();
    }

    public void Dispose()
    {

    }

    public async Task StartAsync()
    {
      await Task.Factory.StartNew(async () =>
      {
        while (!source.IsCancellationRequested)
        {
          var reader = await channel.Channel.Reader.ReadAsync(source.Token);
          try
          {
            reader.Call?.Invoke(reader.Message, serviceProvider);
          }
          catch (System.Exception ex)
          {
            LogUtil.Log.Error(ex.Message, ex);
            Console.WriteLine("队列消费异常：" + ex.Message);
          }
        }
      }, TaskCreationOptions.LongRunning);
    }
  }
}