using HZY.Repository.Domain.Framework;
using HZY.Repository.Core;
using HZY.Repository.Core.Provider;

namespace HZY.Repository.Framework
{
    /// <summary>
    /// 
    /// </summary>
    public class SysUserRepository : AppRepository<SysUser>
    {
        public SysUserRepository(AppDbContext context) : base(context)
        {
        }
    }
}