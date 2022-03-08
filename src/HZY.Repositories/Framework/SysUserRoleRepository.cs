using HZY.EFCore.DbContexts;
using HZY.Models.Entities.Framework;
using HZY.Repositories.BaseRepositories.Impl;

namespace HZY.Repositories.Framework;

public class SysUserRoleRepository : AdminEfCoreBaseRepository<SysUserRole>
{
    public SysUserRoleRepository(AdminBaseDbContext context) : base(context)
    {

    }
}