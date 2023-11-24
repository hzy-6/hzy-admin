namespace HZY.Repository.Admin;

/// <summary>
/// 后台管理系统数据库上下文
/// </summary>
[DbContextConfig($"Repository.*.Entities.*")]
public class AdminDbContext : DbContext, IBaseDbContext
{
    /// <summary>
    /// 工作单元
    /// </summary>
    public IUnitOfWork UnitOfWork { get; }

    public AdminDbContext(DbContextOptions dbContextOptions) : base(dbContextOptions)
    {
        UnitOfWork = new UnitOfWorkImpl<AdminDbContext>(this);
    }

    /// <summary>
    /// 模型创建
    /// </summary>
    /// <param name="modelBuilder"></param>
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        var dbContextConfigAttribute = GetType().GetCustomAttribute<DbContextConfigAttribute>()!;
        dbContextConfigAttribute!.OnModelCreating(modelBuilder, dbContextConfigAttribute.GetModelTypes(GetType()));

        #region 自动迁移种子数据

        //ModelBuilderExtensions.Seed(modelBuilder);

        #endregion
    }


}
