using HZY.EFCore.DbContexts;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Repositories.BaseRepositories.Impl;

namespace HZY.Repositories.Framework
{
    /// <summary>
    /// 仓储 SysDataAuthorityRepository
    /// </summary>
    public class SysDataAuthorityRepository : AdminEfCoreBaseRepository<SysDataAuthority>
    {
        public SysDataAuthorityRepository(AdminBaseDbContext context) : base(context)
        {
        }
    }
}