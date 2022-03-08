using HZY.EFCore.DbContexts;
using HZY.Models.Entities;
using HZY.Repositories.BaseRepositories.Impl;

namespace HZY.Repositories;

public class MemberRepository : AdminEfCoreBaseRepository<Member>
{
    public MemberRepository(AdminBaseDbContext context) : base(context)
    {

    }
}