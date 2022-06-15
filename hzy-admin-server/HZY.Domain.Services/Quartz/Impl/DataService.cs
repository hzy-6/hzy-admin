using HZY.Infrastructure.ApiResultManage;
using HZY.Infrastructure.Redis;
using Microsoft.AspNetCore.Hosting;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Security;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Domain.Services.Quartz.Impl
{
    /// <summary>
    /// 数据服务
    /// </summary>
    public class DataService : IDataService
    {
        private string PathOrKey { get; set; }
        private readonly IRedisService _redisService;

        public DataService(IRedisService redisService)
        {
            _redisService = redisService;
        }

        public bool Init(string pathOrKey)
        {
            PathOrKey = pathOrKey;
            return true;
        }

        /// <summary>
        /// 读取数据
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public async Task<IEnumerable<T>> ReadDataAsync<T>()
        {
            var data = await this._redisService.Database.StringGetAsync(PathOrKey);
            return string.IsNullOrWhiteSpace(data) ? default : JsonConvert.DeserializeObject<IEnumerable<T>>(data);
        }

        /// <summary>
        /// 写入数据
        /// </summary>
        /// <returns></returns>
        public async Task<bool> WriteDataAsync<T>(T contents)
        {
            var json = JsonConvert.SerializeObject(contents);
            await this._redisService.Database.StringSetAsync(PathOrKey, json);//, TimeSpan.FromDays(1)
            return true;
        }

    }
}
