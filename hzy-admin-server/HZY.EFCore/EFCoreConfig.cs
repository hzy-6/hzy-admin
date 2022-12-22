using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using HZY.EFCore.DbContexts;
using HZY.Infrastructure;
using HzyEFCoreRepositories;
using Microsoft.Extensions.Hosting;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore.Infrastructure;
using HZY.Infrastructure.SerilogUtil;
using HZY.EFCore.Interceptors;

namespace HZY.EFCore;

/// <summary>
/// 仓储模块
/// </summary>
public static class EFCoreConfig
{

    /// <summary>
    /// 使用 DbContext
    /// </summary>
    /// <param name="app"></param>
    public static void UseEfCore(this IApplicationBuilder app)
    {
        app.UseHzyEFCoreRepository(typeof(AdminDbContext));

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
    /// <param name="services"></param>
    /// <param name="appConfiguration"></param>
    /// <param name="hostBuilder"></param>
    public static void AddEfCore(this IServiceCollection services, AppConfiguration appConfiguration, WebApplicationBuilder hostBuilder)
    {
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
        InitAdminDbContext(appConfiguration, options, hostBuilder);
        var serviceProvider = services.BuildServiceProvider();
        options.UseApplicationServiceProvider(serviceProvider);
        //options.UseInternalServiceProvider(serviceProvider);
        //采用连接池
        services.AddScoped(serviceProvider => new PooledDbContextFactory<AdminDbContext>(options.Options).CreateDbContext());
        //采用非连接池方式
        //services.AddScoped(serviceProvider => new AdminDbContext(dbContextOptionsBuilder.Options));

        #endregion
    }

    /// <summary>
    /// 初始化 AdminDbContext
    /// </summary>
    /// <param name="appConfiguration"></param>
    /// <param name="options"></param>
    /// <param name="hostBuilder"></param>
    private static void InitAdminDbContext(AppConfiguration appConfiguration, DbContextOptionsBuilder options, WebApplicationBuilder hostBuilder)
    {
        switch (appConfiguration.ConnectionStrings.DefaultDatabaseType)
        {
            case DefaultDatabaseType.SqlServer:
                options
               .UseSqlServer(appConfiguration.ConnectionStrings.DefaultSqlServer, w => w.MinBatchSize(1).MaxBatchSize(1000))
               ;
                break;
            case DefaultDatabaseType.MySql:
                options
               .UseMySql(appConfiguration.ConnectionStrings.DefaultMySql, MySqlServerVersion.LatestSupportedServerVersion, w => w.MinBatchSize(1).MaxBatchSize(1000))
               ;
                break;
            case DefaultDatabaseType.PostgreSql:
                //EnableLegacyTimestampBehavior 启动旧行为，避免时区问题，存储时间报错
                AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);
                options
                .UseNpgsql(appConfiguration.ConnectionStrings.DefaultPostgreSql, w => w.MinBatchSize(1).MaxBatchSize(1000))
                ;
                break;
            case DefaultDatabaseType.Oracle:
                options
                .UseOracle(appConfiguration.ConnectionStrings.DefaultOracle, w => w.MinBatchSize(1).MaxBatchSize(1000))
                ;
                break;
            default:
                break;
        }

        UseEfCoreLoggerFactory(options, hostBuilder.Environment);
        // 懒加载代理
        //options.UseLazyLoadingProxies();
        //添加 EFCore 监控 和 动态表名
        options.AddHzyEFCoreRepository(appConfiguration.Configs.IsMonitorEFCore);
        options.AddInterceptors(new AuditInterceptor());
    }

    /// <summary>
    /// efcore 使用控制台日志
    /// </summary>
    /// <param name="options"></param>
    /// <param name="webHostEnvironment"></param>
    private static void UseEfCoreLoggerFactory(DbContextOptionsBuilder options, IWebHostEnvironment webHostEnvironment)
    {
        if (webHostEnvironment.IsDevelopment())
        {
            var loggerFactory = LoggerFactory.Create(builder => builder.AddConsole());
            // sql 日志写入控制台
            options.UseLoggerFactory(loggerFactory);
        }
    }





}
