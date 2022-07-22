using HZY.EFCore.Migrations.Seeds;
using HZY.Infrastructure;
using HZY.Models.Entities;
using HZY.Models.Entities.ApprovalFlow;
using HZY.Models.Entities.BaseEntitys;
using HZY.Models.Entities.Framework;
using HZY.Models.Entities.LowCode;
using HzyEFCoreRepositories.DbContexts;
using HzyEFCoreRepositories.Extensions;
using Microsoft.EntityFrameworkCore;

namespace HZY.EFCore.DbContexts;

/// <summary>
/// 后台权限管理系统 DbContext
/// </summary>
public class AdminDbContext : DbContextBase
{
    public AdminDbContext(DbContextOptions<AdminDbContext> options) : base(options)
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
    public DbSet<Flow> Flow { get; set; }
    public DbSet<FlowNode> FlowNode { get; set; }
    public DbSet<FlowApproval> FlowApproval { get; set; }
    public DbSet<FlowApprovalStepHistory> FlowApprovalStep { get; set; }
    public DbSet<FlowApprovalStepHistoryUser> FlowApprovalStepUser { get; set; }
    #endregion

    #region 低代码
    public DbSet<LowCodeList> LowCodeList { get; set; }
    public DbSet<LowCodeSearch> LowCodeSearch { get; set; }
    public DbSet<LowCodeTable> LowCodeTable { get; set; }
    public DbSet<LowCodeTableInfo> LowCodeTableInfo { get; set; }
    #endregion

    #region 业务

    public DbSet<Member> Member { get; set; }

    #endregion

    #endregion

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        // 自动迁移种子数据
        ModelBuilderExtensions.Seed(modelBuilder);

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

        #region 自动映射表名
        // 默认是实体的名称 如: DbSet<Flow> Flows 表名就是 Flows
        // 生成名称与所想不一致请查看实体名称  实体名称请使用驼峰命名法
        var nameRule = NameRuleType.SnakeCase;

        if (nameRule == NameRuleType.SnakeCase)
        {
            // 蛇形命名法
            // ToUnderlineNomenclature()  将驼峰命名法改为蛇形命名法  类似: SysFunction => sys_function
            modelBuilder.TableNameMapping(oldTableName => oldTableName.ToUnderlineNomenclature());
        }
        else if(nameRule == NameRuleType.UpperSnakeCase)
        {
            // 全大写蛇形命名法
            //  SysFunction => SYS_FUNCTION
            modelBuilder.TableNameMapping(oldTableName => oldTableName.ToUnderlineNomenclature().ToUpper());
        }
        else if (nameRule == NameRuleType.Upper)
        {
            // 表名全大写
            modelBuilder.TableNameMapping(oldTableName => oldTableName.ToUpper());
        }
        else if (nameRule == NameRuleType.Lower)
        {
            // 表名全小写
            modelBuilder.TableNameMapping(oldTableName => oldTableName.ToLower());
        }

        #endregion

        // #region 后台系统 基础

        // modelBuilder.Entity<SysFunction>().ToTable("sys_function");
        // modelBuilder.Entity<SysMenu>().ToTable("sys_menu");
        // modelBuilder.Entity<SysMenuFunction>().ToTable("sys_menu_function");
        // modelBuilder.Entity<SysRole>().ToTable("sys_role");
        // modelBuilder.Entity<SysRoleMenuFunction>().ToTable("sys_role_menu_function");
        // modelBuilder.Entity<SysUser>().ToTable("sys_user");
        // modelBuilder.Entity<SysUserRole>().ToTable("sys_user_role");
        // modelBuilder.Entity<SysOrganization>().ToTable("sys_organization");
        // modelBuilder.Entity<SysPost>().ToTable("sys_post");
        // modelBuilder.Entity<SysUserPost>().ToTable("sys_user_post");
        // modelBuilder.Entity<SysDictionary>().ToTable("sys_dictionary");
        // modelBuilder.Entity<SysOperationLog>().ToTable("sys_operation_log");
        // modelBuilder.Entity<SysDataAuthority>().ToTable("sys_data_authority");
        // modelBuilder.Entity<SysDataAuthorityCustom>().ToTable("sys_data_authority_custom");

        // #endregion

        // #region 审批流

        // modelBuilder.Entity<Flow>().ToTable("flow");
        // modelBuilder.Entity<FlowNode>().ToTable("flow_node");
        // modelBuilder.Entity<FlowApproval>().ToTable("flow_approval");
        // modelBuilder.Entity<FlowApprovalStep>().ToTable("flow_approval_step");
        // modelBuilder.Entity<FlowApprovalStepUser>().ToTable("flow_approval_step_user");

        // #endregion

        // #region 低代码

        // modelBuilder.Entity<LowCodeList>().ToTable("low_code_list");
        // modelBuilder.Entity<LowCodeSearch>().ToTable("low_code_search");
        // modelBuilder.Entity<LowCodeTable>().ToTable("low_code_table");
        // modelBuilder.Entity<LowCodeTableInfo>().ToTable("low_code_table_info");

        // #endregion

        // #region 业务

        // modelBuilder.Entity<Member>().ToTable("member");

        // #endregion

    }



}