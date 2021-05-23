using HZY.Repository.Domain;
using HZY.Repository.AppCore.Provider;
using HZY.Repository.AppCore.DbContexts;

namespace HZY.Repository
{
    public class MemberRepository : AdminBaseRepository<Member>
    {
        public MemberRepository(AdminBaseDbContext context) : base(context)
        {

        }
    }
}