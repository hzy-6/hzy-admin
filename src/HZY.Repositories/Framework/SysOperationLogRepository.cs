using HZY.EFCore.DbContexts;
using HZY.Models.Entities.Framework;
using HZY.Repositories.BaseRepositories.Impl;

namespace HZY.Repositories.Framework;

/// <summary>
/// 操作日志 仓储
/// </summary>
public class SysOperationLogRepository : AdminEfCoreBaseRepository<SysOperationLog>
{
    public SysOperationLogRepository(AdminBaseDbContext context) : base(context)
    {

    }





}