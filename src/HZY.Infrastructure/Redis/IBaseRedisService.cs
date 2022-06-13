using StackExchange.Redis;

namespace HZY.Infrastructure.Redis
{
    public interface IBaseRedisService : IDisposable
    {

        IDatabase Database { get; }
        IConnectionMultiplexer Multiplexer { get; }


    }
}
