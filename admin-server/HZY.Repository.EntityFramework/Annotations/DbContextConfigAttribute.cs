namespace HZY.Repository.EntityFramework.Annotations;

/// <summary>
/// DbContext 配置注解
/// </summary>
[AttributeUsage(AttributeTargets.Class, AllowMultiple = true, Inherited = true)]
public class DbContextConfigAttribute : Attribute
{
    /// <summary>
    /// 命名规则默认 蛇形 命名 SysFunction => sys_function
    /// </summary>
    public NameRuleType NameRuleType { get; set; } = NameRuleType.SnakeCase;

    /// <summary>
    /// DbContext 配置注解
    /// </summary>
    public DbContextConfigAttribute()
    {

    }

    /// <summary>
    /// DbContext 配置注解
    /// </summary>
    /// <param name="nameRuleType">表命名规则</param>
    public DbContextConfigAttribute(NameRuleType nameRuleType)
    {
        NameRuleType = nameRuleType;
    }

    /// <summary>
    /// 模型创建
    /// </summary>
    /// <param name="modelBuilder"></param>
    /// <param name="dbContextType"></param>
    /// <param name="predicate">过滤实体类型</param>
    public void OnModelCreating(ModelBuilder modelBuilder, Type dbContextType, Func<Type, bool> predicate)
    {
        #region 自动扫描 dbset

        var assembly = dbContextType.Assembly;
        var types = (from w in assembly.ExportedTypes.ToList()
                     where w.IsClass && w.IsPublic && !w.IsGenericType
                     where w.GetInterface(nameof(IEntity)) != null
                     where !w.Name.StartsWith(nameof(DefaultEntity)) && !w.Name.Contains(nameof(FullEntity))
                     select w)
                    .Where(predicate)
                    .ToList()
                    ;

        foreach (var type in types)
        {
            if (modelBuilder.Model.FindEntityType(type) != null)
            {
                continue;
            }

            modelBuilder.Model.AddEntityType(type);
        }

        #endregion

        #region 过滤软删除 条件是：实体必须继承自 IDeleteBaseEntity

        var deleteBaseEntitys = modelBuilder.Model
            .GetEntityTypes()
            .Where(w => typeof(IDeleteEntity).IsAssignableFrom(w.ClrType))
            ;
        foreach (var item in deleteBaseEntitys)
        {
            var lambda = ExpressionTreeExtensions.Equal(item.ClrType, nameof(IDeleteEntity.IsDeleted), false);
            modelBuilder.Entity(item.ClrType).HasQueryFilter(lambda);
        }

        #endregion

        #region 自动映射表名

        // 默认是实体的名称 如: DbSet<Flow> Flows 表名就是 Flows 否则会根据 实体名称
        // 生成名称与所想不一致请查看实体名称  实体名称请使用驼峰命名法
        switch (NameRuleType)
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
