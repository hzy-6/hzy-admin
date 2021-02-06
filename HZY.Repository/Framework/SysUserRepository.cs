using HZY.Repository.Entity.Framework;
using HZY.Repository.Core;

namespace HZY.Repository.Framework
{
    /// <summary>
    /// 
    /// </summary>
    public class SysUserRepository : AppRepository<SysUser>
    {
        public SysUserRepository(IFreeSql freeSql) : base(freeSql)
        {
        }
    }
}