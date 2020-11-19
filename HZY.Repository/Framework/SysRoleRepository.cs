using HZY.Models.Framework;
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