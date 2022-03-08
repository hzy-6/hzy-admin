using HZY.EFCore.DbContexts;
using HZY.Models.Entities.Framework;
using HZY.Repositories.BaseRepositories.Impl;

namespace HZY.Repositories.Framework;

public class SysOrganizationRepository : AdminEfCoreBaseRepository<SysOrganization>
{
    public SysOrganizationRepository(AdminBaseDbContext context) : base(context)
    {

    }




}