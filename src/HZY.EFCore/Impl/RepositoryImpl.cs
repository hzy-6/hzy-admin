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
using HZY.EFCore.Extensions;
using HZY.EFCore.Interface;
using HZY.Infrastructure.ExpressionTree;
using Microsoft.EntityFrameworkCore;

namespace HZY.EFCore.Impl;

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
    private Expression<Func<T, bool>> _filter;
    private bool isIgnoreQueryFilter;

    public RepositoryImpl(TDbContext context, Expression<Func<T, bool>> filter = null)
    {
        this._context = context;
        _dbSet = context.Set<T>();
        _keyPropertyInfo = typeof(T).GetKeyProperty(false);
        _filter = filter;
        isIgnoreQueryFilter = false;
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

    /// <summary>
    /// 生成表达式树 例如：( w=>w.Key==Guid.Empty )
    /// </summary>
    /// <param name="value"></param>
    /// <returns></returns>
    public virtual Expression<Func<T, bool>> GetKeyExpression(object value)
        => ExpressionTreeExtensions.Equal<T, object>(this._keyPropertyInfo.Name, value);

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
        if (_keyPropertyInfo == null) throw new Exception("模型未设置主键特性标记!");
        var value = this._keyPropertyInfo.GetValue(model);
        var oldModel = this.FindById(value);
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
        if (_keyPropertyInfo == null) throw new Exception("模型未设置主键特性标记!");
        var value = this._keyPropertyInfo.GetValue(model);
        var oldModel = await this.Query().FirstOrDefaultAsync(this.GetKeyExpression(value));
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
        if (_keyPropertyInfo == null) throw new Exception("模型未设置主键特性标记!");
        var value = this._keyPropertyInfo.GetValue(model);
        var oldModel = this.FindById(value);
        if (oldModel == null)
            this.Insert(model);
        else
            this.Update(oldModel, model);
        return model;
    }

    public virtual async Task<T> InsertOrUpdateAsync(T model)
    {
        if (_keyPropertyInfo == null) throw new Exception("模型未设置主键特性标记!");
        var value = this._keyPropertyInfo.GetValue(model);
        var oldModel = await this.FindByIdAsync(value);
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
        => this.Delete(this.Query().Where(expWhere));

    public virtual int DeleteById<TKey>(TKey key)
    {
        return this.Delete(this.FindById(key));
    }

    public virtual int DeleteByIds<TKey>(IEnumerable<TKey> keys)
    {
        return this.Delete(this.FindByIds(keys));
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
        => this.DeleteAsync(this.Query().Where(expWhere));

    public virtual async Task<int> DeleteByIdAsync<TKey>(TKey key)
    {
        return await this.DeleteAsync(await this.FindByIdAsync(key));
    }

    public async Task<int> DeleteByIdsAsync<TKey>(IEnumerable<TKey> keys)
    {
        if (_keyPropertyInfo == null) throw new Exception("模型未设置主键特性标记!");
        var exp = ExpressionTreeExtensions.Contains<T, TKey>(_keyPropertyInfo.Name, keys);
        return await this.DeleteAsync(await this.Query().Where(exp).ToListAsync());
    }

    #endregion

    #region 查询 复杂型

    /// <summary>
    /// 添加检索过滤
    /// </summary>
    /// <param name="filter"></param>
    /// <returns></returns>
    public virtual IRepository<T, TDbContext> AddQueryFilter(Expression<Func<T, bool>> filter = null)
    {
        this._filter = filter;
        return this;
    }

    /// <summary>
    /// 忽略查询过滤条件
    /// </summary>
    /// <returns></returns>
    public virtual IRepository<T, TDbContext> IgnoreQueryFilter()
    {
        isIgnoreQueryFilter = true;
        return this;
    }

    /// <summary>
    /// 恢复忽略查询过滤条件
    /// </summary>
    /// <returns></returns>
    public virtual IRepository<T, TDbContext> RecoveryQueryFilter()
    {
        isIgnoreQueryFilter = false;
        return this;
    }

    /// <summary>
    /// 查询
    /// </summary>
    /// <param name="isTracking">是否追踪</param>
    /// <returns></returns>
    public virtual IQueryable<T> Query(bool isTracking = true)
        => isTracking ?
        this._dbSet.WhereIf(!isIgnoreQueryFilter && _filter != null, _filter).AsQueryable() :
        this._dbSet.WhereIf(!isIgnoreQueryFilter && _filter != null, _filter).AsNoTracking();

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
        => this.Query().FirstOrDefault(this.GetKeyExpression(key));

    public virtual T FindByIds<TKey>(IEnumerable<TKey> keys)
    {
        if (_keyPropertyInfo == null) throw new Exception("模型未设置主键特性标记!");
        var exp = ExpressionTreeExtensions.Contains<T, TKey>(_keyPropertyInfo.Name, keys);
        return this.Find(exp);
    }

    public virtual Task<T> FindAsync(Expression<Func<T, bool>> expWhere)
        => this.Query().Where(expWhere).FirstOrDefaultAsync();

    public virtual async Task<T> FindByIdAsync<TKey>(TKey key)
        => await this.Query().FirstOrDefaultAsync(this.GetKeyExpression(key));

    public virtual Task<T> FindByIdsAsync<TKey>(IEnumerable<TKey> keys)
    {
        if (_keyPropertyInfo == null) throw new Exception("模型未设置主键特性标记!");
        var exp = ExpressionTreeExtensions.Contains<T, TKey>(_keyPropertyInfo.Name, keys);
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