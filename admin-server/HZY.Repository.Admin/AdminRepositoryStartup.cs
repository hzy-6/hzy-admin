namespace HZY.Repository.Admin;

/// <summary>
/// 程序启动器
/// </summary>
[ImportStartup(typeof(CoreEntityFrameworkStartup))]
public class AdminRepositoryStartup : StartupModule<AdminRepositoryStartup>
{
    /// <summary>
    /// 程序启动器
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        var configuration = webApplicationBuilder.Configuration;
        var services = webApplicationBuilder.Services;
        var webHostEnvironment = webApplicationBuilder.Environment;

        var adminRepositoriesOptions = configuration
            .GetSection(nameof(AdminRepositoryOptions))
            .Get<AdminRepositoryOptions>();

        var connectionString = configuration["ConnectionStrings:" + adminRepositoriesOptions!.DefaultDatabaseType.ToString()];

        services.AddDbContextFactory<AdminDbContext>(optionsBuilder =>
        {
            switch (adminRepositoriesOptions.DefaultDatabaseType)
            {
                case DefaultDatabaseType.SqlServer:
                    optionsBuilder
                   .UseSqlServer(connectionString, w => w.MinBatchSize(1).MaxBatchSize(1000))
                   ;
                    break;
                case DefaultDatabaseType.MySql:
                    optionsBuilder
                   .UseMySql(connectionString, MySqlServerVersion.LatestSupportedServerVersion, w => w.MinBatchSize(1).MaxBatchSize(1000))
                   ;
                    break;
                case DefaultDatabaseType.PostgreSql:
                    //EnableLegacyTimestampBehavior 启动旧行为，避免时区问题，存储时间报错
                    AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);
                    optionsBuilder
                    .UseNpgsql(connectionString, w => w.MinBatchSize(1).MaxBatchSize(1000))
                    ;
                    break;
                case DefaultDatabaseType.Oracle:
                    optionsBuilder
                    .UseOracle(connectionString, w => w.MinBatchSize(1).MaxBatchSize(1000))
                    ;
                    break;
                default:
                    break;
            }

            if (webHostEnvironment.IsDevelopment())
            {
                var loggerFactory = LoggerFactory.Create(builder => builder.AddConsole());
                // sql 日志写入控制台
                optionsBuilder.UseLoggerFactory(loggerFactory);
            }

            // 懒加载代理
            //options.UseLazyLoadingProxies();
            //添加 EFCore 监控 和 动态表名
            optionsBuilder.AddEntityFrameworkMonitor(adminRepositoriesOptions.IsMonitorEFCore);
            optionsBuilder.AddInterceptors(new AuditInterceptor());
            optionsBuilder.AddInterceptors(new AuditInterceptorV2());
        });

        services.AddEntityFrameworkRepositories(typeof(AdminDbContext));
    }

    /// <summary>
    /// Configure
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {
        // 使用 DbContext
        #region 开发环境检测是否需要数据库迁移

        //if (webApplication.Environment.IsDevelopment())
        //{
        //    // 自动迁移 （如果迁移文件有变动）
        //    using var scope = webApplication.Services.CreateScope();
        //    using var adminDbContext = scope.ServiceProvider.GetService<AdminDbContext>();
        //    if (adminDbContext!.Database.GetPendingMigrations().Count() > 0)
        //    {
        //        try
        //        {
        //            adminDbContext.Database.Migrate();
        //        }
        //        catch (Exception ex)
        //        {
        //            LogUtil.Log.Error(ex.Message, ex);
        //        }
        //    }
        //}

        #endregion

    }


}
