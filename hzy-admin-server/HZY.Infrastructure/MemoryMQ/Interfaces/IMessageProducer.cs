namespace HZY.Infrastructure.MemoryMQ.Interfaces
{
  public interface IMessageProducer<T> : IDisposable
  {
    ValueTask ProduceAsync(string key, object message, Action<object, IServiceProvider> action, CancellationToken cancellationToken = default);
  }
}