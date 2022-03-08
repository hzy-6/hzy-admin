using HZY.EFCore.DbContexts;
using HZY.Infrastructure.ScanDIService.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Repositories.BaseRepositories.Impl
{
    public class AdminEfCoreBaseRepository<T> : AdminEfCoreBaseRepositoryImpl<T>, IAdminEfCoreBaseRepository<T>, IDiScopedSelf where T : class, new()
    {
        public AdminEfCoreBaseRepository(AdminBaseDbContext context, Expression<Func<T, bool>> filter = null) : base(context, filter)
        {

        }


    }
}
