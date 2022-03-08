using HZY.EFCore.DbContexts;
using HZY.Models.Entities.Framework;
using HZY.Repositories.BaseRepositories.Impl;

namespace HZY.Repositories.Framework;

public class SysUserRepository : AdminEfCoreBaseRepository<SysUser>
{
    public SysUserRepository(AdminBaseDbContext context) : base(context)
    {
    }
}