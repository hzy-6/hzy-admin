namespace HZY.Repository.EntityFramework.Admin.Configs;

/// <summary>
/// 仓储模块
/// </summary>
public static class CoreRepositoriesAdminConfig
{
    /// <summary>
    /// 使用 DbContext
    /// </summary>
    /// <param name="app"></param>
    public static void UseEFByAdmin(this IApplicationBuilder app)
    {
        #region 开发环境检测是否需要数据库迁移
        using var scope = app.ApplicationServices.CreateScope();
        var webHostEnvironment = scope.ServiceProvider.GetService<IWebHostEnvironment>();
        if (webHostEnvironment.IsDevelopment())
        {
            // 自动迁移 （如果迁移文件有变动）
            var adminDbContext = scope.ServiceProvider.GetService<AdminDbContext>();
            if (adminDbContext.Database.GetPendingMigrations().Count() > 0)
            {
                try
                {
                    adminDbContext.Database.Migrate();
                }
                catch (Exception ex)
                {
                    LogUtil.Log.Error(ex.Message, ex);
                }
            }
        }
        #endregion
    }

    /// <summary>
    /// 注册 Admin 后台管理数据库
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    /// <param name="adminRepositoriesOptions"></param>
    public static void AddEFByAdmin(this WebApplicationBuilder webApplicationBuilder, AdminRepositoriesOptions adminRepositoriesOptions)
    {
        var services = webApplicationBuilder.Services;

        //#region 开发环境使用 AddDbContextPool

        //if (hostBuilder.Environment.IsDevelopment())
        //{
        //    //此方式容易造成内存泄露
        //    services.AddDbContextPool<AdminDbContext>(options => InitAdminDbContext(appConfiguration, options, hostBuilder), 2048);
        //    return;
        //}

        //#endregion

        #region AdminDbContext 注册配置 用于生成环境 没有内存泄露风险

        var options = new DbContextOptionsBuilder<AdminDbContext>();

        #endregion

        var connectionString = webApplicationBuilder.Configuration["ConnectionStrings:" + adminRepositoriesOptions.DefaultDatabaseType.ToString()];

        switch (adminRepositoriesOptions.DefaultDatabaseType)
        {
            case DefaultDatabaseType.SqlServer:
                options
               .UseSqlServer(connectionString, w => w.MinBatchSize(1).MaxBatchSize(1000))
               ;
                break;
            case DefaultDatabaseType.MySql:
                options
               .UseMySql(connectionString, MySqlServerVersion.LatestSupportedServerVersion, w => w.MinBatchSize(1).MaxBatchSize(1000))
               ;
                break;
            case DefaultDatabaseType.PostgreSql:
                //EnableLegacyTimestampBehavior 启动旧行为，避免时区问题，存储时间报错
                AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);
                options
                .UseNpgsql(connectionString, w => w.MinBatchSize(1).MaxBatchSize(1000))
                ;
                break;
            case DefaultDatabaseType.Oracle:
                options
                .UseOracle(connectionString, w => w.MinBatchSize(1).MaxBatchSize(1000))
                ;
                break;
            default:
                break;
        }

        if (webApplicationBuilder.Environment.IsDevelopment())
        {
            var loggerFactory = LoggerFactory.Create(builder => builder.AddConsole());
            // sql 日志写入控制台
            options.UseLoggerFactory(loggerFactory);
        }

        // 懒加载代理
        //options.UseLazyLoadingProxies();
        //添加 EFCore 监控 和 动态表名
        options.AddEntityFrameworkRepositories(adminRepositoriesOptions.IsMonitorEFCore);
        options.AddInterceptors(new AuditInterceptor());
        //
        var serviceProvider = services.BuildServiceProvider();
        options.UseApplicationServiceProvider(serviceProvider);
        //options.UseInternalServiceProvider(serviceProvider);
        //采用连接池
        services.AddScoped(serviceProvider => new PooledDbContextFactory<AdminDbContext>(options.Options).CreateDbContext());
        //采用非连接池方式
        //services.AddScoped(serviceProvider => new AdminDbContext(dbContextOptionsBuilder.Options));
    }




}
