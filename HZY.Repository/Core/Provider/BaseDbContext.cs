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
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using HZY.Repository.Entity;
using HZY.Repository.Entity.Core;
using HZY.Repository.Entity.Framework;
using HZY.Repository.Core.Interface;
using HZY.Repository.Core.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore.Storage;

namespace HZY.Repository.Core.Provider
{
    public class BaseDbContext<TDbContext> : DbContext where TDbContext : DbContext
    {
        private readonly IUnitOfWork _unitOfWork;

        public BaseDbContext(DbContextOptions<TDbContext> options, IUnitOfWork unitOfWork) : base(options)
        {
            _unitOfWork = unitOfWork;
            this.SavingChanges += (sender, args) => this.SavingChangesEvent();
        }

        #region DbSet

        public DbSet<SysFunction> SysFunction { get; set; }
        public DbSet<SysMenu> SysMenu { get; set; }
        public DbSet<SysMenuFunction> SysMenuFunction { get; set; }
        public DbSet<SysRole> SysRole { get; set; }
        public DbSet<SysRoleMenuFunction> SysRoleMenuFunction { get; set; }
        public DbSet<SysUser> SysUser { get; set; }
        public DbSet<SysUserRole> SysUserRole { get; set; }

        #endregion

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //扫描表 并 缓存 属性 xml 信息
            EntityCache.Set(modelBuilder.Model.GetEntityTypes().Select(item => item.ClrType).ToList());
        }

        /// <summary>
        /// 在调用SaveChanges结束时激发的事件 
        /// </summary>
        private void SavingChangesEvent()
        {
            #region 处理 createTime updateTime

            var entries = ChangeTracker.Entries();
            var entityEntries = entries as EntityEntry[] ?? entries.ToArray();

            //Update
            var updateEntries = entityEntries
                .Where(w => w.Entity is BaseModel && w.State == EntityState.Modified)
                .Select(item => (BaseModel)item.Entity)
                .ToList();
            updateEntries.ForEach(w => w.UpdateTime = DateTime.Now);

            //Insert
            var insertEntries = entityEntries
                .Where(w => w.Entity is BaseModel && w.State == EntityState.Added)
                .Select(item => (BaseModel)item.Entity)
                .ToList();
            foreach (var entity in insertEntries)
            {
                entity.CreateTime = DateTime.Now;
                entity.UpdateTime = DateTime.Now;
            }

            #endregion
        }

        /// <summary>
        /// 事务
        /// </summary>
        /// <returns></returns>
        public virtual IDbContextTransaction BeginTransaction() => this.Database.BeginTransaction();

        /// <summary>
        /// 事务
        /// </summary>
        /// <returns></returns>
        public virtual Task<IDbContextTransaction> BeginTransactionAsync() => this.Database.BeginTransactionAsync();

        #region IUnitOfWork

        /// <summary>
        /// 工作单元
        /// </summary>
        /// <returns></returns>
        public virtual IUnitOfWork GetUnitOfWork() => this._unitOfWork;

        /// <summary>
        /// 开启 提交
        /// </summary>
        public virtual void CommitOpen() => this._unitOfWork.CommitOpen();

        /// <summary>
        /// 提交
        /// </summary>
        /// <returns></returns>
        public virtual int Commit()
        {
            this._unitOfWork.SetSaveState(true);
            return this.SaveChanges();
        }

        /// <summary>
        /// 提交
        /// </summary>
        /// <returns></returns>
        public virtual Task<int> CommitAsync()
        {
            this._unitOfWork.SetSaveState(true);
            return this.SaveChangesAsync();
        }

        #endregion

        #region 重写 保存

        public override int SaveChanges()
        {
            return this._unitOfWork.GetSaveState() ? base.SaveChanges() : 1;
        }

        public override int SaveChanges(bool acceptAllChangesOnSuccess)
        {
            return this._unitOfWork.GetSaveState() ? base.SaveChanges(acceptAllChangesOnSuccess) : 1;
        }

        public override Task<int> SaveChangesAsync(bool acceptAllChangesOnSuccess,
            CancellationToken cancellationToken = new CancellationToken())
        {
            return this._unitOfWork.GetSaveState()
                ? base.SaveChangesAsync(acceptAllChangesOnSuccess, cancellationToken)
                : Task.FromResult(1);
        }

        public override Task<int> SaveChangesAsync(CancellationToken cancellationToken = new CancellationToken())
        {
            return this._unitOfWork.GetSaveState() ? base.SaveChangesAsync(cancellationToken) : Task.FromResult(1);
        }

        #endregion
    }
}