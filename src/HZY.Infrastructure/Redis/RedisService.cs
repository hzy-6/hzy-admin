using HZY.Infrastructure.Redis;
using StackExchange.Redis;

namespace HZY.Repository.Redis;

/// <summary>
/// Redis 服务类
/// </summary>
public class RedisService : IRedisService
{
    /// <summary>
    /// get database
    /// </summary>
    public IDatabase Database { get; }
    public IConnectionMultiplexer Multiplexer { get; }

    private readonly ConnectionMultiplexer _connectionMultiplexer;

    public RedisService(string connectionString)
    {
        this._connectionMultiplexer = ConnectionMultiplexer.Connect(connectionString);
        this.Database = _connectionMultiplexer.GetDatabase();
        this.Multiplexer = this.Database.Multiplexer;
    }

    public void Dispose()
    {
        if (this._connectionMultiplexer == null) return;
        this._connectionMultiplexer.Close();
        this._connectionMultiplexer.Dispose();
    }
}