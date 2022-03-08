using HZY.EFCore.DbContexts;
using HZY.Models.Entities.Framework;
using HZY.Repositories.BaseRepositories.Impl;

namespace HZY.Repositories.Framework;

public class SysRoleMenuFunctionRepository : AdminEfCoreBaseRepository<SysRoleMenuFunction>
{
    public SysRoleMenuFunctionRepository(AdminBaseDbContext context) : base(context)
    {

    }
}