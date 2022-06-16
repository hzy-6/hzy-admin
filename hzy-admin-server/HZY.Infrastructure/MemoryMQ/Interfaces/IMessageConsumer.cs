namespace HZY.Infrastructure.MemoryMQ.Interfaces
{
  public interface IMessageConsumer<T> : IDisposable
  {
    CancellationTokenSource Source { get; }

    Task StartAsync();

    void Cancel();
  }
}