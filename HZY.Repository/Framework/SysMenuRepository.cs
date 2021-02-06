using HZY.Repository.Entity.Framework;
using HZY.Repository.Core;

namespace HZY.Repository.Framework
{
    public class SysMenuRepository : AppRepository<SysMenu>
    {
        public SysMenuRepository(IFreeSql freeSql) : base(freeSql)
        {
        }
    }
}