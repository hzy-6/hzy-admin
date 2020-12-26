using HZY.Repository.Entity;
using HZY.Repository.Core;
using HZY.Repository.Core.Provider;

namespace HZY.Repository
{
    public class MemberRepository : AppRepository<Member>
    {
        public MemberRepository(AppDbContext context) : base(context)
        {

        }
    }
}