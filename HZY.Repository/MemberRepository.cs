using HZY.Repository.Domain.Framework;
using HZY.Repository.Domain;
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