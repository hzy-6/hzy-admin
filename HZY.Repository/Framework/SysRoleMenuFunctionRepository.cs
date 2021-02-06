using HZY.Repository.Entity.Framework;
using HZY.Repository.Core;

namespace HZY.Repository.Framework
{
    public class SysRoleMenuFunctionRepository : AppRepository<SysRoleMenuFunction>
    {
        public SysRoleMenuFunctionRepository(IFreeSql freeSql) : base(freeSql)
        {
        }
    }
}