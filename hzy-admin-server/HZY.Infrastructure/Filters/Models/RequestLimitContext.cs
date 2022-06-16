using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Infrastructure.Filters.Models
{
    /// <summary>
    /// 请求限制上下文
    /// </summary>
    public class RequestLimitContext
    {
        /// <summary>
        /// 限制次数
        /// </summary>
        public int LimitCount { get; set; }

        /// <summary>
        /// 最后活跃时间
        /// </summary>
        public DateTime ActiveTime { get; set; }


    }
}
