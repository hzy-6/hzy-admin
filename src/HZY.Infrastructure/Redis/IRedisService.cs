using StackExchange.Redis;
using System;
using System.Collections.Generic;
using System.Text;

namespace HZY.Infrastructure.Redis;
public interface IRedisService : IDisposable
{
    IDatabase Database { get; }
    IConnectionMultiplexer Multiplexer { get; }




}