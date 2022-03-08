using HZY.EFCore.DbContexts;
using HZY.Models.Entities.Framework;
using HZY.Repositories.BaseRepositories.Impl;

namespace HZY.Repositories.Framework;

public class SysPostRepository : AdminEfCoreBaseRepository<SysPost>
{
    public SysPostRepository(AdminBaseDbContext context) : base(context)
    {

    }

}