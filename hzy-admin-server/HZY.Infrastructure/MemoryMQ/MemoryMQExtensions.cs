using HZY.Infrastructure.MemoryMQ.Interfaces;
using HZY.Infrastructure.MessageQueue.Models;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.DependencyInjection.Extensions;

namespace HZY.Infrastructure.MemoryMQ
{
  public static class MemoryMQExtensions
  {
    public static IServiceCollection AddMemoryMQ(this IServiceCollection services)
    {
      services.TryAddSingleton<MessageChannel<MessageQueueContext>>();
      services.TryAddSingleton<IMessageProducer<MessageQueueContext>, MessageProducer>();
      services.TryAddSingleton<IMessageConsumer<MessageQueueContext>, MessageConsumer>();

      return services;
    }
  }
}