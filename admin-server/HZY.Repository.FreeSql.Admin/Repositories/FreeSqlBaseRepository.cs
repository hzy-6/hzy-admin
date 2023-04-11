namespace HZY.Repository.FreeSql.Admin.Repositories;

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