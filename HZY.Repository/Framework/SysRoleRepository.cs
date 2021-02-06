using HZY.Repository.Entity.Framework;
using HZY.Repository.Core;

namespace HZY.Repository.Framework
{
    public class SysRoleRepository : AppRepository<SysRole>
    {
        public SysRoleRepository(IFreeSql freeSql) : base(freeSql)
        {
        }
    }
}