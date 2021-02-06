using HZY.Repository.Entity.Framework;
using HZY.Repository.Core;

namespace HZY.Repository.Framework
{
    public class SysFunctionRepository : AppRepository<SysFunction>
    {
        public SysFunctionRepository(IFreeSql freeSql) : base(freeSql)
        {

        }
    }
}