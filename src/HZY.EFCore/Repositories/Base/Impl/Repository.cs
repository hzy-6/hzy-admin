using HZY.EFCore.DbContexts;
using HzyScanDiService.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace HZY.EFCore.Repositories.Base.Impl
{
    public class Repository<T> : RepositoryImpl<T>, IRepository<T>, IDiTransientSelf where T : class, new()
    {
        public Repository(AdminBaseDbContext context, Expression<Func<T, bool>> filter = null) : base(context, filter)
        {

        }


    }
}
