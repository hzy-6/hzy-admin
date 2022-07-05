using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using HZY.EFCore.DbContexts;
using HZY.EFCore.DbContexts.Interceptor;
using HZY.Infrastructure;
using HzyEFCoreRepositories;
using Microsoft.Extensions.Hosting;
using Microsoft.AspNetCore.Builder;
using HzyScanDiService;
using Microsoft.AspNetCore.Hosting;

namespace HZY.EFCore;

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
        hostBuilder.Host.UseDefaultServiceProvider(options => { options.ValidateScopes = false; });

        #region AdminDbContext 注册配置

        var databaseType = appConfiguration.ConnectionStrings.DefaultDatabaseType;
        services.AddDbContextPool<AdminDbContext>(options =>
        {
            try
            {
                using var scope = IOCUtil.CreateScope();
                var webHostEnvironment = scope.ServiceProvider.GetRequiredService<IWebHostEnvironment>();
                if (webHostEnvironment.IsDevelopment())
                {
                    // sql 日志写入控制台
                    options.UseLoggerFactory(LoggerFactory.Create(builder => builder.AddConsole()));
                }
            }
            catch (Exception) { }

            // 懒加载代理
            //options.UseLazyLoadingProxies();
            //添加 EFCore 监控 和 动态表名
            options.AddHzyEFCoreRepository(appConfiguration.Configs.IsMonitorEFCore);
            options.AddInterceptors(new AuditInterceptor());

            if (databaseType == DefaultDatabaseType.SqlServer)
            {
                options.UseSqlServer(appConfiguration.ConnectionStrings.DefaultSqlServer, w => w.MinBatchSize(1).MaxBatchSize(1000));
            }

            if (databaseType == DefaultDatabaseType.MySql)
            {
                options.UseMySql(appConfiguration.ConnectionStrings.DefaultMySql, MySqlServerVersion.LatestSupportedServerVersion, w => w.MinBatchSize(1).MaxBatchSize(1000));
            }

            if (databaseType == DefaultDatabaseType.PostgreSql)
            {
                //EnableLegacyTimestampBehavior 启动旧行为，避免时区问题，存储时间报错
                System.AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);
                options.UseNpgsql(appConfiguration.ConnectionStrings.DefaultPostgreSql, w => w.MinBatchSize(1).MaxBatchSize(1000));
            }

            if (databaseType == DefaultDatabaseType.Oracle)
            {
                options.UseOracle(appConfiguration.ConnectionStrings.DefaultOracle, w => w.MinBatchSize(1).MaxBatchSize(1000));
            }

        }, 2048);

        #endregion
    }

}
