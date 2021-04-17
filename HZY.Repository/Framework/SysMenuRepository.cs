using HZY.Repository.Domain.Framework;
using HZY.Repository.Core;
using HZY.Repository.Core.Provider;

namespace HZY.Repository.Framework
{
    public class SysMenuRepository : AppRepository<SysMenu>
    {
        public SysMenuRepository(AppDbContext context) : base(context)
        {
        }
    }
}