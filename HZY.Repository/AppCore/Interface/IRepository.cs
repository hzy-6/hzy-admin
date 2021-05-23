/*
 * *******************************************************
 *
 * 作者：hzy
 *
 * 开源地址：https://gitee.com/hzy6
 *
 * *******************************************************
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace HZY.Repository.AppCore.Interface
{
    public interface IRepository<T, out TDbContext> where T : class where TDbContext : DbContext
    {
        TDbContext Orm => default;

        void SetAttach(T model, EntityState entityState);

        #region 插入

        T Insert(T model);
        int InsertRange(IEnumerable<T> model);

        Task<T> InsertAsync(T model);
        Task<int> InsertRangeAsync(IEnumerable<T> model);

        #endregion

        #region 更新

        int Update(T model);
        int UpdateById(T model);
        int Update(T oldModel, T newModel);
        int UpdateRange(IEnumerable<T> models);

        Task<int> UpdateAsync(T model);
        Task<int> UpdateByIdAsync(T model);
        Task<int> UpdateAsync(T oldModel, T newModel);
        Task<int> UpdateRangeAsync(IEnumerable<T> models);

        #endregion

        #region 插入或者更新

        T InsertOrUpdate(T model);

        Task<T> InsertOrUpdateAsync(T model);

        #endregion

        #region 删除

        int Delete(T model);
        int Delete(IEnumerable<T> models);
        int Delete(Expression<Func<T, bool>> expWhere);
        int DeleteById<TKey>(TKey key);
        int DeleteByIds<TKey>(IEnumerable<TKey> keys);

        Task<int> DeleteAsync(T model);
        Task<int> DeleteAsync(IEnumerable<T> models);
        Task<int> DeleteAsync(Expression<Func<T, bool>> expWhere);
        Task<int> DeleteByIdAsync<TKey>(TKey key);
        Task<int> DeleteByIdsAsync<TKey>(IEnumerable<TKey> keys);

        #endregion

        #region 查询 复杂型

        IQueryable<T> Query(bool isTracking);
        IQueryable<T> Select => this.Query(true);
        IQueryable<T> SelectNoTracking => this.Query(false);

        #endregion

        #region 查询 单条

        T Find(Expression<Func<T, bool>> expWhere);
        T FindById<TKey>(TKey key);
        T FindByIds<TKey>(IEnumerable<TKey> keys);

        Task<T> FindAsync(Expression<Func<T, bool>> expWhere);
        Task<T> FindByIdAsync<TKey>(TKey key);
        Task<T> FindByIdsAsync<TKey>(IEnumerable<TKey> keys);

        #endregion

        #region 查询 多条

        List<T> ToList(Expression<Func<T, bool>> expWhere);
        List<T> ToListAll();

        Task<List<T>> ToListAsync(Expression<Func<T, bool>> expWhere);
        Task<List<T>> ToListAllAsync();

        #endregion

        #region 是否存在 、 数量

        int Count();
        long CountLong();
        int Count(Expression<Func<T, bool>> where);
        long CountLong(Expression<Func<T, bool>> where);
        bool Any(Expression<Func<T, bool>> where);

        Task<int> CountAsync();
        Task<long> CountLongAsync();
        Task<int> CountAsync(Expression<Func<T, bool>> where);
        Task<long> CountLongAsync(Expression<Func<T, bool>> where);
        Task<bool> AnyAsync(Expression<Func<T, bool>> where);

        #endregion
    }
}