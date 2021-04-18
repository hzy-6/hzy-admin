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
using HZY.Repository.Domain.Framework;
using HZY.Repository.Core.Interface;
using HZY.Repository.Core.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.EntityFrameworkCore.Storage;
using HZY.Repository.Core.Impl;

namespace HZY.Repository.Core.Provider
{
    public class BaseDbContext<TDbContext> : DbContext where TDbContext : DbContext
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly ICacheEntity _cacheEntity;

        public BaseDbContext(DbContextOptions<TDbContext> options, ICacheEntity cacheEntity) : base(options)
        {
            _unitOfWork = new UnitOfWorkImpl();
            this.SavingChanges += (sender, args) => this.SavingChangesEvent(sender, args);
            _cacheEntity = cacheEntity;
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

        /// <summary>
        /// 获取实体信息缓存服务
        /// </summary>
        public virtual ICacheEntity CacheEntity => this._cacheEntity;

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //扫描表 并 缓存 属性 xml 信息
            _cacheEntity.Set(modelBuilder.Model.GetEntityTypes().Select(item => item.ClrType));
        }

        //protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        //{
        //    optionsBuilder
        //        .EnableSensitiveDataLogging()
        //        .ConfigureWarnings(b => b.Ignore(CoreEventId.DetachedLazyLoadingWarning))
        //        .LogTo(message => LogUtil.WriteDebug(message), LogLevel.Information, DbContextLoggerOptions.UtcTime | DbContextLoggerOptions.SingleLine)
        //        ;
        //    base.OnConfiguring(optionsBuilder);
        //}

        /// <summary>
        /// 在调用SaveChanges结束时激发的事件 
        /// </summary>
        protected void SavingChangesEvent(object sender, SavingChangesEventArgs e)
        {
            #region 处理 createTime updateTime

            var entries = ChangeTracker.Entries();
            var entityEntries = entries as EntityEntry[] ?? entries.ToArray();

            //Update
            var updateEntries = entityEntries
                .Where(w => w.Entity is BaseModel && w.State == EntityState.Modified || w.State == EntityState.Unchanged)
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
        public virtual IUnitOfWork UnitOfWork => this._unitOfWork;

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