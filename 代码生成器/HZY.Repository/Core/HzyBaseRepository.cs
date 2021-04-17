using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Threading.Tasks;
using FreeSql;

namespace HZY.Repository.Core
{
    /// <summary>
    /// 仓储服务基类
    /// </summary>
    /// <typeparam name="TModel"></typeparam>
    public class HzyBaseRepository<TModel> : HzyBaseRepository<TModel, Guid> where TModel : class
    {
        protected HzyBaseRepository(IFreeSql freeSql) : base(freeSql, null)
        {
        }
    }

    /// <summary>
    /// 仓储服务基类
    /// </summary>
    /// <typeparam name="TModel"></typeparam>
    /// <typeparam name="TKey"></typeparam>
    public class HzyBaseRepository<TModel, TKey> : BaseRepository<TModel, TKey> where TModel : class
    {
        protected HzyBaseRepository(IFreeSql freeSql, Expression<Func<TModel, bool>> filter,
            Func<string, string> asTable = null) : base(freeSql, filter, asTable)
        {
        }

        /// <summary>
        /// 根据 id 数组删除数据
        /// </summary>
        /// <param name="keys"></param>
        /// <returns></returns>
        public Task<int> DeleteAsync(IEnumerable<TKey> keys)
        {
            return this.Orm.Delete<TModel>(keys).ExecuteAffrowsAsync();
        }
    }
}