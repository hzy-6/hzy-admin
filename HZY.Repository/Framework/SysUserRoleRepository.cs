using HZY.Repository.Entity.Framework;
using HZY.Repository.Core;

namespace HZY.Repository.Framework
{
    public class SysUserRoleRepository : AppRepository<SysUserRole>
    {
        public SysUserRoleRepository(IFreeSql freeSql) : base(freeSql)
        {
        }
    }
}