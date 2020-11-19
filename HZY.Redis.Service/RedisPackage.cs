
using System;

namespace HZY.Redis.Service
{
    /// <summary>
    /// Redis 外包装 
    /// 记录过期时间 以及 写入时间和缓存结束时间
    /// </summary>
    /// <typeparam name="TBody"></typeparam>
    public class RedisPackage<TBody>
    {
        public RedisPackage(TBody body, DateTime? cacheEndTime = null)
        {
            this.Body = body;
            this.CacheEndTime = cacheEndTime;

            if (cacheEndTime == null)
            {
                this.ExpirationTime = 60 * 60;
            }
            else
            {
                var timeSpan = Convert.ToDateTime(cacheEndTime) - DateTime.Now;
                this.ExpirationTime = Convert.ToInt32(timeSpan.TotalSeconds);
            }

        }

        /// <summary>
        /// 过期时长
        /// 单位：s
        /// 默认：3600s=1小时
        /// </summary>
        /// <value></value>
        public int ExpirationTime { get; set; }

        /// <summary>
        /// 缓存结束时间
        /// </summary>
        /// <value></value>
        public DateTime? CacheEndTime { get; set; }

        /// <summary>
        /// 数据主体
        /// </summary>
        /// <value></value>
        public TBody Body { get; set; }







    }
}