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
using HZY.Repository.Domain.Framework;
using HZY.Repository.AppCore.Interface;
using HZY.Repository.AppCore.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using HZY.Repository.Domain;

namespace HZY.Repository.AppCore.DbContexts
{
    /// <summary>
    /// 后台权限管理系统 DbContext
    /// </summary>
    public class AdminBaseDbContext : BaseDbContext<AdminBaseDbContext>
    {
        private readonly ICacheEntity _cacheEntity;

        public AdminBaseDbContext(DbContextOptions<AdminBaseDbContext> options, ICacheEntity cacheEntity) : base(options)
        {
            this.SavingChanges += (sender, args) => this.SavingChangesEvent(sender, args);
            _cacheEntity = cacheEntity;
        }

        #region DbSet

        #region 后台系统 基础
        public DbSet<SysFunction> SysFunction { get; set; }
        public DbSet<SysMenu> SysMenu { get; set; }
        public DbSet<SysMenuFunction> SysMenuFunction { get; set; }
        public DbSet<SysRole> SysRole { get; set; }
        public DbSet<SysRoleMenuFunction> SysRoleMenuFunction { get; set; }
        public DbSet<SysUser> SysUser { get; set; }
        public DbSet<SysUserRole> SysUserRole { get; set; }
        #endregion

        #region 业务

        public DbSet<Member> Member { get; set; }

        #endregion

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
                .Where(w => w.Entity is BaseModel && w.State == EntityState.Modified) // || w.State == EntityState.Unchanged
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


    }
}