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
using System.Reflection;
using System.Threading.Tasks;
using HZY.Repository.AppCore.Extensions;
using HZY.Repository.AppCore.Interface;
using HZY.Repository.AppCore.Provider;
using Microsoft.EntityFrameworkCore;

namespace HZY.Repository.AppCore.Impl
{
    /// <summary>
    /// 基础仓储 实现
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <typeparam name="TDbContext"></typeparam>
    public abstract class RepositoryImpl<T, TDbContext> : IRepository<T, TDbContext>
        where T : class, new()
        where TDbContext : DbContext
    {
        private readonly TDbContext _context;
        private readonly DbSet<T> _dbSet;
        private readonly PropertyInfo _keyPropertyInfo;

        public RepositoryImpl(TDbContext context)
        {
            this._context = context;
            _dbSet = context.Set<T>();
            _keyPropertyInfo = typeof(T).GetKeyProperty();
        }

        /// <summary>
        /// DbContext 对象
        /// </summary>
        public virtual TDbContext Orm => this._context;

        /// <summary>
        /// 设置 跟踪 Attachq
        /// </summary>
        /// <param name="model"></param>
        /// <param name="entityState"></param>
        public virtual void SetAttach(T model, EntityState entityState)
        {
            //Context.Entry(model).State = entityState;
            //如果 newModel 未被跟踪 则手动 Attach
            var attach = _context.Attach(model);
            if (attach != null)
            {
                attach.State = entityState;
            }
        }

        #region 插入

        public virtual T Insert(T model)
        {
            this._dbSet.Add(model);
            this._context.SaveChanges();
            return model;
        }

        public virtual int InsertRange(IEnumerable<T> model)
        {
            this._dbSet.AddRange(model);
            return this._context.SaveChanges();
        }

        public virtual async Task<T> InsertAsync(T model)
        {
            await this._dbSet.AddAsync(model);
            await this._context.SaveChangesAsync();
            return model;
        }

        public virtual Task<int> InsertRangeAsync(IEnumerable<T> model)
        {
            this._dbSet.AddRangeAsync(model);
            return this._context.SaveChangesAsync();
        }

        #endregion

        #region 更新

        public virtual int Update(T model)
        {
            this._dbSet.Update(model);
            return this._context.SaveChanges();
        }

        public virtual int UpdateById(T model)
        {
            var name = this._keyPropertyInfo.Name;
            var value = this._keyPropertyInfo.GetValue(model);
            var exp = HzyRepositoryExtensions.CreateEqualExpression<T>(name, value);
            var oldModel = this._dbSet.FirstOrDefault(exp);
            if (oldModel == null) return -1;
            return this.Update(oldModel, model);
        }

        public virtual int Update(T oldModel, T newModel)
        {
            this._context.Entry(oldModel).CurrentValues.SetValues(newModel);
            return this._context.SaveChanges();
        }

        public virtual int UpdateRange(IEnumerable<T> models)
        {
            this._dbSet.UpdateRange(models);
            return this._context.SaveChanges();
        }

        public virtual Task<int> UpdateAsync(T model)
        {
            this._dbSet.Update(model);
            return this._context.SaveChangesAsync();
        }

        public virtual async Task<int> UpdateByIdAsync(T model)
        {
            var name = this._keyPropertyInfo.Name;
            var value = this._keyPropertyInfo.GetValue(model);
            var exp = HzyRepositoryExtensions.CreateEqualExpression<T>(name, value);
            var oldModel = await this.Query().FirstOrDefaultAsync(exp);
            if (oldModel == null) return -1;
            return await this.UpdateAsync(oldModel, model);
        }

        public virtual Task<int> UpdateAsync(T oldModel, T newModel)
        {
            this._context.Entry(oldModel).CurrentValues.SetValues(newModel);
            return this._context.SaveChangesAsync();
        }

        public virtual Task<int> UpdateRangeAsync(IEnumerable<T> models)
        {
            this._dbSet.UpdateRange(models);
            return this._context.SaveChangesAsync();
        }

        #endregion

        #region 插入或者更新

        public virtual T InsertOrUpdate(T model)
        {
            var name = this._keyPropertyInfo.Name;
            var value = this._keyPropertyInfo.GetValue(model);
            var exp = HzyRepositoryExtensions.CreateEqualExpression<T>(name, value);
            var oldModel = this._dbSet.FirstOrDefault(exp);
            if (oldModel == null)
                this.Insert(model);
            else
                this.Update(oldModel, model);
            return model;
        }

        public virtual async Task<T> InsertOrUpdateAsync(T model)
        {
            var name = this._keyPropertyInfo.Name;
            var value = this._keyPropertyInfo.GetValue(model);
            var exp = HzyRepositoryExtensions.CreateEqualExpression<T>(name, value);
            var oldModel = await this._dbSet.FirstOrDefaultAsync(exp);
            if (oldModel == null)
                await this.InsertAsync(model);
            else
                await this.UpdateAsync(oldModel, model);
            return model;
        }

        #endregion

        #region 删除

        public virtual int Delete(T model)
        {
            this._dbSet.Remove(model);
            return this._context.SaveChanges();
        }

        public virtual int Delete(IEnumerable<T> models)
        {
            this._dbSet.RemoveRange(models);
            return this._context.SaveChanges();
        }

        public virtual int Delete(Expression<Func<T, bool>> expWhere)
            => this.Delete(this._dbSet.Where(expWhere));

        public virtual int DeleteById<TKey>(TKey key)
        {
            if (key.GetType().Name == "List`1")
            {
                return DeleteByIds((IEnumerable<TKey>)key);
            }
            var exp = HzyRepositoryExtensions.CreateEqualExpression<T, TKey>(_keyPropertyInfo.Name, key);
            return this.Delete(this._dbSet.FirstOrDefault(exp));
        }

        public virtual int DeleteByIds<TKey>(IEnumerable<TKey> keys)
        {
            var exp = HzyRepositoryExtensions.CreateContainsExpression<T, TKey>(_keyPropertyInfo.Name, keys);
            return this.Delete(this._dbSet.Where(exp).ToList());
        }

        public virtual Task<int> DeleteAsync(T model)
        {
            this._dbSet.Remove(model);
            return this._context.SaveChangesAsync();
        }

        public virtual Task<int> DeleteAsync(IEnumerable<T> models)
        {
            this._dbSet.RemoveRange(models);
            return this._context.SaveChangesAsync();
        }

        public virtual Task<int> DeleteAsync(Expression<Func<T, bool>> expWhere)
            => this.DeleteAsync(this._dbSet.Where(expWhere));

        public virtual async Task<int> DeleteByIdAsync<TKey>(TKey key)
        {
            if (key.GetType().Name == "List`1")
            {
                return await DeleteByIdsAsync((IEnumerable<TKey>)key);
            }
            var exp = HzyRepositoryExtensions.CreateEqualExpression<T, TKey>(_keyPropertyInfo.Name, key);
            return await this.DeleteAsync(await this._dbSet.FirstOrDefaultAsync(exp));
        }

        public async Task<int> DeleteByIdsAsync<TKey>(IEnumerable<TKey> keys)
        {
            var exp = HzyRepositoryExtensions.CreateContainsExpression<T, TKey>(_keyPropertyInfo.Name, keys);
            return await this.DeleteAsync(await this._dbSet.Where(exp).ToListAsync());
        }

        #endregion

        #region 查询 复杂型

        /// <summary>
        /// 查询
        /// </summary>
        /// <param name="isTracking">是否追踪</param>
        /// <returns></returns>
        public virtual IQueryable<T> Query(bool isTracking = true)
            => isTracking ? this._dbSet.AsQueryable() : this._dbSet.AsNoTracking();

        /// <summary>
        /// 查询 有跟踪
        /// </summary>
        public virtual IQueryable<T> Select => this.Query();

        /// <summary>
        /// 查询 无跟踪
        /// </summary>
        public virtual IQueryable<T> SelectNoTracking => this.Query(false);

        #endregion

        #region 查询 单条

        public virtual T Find(Expression<Func<T, bool>> expWhere)
            => this.Query().Where(expWhere).FirstOrDefault();

        public virtual T FindById<TKey>(TKey key)
            => this._dbSet.Find(key);

        public virtual T FindByIds<TKey>(IEnumerable<TKey> keys)
        {
            var exp = HzyRepositoryExtensions.CreateContainsExpression<T, TKey>(_keyPropertyInfo.Name, keys);
            return this.Find(exp);
        }

        public virtual Task<T> FindAsync(Expression<Func<T, bool>> expWhere)
            => this.Query().Where(expWhere).FirstOrDefaultAsync();

        public virtual async Task<T> FindByIdAsync<TKey>(TKey key)
            => await this._dbSet.FindAsync(key);

        public virtual Task<T> FindByIdsAsync<TKey>(IEnumerable<TKey> keys)
        {
            var exp = HzyRepositoryExtensions.CreateContainsExpression<T, TKey>(_keyPropertyInfo.Name, keys);
            return this.FindAsync(exp);
        }

        #endregion

        #region 查询 多条

        public virtual List<T> ToList(Expression<Func<T, bool>> expWhere)
            => this.Query().Where(expWhere).ToList();

        public virtual List<T> ToListAll()
            => this.Query().ToList();

        public virtual Task<List<T>> ToListAsync(Expression<Func<T, bool>> expWhere)
            => this.Query().Where(expWhere).ToListAsync();

        public virtual Task<List<T>> ToListAllAsync()
            => this.Query().ToListAsync();

        #endregion

        #region 是否存在 、 数量

        public virtual int Count()
            => this.Query().Count();

        public virtual long CountLong()
            => this.Query().LongCount();

        public virtual int Count(Expression<Func<T, bool>> expWhere)
            => this.Query().Count(expWhere);

        public virtual long CountLong(Expression<Func<T, bool>> expWhere)
            => this.Query().LongCount(expWhere);

        public virtual bool Any(Expression<Func<T, bool>> expWhere)
            => this.Query().Any(expWhere);

        public virtual Task<int> CountAsync()
            => this.Query().CountAsync();

        public virtual Task<long> CountLongAsync()
            => this.Query().LongCountAsync();

        public virtual Task<int> CountAsync(Expression<Func<T, bool>> expWhere)
            => this.Query().CountAsync(expWhere);

        public virtual Task<long> CountLongAsync(Expression<Func<T, bool>> expWhere)
            => this.Query().LongCountAsync(expWhere);

        public virtual Task<bool> AnyAsync(Expression<Func<T, bool>> expWhere)
            => this.Query().AnyAsync(expWhere);

        #endregion















    }
}