namespace HZY.Core.Redis.Services.Impl;

public class RedisServiceImpl : IRedisService
{
    /// <summary>
    /// get database
    /// </summary>
    public IDatabase Database { get; }
    public IConnectionMultiplexer Multiplexer { get; }

    public RedisServiceImpl(string connectionString)
    {
        Multiplexer = ConnectionMultiplexer.Connect(connectionString);
        Database = Multiplexer.GetDatabase();
    }

    public void Dispose()
    {
        if (Multiplexer == null) return;
        Multiplexer.Close();
        Multiplexer.Dispose();
    }

    /// <summary>
    /// 获取指定Redis数据库
    /// </summary>
    /// <param name="db"></param>
    /// <returns></returns>
    public IDatabase UseDatabase(int db)
    {
        return Multiplexer.GetDatabase(db);
    }
}
