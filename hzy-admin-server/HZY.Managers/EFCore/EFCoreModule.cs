using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using HZY.EFCore.DbContexts;
using HZY.Infrastructure;
using HzyEFCoreRepositories;
using Microsoft.Extensions.Hosting;
using Microsoft.AspNetCore.Builder;
using HzyScanDiService;
using Microsoft.AspNetCore.Hosting;
using HZY.Managers.EFCore.Interceptor;
using NPOI.SS.Formula.Functions;
using Microsoft.EntityFrameworkCore.Infrastructure;

namespace HZY.Managers.EFCore;

/// <summary>
/// 仓储模块
/// </summary>
public static class EFCoreModule
{

    /// <summary>
    /// 使用 DbContext
    /// </summary>
    /// <param name="app"></param>
    public static void UseEfCore(this IApplicationBuilder app)
    {
        app.UseHzyEFCoreRepository(typeof(AdminDbContext));
    }

    /// <summary>
    /// 注册 Admin 后台管理数据库
    /// </summary>
    /// <param name="services"></param>
    /// <param name="appConfiguration"></param>
    /// <param name="hostBuilder"></param>
    public static void AddEfCore(this IServiceCollection services, AppConfiguration appConfiguration, WebApplicationBuilder hostBuilder)
    {
        //取消域验证
        // hostBuilder.Host.UseDefaultServiceProvider(options => { options.ValidateScopes = false; });

        #region AdminDbContext 注册配置

        var dbContextOptionsBuilder = new DbContextOptionsBuilder<AdminDbContext>();
        DbContextOptions<AdminDbContext> options = null;
        switch (appConfiguration.ConnectionStrings.DefaultDatabaseType)
        {
            case DefaultDatabaseType.SqlServer:
                options = dbContextOptionsBuilder
               .UseSqlServer(appConfiguration.ConnectionStrings.DefaultSqlServer, w => w.MinBatchSize(1).MaxBatchSize(1000))
               .Options;
                break;
            case DefaultDatabaseType.MySql:
                options = dbContextOptionsBuilder
               .UseMySql(appConfiguration.ConnectionStrings.DefaultMySql, MySqlServerVersion.LatestSupportedServerVersion, w => w.MinBatchSize(1).MaxBatchSize(1000))
               .Options;
                break;
            case DefaultDatabaseType.PostgreSql:
                //EnableLegacyTimestampBehavior 启动旧行为，避免时区问题，存储时间报错
                AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);
                options = dbContextOptionsBuilder
                .UseNpgsql(appConfiguration.ConnectionStrings.DefaultPostgreSql, w => w.MinBatchSize(1).MaxBatchSize(1000))
                .Options;
                break;
            case DefaultDatabaseType.Oracle:
                options = dbContextOptionsBuilder
                .UseOracle(appConfiguration.ConnectionStrings.DefaultOracle, w => w.MinBatchSize(1).MaxBatchSize(1000))
                .Options;
                break;
            default:
                break;
        }

        UseEfCoreLoggerFactory(dbContextOptionsBuilder);
        // 懒加载代理
        //options.UseLazyLoadingProxies();
        //添加 EFCore 监控 和 动态表名
        dbContextOptionsBuilder.AddHzyEFCoreRepository(appConfiguration.Configs.IsMonitorEFCore);
        dbContextOptionsBuilder.AddInterceptors(new AuditInterceptor());
        //采用连接池
        var pooledDbContextFactory = new PooledDbContextFactory<AdminDbContext>(options);
        services.AddScoped(serviceProvider => pooledDbContextFactory.CreateDbContext());
        //采用非连接池方式
        //services.AddScoped(serviceProvider => new AdminDbContext(options));

        //微软的默认注册 此方式容易造成内存泄露
        //services.AddDbContextPool<AdminDbContext>(options =>
        //{
        //    UseEfCoreLoggerFactory(options);

        //    // 懒加载代理
        //    //options.UseLazyLoadingProxies();
        //    //添加 EFCore 监控 和 动态表名
        //    options.AddHzyEFCoreRepository(appConfiguration.Configs.IsMonitorEFCore);
        //    options.AddInterceptors(new AuditInterceptor());

        //    switch (appConfiguration.ConnectionStrings.DefaultDatabaseType)
        //    {
        //        case DefaultDatabaseType.SqlServer:
        //            options.UseSqlServer(appConfiguration.ConnectionStrings.DefaultSqlServer, w => w.MinBatchSize(1).MaxBatchSize(1000));
        //            break;
        //        case DefaultDatabaseType.MySql:
        //            options.UseMySql(appConfiguration.ConnectionStrings.DefaultMySql, MySqlServerVersion.LatestSupportedServerVersion, w => w.MinBatchSize(1).MaxBatchSize(1000));
        //            break;
        //        case DefaultDatabaseType.PostgreSql:
        //            //EnableLegacyTimestampBehavior 启动旧行为，避免时区问题，存储时间报错
        //            AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);
        //            options.UseNpgsql(appConfiguration.ConnectionStrings.DefaultPostgreSql, w => w.MinBatchSize(1).MaxBatchSize(1000));
        //            break;
        //        case DefaultDatabaseType.Oracle:
        //            options.UseOracle(appConfiguration.ConnectionStrings.DefaultOracle, w => w.MinBatchSize(1).MaxBatchSize(1000));
        //            break;
        //        default:
        //            break;
        //    }

        //}, 2048);

        #endregion
    }

    /// <summary>
    /// efcore 使用控制台日志
    /// </summary>
    /// <param name="options"></param>
    private static void UseEfCoreLoggerFactory(DbContextOptionsBuilder options)
    {
        try
        {
            using var scope = IOCUtil.CreateScope();
            var webHostEnvironment = scope.ServiceProvider.GetRequiredService<IWebHostEnvironment>();
            if (webHostEnvironment.IsDevelopment())
            {
                var loggerFactory = LoggerFactory.Create(builder => builder.AddConsole());
                // sql 日志写入控制台
                options.UseLoggerFactory(loggerFactory);
            }
        }
        catch (Exception) { }
    }
}
