using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Domain.Services.Quartz.Models
{
    /// <summary>
    /// 任务日志信息
    /// </summary>
    public class JobLoggerInfo
    {
        public Guid Id { get; set; }

        public Guid TasksId { get; set; }

        public string Text { get; set; }

        public DateTime CreateTime { get; set; }



    }
}
