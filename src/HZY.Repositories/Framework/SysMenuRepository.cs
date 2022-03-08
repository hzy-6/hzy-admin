using HZY.EFCore.DbContexts;
using HZY.Models.Entities.Framework;
using HZY.Repositories.BaseRepositories.Impl;

namespace HZY.Repositories.Framework;

public class SysMenuRepository : AdminEfCoreBaseRepository<SysMenu>
{
    public SysMenuRepository(AdminBaseDbContext context) : base(context)
    {
    }
}