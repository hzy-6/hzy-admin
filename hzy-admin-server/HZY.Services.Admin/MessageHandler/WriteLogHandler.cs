using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.EFCore.Repositories.Admin.Core;
using HZY.Models.Entities.Framework;
using Zyx.MemoryMQ.Interfaces;

namespace HZY.Services.Admin.MessageHandler
{
    public class WriteLogHandler : IBus<SysOperationLog>
    {
        public string topic => "WriteInLog";

        private readonly IAdminRepository<SysOperationLog> sysOperationLogRepository;

        public WriteLogHandler(IAdminRepository<SysOperationLog> sysOperationLogRepository)
        {
            this.sysOperationLogRepository = sysOperationLogRepository;
        }

        public async Task HandlerAsync(SysOperationLog data)
        {
            await sysOperationLogRepository.InsertAsync(data);
        }
    }
}