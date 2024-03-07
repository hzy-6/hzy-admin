namespace HZY.Core.Redis.Services;

/// <summary>
/// redis 基础服务
/// </summary>
public interface IBaseRedisService : IDisposable
{

    /// <summary>
    /// redis 数据库操作
    /// </summary>
    IDatabase Database { get; }

    /// <summary>
    /// 
    /// </summary>
    IConnectionMultiplexer Multiplexer { get; }

    /// <summary>
    /// 获取数据库
    /// </summary>
    /// <param name="db"></param>
    /// <returns></returns>
    IDatabase UseDatabase(int db = -1);
}
