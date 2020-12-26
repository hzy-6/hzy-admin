using HZY.Repository.Entity.Framework;
using HZY.Repository.Core;
using HZY.Repository.Core.Provider;

namespace HZY.Repository.Framework
{
    public class SysFunctionRepository : AppRepository<SysFunction>
    {
        public SysFunctionRepository(AppDbContext context) : base(context)
        {
        }
    }
}