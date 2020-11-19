namespace HZY.Redis.Service
{
    using StackExchange.Redis;

    /// <summary>
    /// Redis 服务类
    /// </summary>
    public class RedisService : IRedisService
    {
        /// <summary>
        /// get database
        /// </summary>
        public IDatabase Database { get; }

        private readonly ConnectionMultiplexer _connectionMultiplexer;

        public RedisService(string connectionString)
        {
            this._connectionMultiplexer = ConnectionMultiplexer.Connect(connectionString);
            this.Database = _connectionMultiplexer.GetDatabase();
        }

        public void Dispose()
        {
            if (this._connectionMultiplexer == null) return;
            this._connectionMultiplexer.Close();
            this._connectionMultiplexer.Dispose();
        }
    }
}