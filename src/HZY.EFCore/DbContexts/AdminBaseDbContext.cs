using System;
using System.Linq;
using System.Linq.Expressions;
using HZY.EFCore.CacheEntity;
using HZY.Infrastructure;
using HZY.Infrastructure.Token;
using HZY.Models.Entities;
using HZY.Models.Entities.ApprovalFlow;
using HZY.Models.Entities.BaseEntitys;
using HZY.Models.Entities.Framework;
using HZY.Models.Entities.LowCode;
using HzyEFCoreRepositories.DbContexts;
using HzyEFCoreRepositories.ExpressionTree;
using HzyEFCoreRepositories.Extensions;
using HzyScanDiService.Extensions;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.Extensions.DependencyInjection;

namespace HZY.EFCore.DbContexts;

/// <summary>
/// 后台权限管理系统 DbContext
/// </summary>
public class AdminBaseDbContext : BaseDbContext<AdminBaseDbContext>
{
    public AdminBaseDbContext(DbContextOptions<AdminBaseDbContext> options) : base(options)
    {
        this.SavingChanges += (sender, args) => this.SavingChangesEvent(sender, args);
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
    public DbSet<SysOrganization> SysOrganization { get; set; }
    public DbSet<SysPost> SysPost { get; set; }
    public DbSet<SysUserPost> SysUserPost { get; set; }
    public DbSet<SysDictionary> SysDictionary { get; set; }
    public DbSet<SysOperationLog> SysOperationLog { get; set; }
    public DbSet<SysDataAuthority> SysDataAuthority { get; set; }
    public DbSet<SysDataAuthorityCustom> SysDataAuthorityCustom { get; set; }
    #endregion

    #region 审批流
    public DbSet<Flow> Flows { get; set; }
    public DbSet<FlowNode> FlowNodes { get; set; }
    public DbSet<FlowApproval> FlowApprovals { get; set; }
    public DbSet<FlowApprovalStep> FlowApprovalSteps { get; set; }
    public DbSet<FlowApprovalStepUser> FlowApprovalStepUsers { get; set; }
    #endregion

    #region 低代码
    public DbSet<Low_Code_List> Low_Code_List { get; set; }
    public DbSet<Low_Code_Search> Low_Code_Search { get; set; }
    public DbSet<Low_Code_Table> Low_Code_Table { get; set; }
    public DbSet<Low_Code_Table_Info> Low_Code_Table_Info { get; set; }
    #endregion

    #region 业务

    public DbSet<Member> Member { get; set; }

    #endregion

    #endregion

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        try
        {
            //缓存实体信息
            using var scope = ServiceProviderExtensions.CreateScope();
            var _cacheEntity = scope.ServiceProvider.GetService<ICacheEntity>();
            //扫描表 并 缓存 属性 xml 信息
            _cacheEntity.Set(modelBuilder.Model.GetEntityTypes().Select(item => item.ClrType));
        }
        catch (Exception)
        {

        }

        #region 过滤软删除

        foreach (var entityType in modelBuilder.Model
            .GetEntityTypes()
            .Where(w => typeof(IDeleteBaseEntity).IsAssignableFrom(w.ClrType)))
        {
            var lambda = ExpressionTreeExtensions.Equal(entityType.ClrType, nameof(IDeleteBaseEntity.IsDeleted), false);
            modelBuilder.Entity(entityType.ClrType).HasQueryFilter(lambda);
        }

        #endregion
    }

    /// <summary>
    /// 在调用SaveChanges结束时激发的事件 
    /// </summary>
    protected void SavingChangesEvent(object sender, SavingChangesEventArgs e)
    {
        using var scope = ServiceProviderExtensions.CreateScope();
        var _tokenService = scope.ServiceProvider.GetService<TokenService>();
        var userId = _tokenService.GetAccountIdByToken();

        var entries = ChangeTracker.Entries();
        var entityEntries = entries as EntityEntry[] ?? entries.ToArray();

        #region 处理 DefaultBaseEntity

        //Update
        var updateEntries_BaseModel = entityEntries
            .Where(w => w.Entity is DefaultBaseEntity && w.State == EntityState.Modified) // || w.State == EntityState.Unchanged
            .Select(item => (DefaultBaseEntity)item.Entity)
            .ToList();
        updateEntries_BaseModel.ForEach(w => w.LastModificationTime = DateTime.Now);

        //Insert
        var insertEntries_BaseModel = entityEntries
            .Where(w => w.Entity is DefaultBaseEntity && w.State == EntityState.Added)
            .Select(item => (DefaultBaseEntity)item.Entity)
            .ToList();
        foreach (var entity in insertEntries_BaseModel)
        {
            entity.CreationTime = DateTime.Now;
            entity.LastModificationTime = DateTime.Now;
        }

        #endregion

        #region 处理 BaseEntity

        //Insert
        var insertEntries = entityEntries
            .Where(w => w.Entity is ICreateBaseEntity && w.State == EntityState.Added)
            .Select(item => (ICreateBaseEntity)item.Entity)
            .ToList();
        foreach (var item in insertEntries)
        {
            item.CreationTime = DateTime.Now;
            item.CreatorUserId = userId;
        }

        //Update
        var updateEntries = entityEntries
            .Where(w => w.Entity is IUpdateBaseEntity && w.State == EntityState.Modified) // || w.State == EntityState.Unchanged
            .Select(item => (IUpdateBaseEntity)item.Entity)
            .ToList();
        foreach (var item in updateEntries)
        {
            item.LastModificationTime = DateTime.Now;
            item.LastModifierUserId = userId;
        }

        //Delete
        var deleteEntries = entityEntries
            .Where(w => w.Entity is IDeleteBaseEntity && w.State == EntityState.Deleted);
        foreach (var item in deleteEntries)
        {
            item.State = EntityState.Modified;
            var entity = (IDeleteBaseEntity)item.Entity;
            entity.IsDeleted = true;
            entity.DeletionTime = DateTime.Now;
            entity.DeleterUserId = userId;
        }

        #endregion


    }


}