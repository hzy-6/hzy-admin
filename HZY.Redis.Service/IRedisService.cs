using StackExchange.Redis;
using System;
using System.Collections.Generic;
using System.Text;

namespace HZY.Redis.Service
{
    public interface IRedisService : IDisposable
    {
        IDatabase Database { get; }





    }
}
