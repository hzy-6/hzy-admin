using HZY.EFCore.DbContexts;
using HZY.Models.Entities.Framework;
using HZY.Repositories.BaseRepositories.Impl;

namespace HZY.Repositories.Framework;

public class SysMenuFunctionRepository : AdminEfCoreBaseRepository<SysMenuFunction>
{
    public SysMenuFunctionRepository(AdminBaseDbContext context) : base(context)
    {
    }
}