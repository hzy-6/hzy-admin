using HZY.EFCore.DbContexts;
using HZY.Models.Entities.Framework;
using HZY.Repositories.BaseRepositories.Impl;

namespace HZY.Repositories.Framework;

public class SysUserPostRepository : AdminEfCoreBaseRepository<SysUserPost>
{
    public SysUserPostRepository(AdminBaseDbContext context) : base(context)
    {

    }




}