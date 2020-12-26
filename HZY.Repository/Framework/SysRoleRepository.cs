using HZY.Repository.Entity.Framework;
using HZY.Repository.Core;
using HZY.Repository.Core.Provider;

namespace HZY.Repository.Framework
{
    public class SysRoleRepository : AppRepository<SysRole>
    {
        public SysRoleRepository(AppDbContext context) : base(context)
        {
        }
    }
}