using HZY.Repository.Domain.Framework;
using HZY.Repository.Core;
using HZY.Repository.Core.Provider;

namespace HZY.Repository.Framework
{
    public class SysMenuFunctionRepository : AppRepository<SysMenuFunction>
    {
        public SysMenuFunctionRepository(AppDbContext context) : base(context)
        {
        }
    }
}