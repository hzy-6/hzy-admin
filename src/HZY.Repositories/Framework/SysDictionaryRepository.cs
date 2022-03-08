using HZY.EFCore.DbContexts;
using HZY.Models.Entities.Framework;
using HZY.Repositories.BaseRepositories.Impl;

namespace HZY.Repositories.Framework;

/// <summary>
/// 数据字典仓储
/// </summary>
public class SysDictionaryRepository : AdminEfCoreBaseRepository<SysDictionary>
{
    public SysDictionaryRepository(AdminBaseDbContext context) : base(context)
    {

    }
}
