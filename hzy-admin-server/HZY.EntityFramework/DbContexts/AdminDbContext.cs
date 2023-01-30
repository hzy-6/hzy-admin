using HZY.EntityFramework.Migrations.Seeds;
using HZY.Infrastructure;
using HZY.Models.Entities.BaseEntitys;
using HZY.Framework.EntityFrameworkRepositories.Extensions;
using HZY.Framework.AutoRegisterIOC;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.Extensions.DependencyInjection;
using System.ComponentModel.DataAnnotations.Schema;
using HZY.Framework.Core.Utils;
using HZY.Infrastructure.Enums;

namespace HZY.EntityFramework.DbContexts;

/// <summary>
/// 后台权限管理系统 DbContext
/// </summary>
public class AdminDbContext : DbContext
{
    public AdminDbContext(DbContextOptions<AdminDbContext> options) : base(options)
    {

    }

    /// <summary>
    /// 模型创建
    /// </summary>
    /// <param name="modelBuilder"></param>
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        var appConfiguration = this.GetService<AppConfiguration>();

        #region 自动扫描 dbset

        var assemblies = AssemblyUtil.GetAssemblyList()
            .Where(w => w.GetName().FullName.Contains(appConfiguration.Configs.DbContextInfo.DbSetScanDllName))
            ;
        foreach (var item in assemblies.Where(w => !w.IsDynamic))
        {
            var types = from w in item.ExportedTypes
                        where w.IsClass && w.IsPublic && !w.IsGenericType
                        where w.GetInterface(nameof(IBaseEntity)) != null
                        where w.Namespace.Contains(appConfiguration.Configs.DbContextInfo.DbSetScanNamespace)
                        where !w.Name.StartsWith("DefaultBaseEntity") && !w.Name.Contains("FullBaseEntity")
                        select w;

            foreach (var type in types)
            {
                modelBuilder.Model.AddEntityType(type);
            }
        }

        #endregion

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

        // 默认是实体的名称 如: DbSet<Flow> Flows 表名就是 Flows 否则会根据 实体名称
        // 生成名称与所想不一致请查看实体名称  实体名称请使用驼峰命名法
        switch (appConfiguration.Configs.DbContextInfo.NameRuleType)
        {
            case NameRuleType.Default:
                break;
            case NameRuleType.SnakeCase:
                // 蛇形命名法
                // ToUnderlineNomenclature()  将驼峰命名法改为蛇形命名法  类似: SysFunction => sys_function
                TableNameMapping(modelBuilder, oldTableName => oldTableName.ToUnderlineNomenclature());
                break;
            case NameRuleType.UpperSnakeCase:
                // 全大写蛇形命名法
                //  SysFunction => SYS_FUNCTION
                TableNameMapping(modelBuilder, oldTableName => oldTableName.ToUnderlineNomenclature().ToUpper());
                break;
            case NameRuleType.Upper:
                // 表名全大写
                TableNameMapping(modelBuilder, oldTableName => oldTableName.ToUpper());
                break;
            case NameRuleType.Lower:
                // 表名全小写
                TableNameMapping(modelBuilder, oldTableName => oldTableName.ToLower());
                break;
        }

        #endregion

        #region 自动迁移种子数据

        ModelBuilderExtensions.Seed(modelBuilder);

        #endregion
    }

    /// <summary>
    /// 数据库表名映射
    /// </summary>
    /// <param name="modelBuilder"></param>
    /// <param name="mappingName"></param>
    protected void TableNameMapping(ModelBuilder modelBuilder, Func<string, string> mappingName)
    {
        foreach (var entity in modelBuilder.Model.GetEntityTypes())
        {
            string name = string.Empty;
            var tableAttr = entity.GetType().GetCustomAttributes(typeof(TableAttribute), false).FirstOrDefault() as TableAttribute;
            if (tableAttr != null)
            {
                name = mappingName(tableAttr.Name);
                entity.SetTableName(name);
                continue;
            }
            name = mappingName(entity.GetTableName());
            entity.SetTableName(name);
        }
    }


}