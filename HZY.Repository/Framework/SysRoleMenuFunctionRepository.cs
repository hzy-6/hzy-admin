using HZY.Repository.Domain.Framework;
using HZY.Repository.Core;
using HZY.Repository.Core.Provider;

namespace HZY.Repository.Framework
{
    public class SysRoleMenuFunctionRepository : AppRepository<SysRoleMenuFunction>
    {
        public SysRoleMenuFunctionRepository(AppDbContext context) : base(context)
        {
        }
    }
}