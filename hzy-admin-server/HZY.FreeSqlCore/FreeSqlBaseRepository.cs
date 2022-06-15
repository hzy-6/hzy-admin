using FreeSql;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace HZY.FreeSqlCore;

public class FreeSqlBaseRepository<TEntity> : BaseRepository<TEntity> where TEntity : class
{
    public FreeSqlBaseRepository(IFreeSql fsql, Expression<Func<TEntity, bool>> filter, Func<string, string> asTable = null) : base(fsql, filter, asTable)
    {

    }
}

public class AppBaseRepository<TEntity, TKey> : BaseRepository<TEntity, TKey> where TEntity : class
{
    public AppBaseRepository(IFreeSql fsql, Expression<Func<TEntity, bool>> filter, Func<string, string> asTable = null) : base(fsql, filter, asTable)
    {

    }
}