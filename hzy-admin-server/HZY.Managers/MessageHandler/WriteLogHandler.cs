using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.EntityFramework.Repositories.Admin.Core;
using HZY.Models.Entities.Framework;
using Zyx.MemoryMQ.Interfaces;

namespace HZY.Managers.MessageHandler
{
    /// <summary>
    /// 消费日志
    /// </summary>
    public class WriteLogHandler : IBus<SysOperationLog>
    {
        public string topic => "WriteInLog";

        private readonly IAdminRepository<SysOperationLog> _sysOperationLogRepository;

        public WriteLogHandler(IAdminRepository<SysOperationLog> sysOperationLogRepository)
        {
            _sysOperationLogRepository = sysOperationLogRepository;
        }

        public async Task HandlerAsync(SysOperationLog data)
        {
            await _sysOperationLogRepository.InsertAsync(data);
        }
    }
}