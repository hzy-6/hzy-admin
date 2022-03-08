using HZY.EFCore.DbContexts;
using HZY.Models.Entities.Framework;
using HZY.Repositories.BaseRepositories.Impl;

namespace HZY.Repositories.Framework;

public class SysRoleRepository : AdminEfCoreBaseRepository<SysRole>
{
    public SysRoleRepository(AdminBaseDbContext context) : base(context)
    {

    }
}