using HZY.Repository.Domain.Framework;
using HZY.Repository.AppCore;
using HZY.Repository.AppCore.Provider;
using HZY.Repository.AppCore.DbContexts;

namespace HZY.Repository.Framework
{
    /// <summary>
    /// 
    /// </summary>
    public class SysUserRepository : AdminBaseRepository<SysUser>
    {
        public SysUserRepository(AdminBaseDbContext context) : base(context)
        {
        }
    }
}