using HZY.EFCore.DbContexts;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Repositories.BaseRepositories.Impl;

namespace HZY.Repositories.Framework
{
    /// <summary>
    /// 仓储 SysDataAuthorityCustomRepository
    /// </summary>
    public class SysDataAuthorityCustomRepository : AdminEfCoreBaseRepository<SysDataAuthorityCustom>
    {
        public SysDataAuthorityCustomRepository(AdminBaseDbContext context) : base(context)
        {
        }
    }
}