using HZY.Repository.Domain.Framework;
using HZY.Repository.Core;
using HZY.Repository.Core.Provider;

namespace HZY.Repository.Framework
{
    public class SysUserRoleRepository : AppRepository<SysUserRole>
    {
        public SysUserRoleRepository(AppDbContext context) : base(context)
        {
        }
    }
}