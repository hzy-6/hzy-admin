using HZY.Repository.Domain.Framework;
using HZY.Repository.AppCore;
using HZY.Repository.AppCore.Provider;
using HZY.Repository.AppCore.DbContexts;

namespace HZY.Repository.Framework
{
    public class SysMenuRepository : AdminBaseRepository<SysMenu>
    {
        public SysMenuRepository(AdminBaseDbContext context) : base(context)
        {
        }
    }
}