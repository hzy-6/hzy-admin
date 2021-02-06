using HZY.Repository.Entity;
using HZY.Repository.Core;

namespace HZY.Repository
{
    public class MemberRepository : AppRepository<Member>
    {
        public MemberRepository(IFreeSql freeSql) : base(freeSql)
        {

        }
    }
}