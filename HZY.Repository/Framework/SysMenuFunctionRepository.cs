using HZY.Repository.Entity.Framework;
using HZY.Repository.Core;

namespace HZY.Repository.Framework
{
    public class SysMenuFunctionRepository : AppRepository<SysMenuFunction>
    {
        public SysMenuFunctionRepository(IFreeSql freeSql) : base(freeSql)
        {
        }
    }
}