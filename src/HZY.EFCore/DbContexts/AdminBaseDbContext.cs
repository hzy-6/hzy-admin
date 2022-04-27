using System;
using System.Linq;
using System.Linq.Expressions;
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
        //#region 自动添加 实体到 dbset 条件是：实体必须继承自 IBaseEntity<>

        //var assmblys = DiServiceScanningExtensions.GetAssemblyList(w => !w.IsDynamic);

        //foreach (var item in assmblys)
        //{
        //    foreach (var type in item.ExportedTypes)
        //    {
        //        if (type.GetInterfaces().Any(w => w.Name != typeof(IBaseEntity<>).Name)) continue;

        //        modelBuilder.Entity(type);
        //    }
        //}

        //#endregion

        #region 过滤软删除 条件是：实体必须继承自 IDeleteBaseEntity

        var deleteBaseEntitys = modelBuilder.Model
            .GetEntityTypes()
            .Where(w => typeof(IDeleteBaseEntity).IsAssignableFrom(w.ClrType))
            ;
        foreach (var item in deleteBaseEntitys)
        {
            var lambda = ExpressionTreeExtensions.Equal(item.ClrType, nameof(IDeleteBaseEntity.IsDeleted), false);
            modelBuilder.Entity(item.ClrType).HasQueryFilter(lambda);
        }

        #endregion
    }



}