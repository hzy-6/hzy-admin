using HZY.EFCore.DbContexts;
using HZY.Models.Entities.Framework;
using HZY.Repositories.BaseRepositories.Impl;

namespace HZY.Repositories.Framework;

public class SysFunctionRepository : AdminEfCoreBaseRepository<SysFunction>
{
    public SysFunctionRepository(AdminBaseDbContext context) : base(context)
    {
    }
}