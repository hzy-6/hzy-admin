namespace HZY.Repository.EntityFramework.Admin;

/// <summary>
/// 后台管理系统数据库上下文
/// </summary>
[DbContextConfig]
public class AdminDbContext : DbContext
{
    /// <summary>
    /// 后台管理系统数据库上下文
    /// </summary>
    /// <param name="options"></param>
    public AdminDbContext(DbContextOptions<AdminDbContext> options) : base(options)
    {

    }

    /// <summary>
    /// 模型创建
    /// </summary>
    /// <param name="modelBuilder"></param>
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        var dbContextConfigAttribute = GetType().GetCustomAttribute<DbContextConfigAttribute>();

        var _namespace = GetType().Namespace;

        dbContextConfigAttribute.OnModelCreating(modelBuilder, GetType(), w => w.FullName.Contains($"{_namespace}.Entities."));

        #region 自动迁移种子数据

        ModelBuilderExtensions.Seed(modelBuilder);

        #endregion
    }

}
