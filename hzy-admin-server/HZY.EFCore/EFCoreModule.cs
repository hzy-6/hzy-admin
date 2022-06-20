using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using HZY.EFCore.DbContexts;
using HZY.EFCore.DbContexts.Interceptor;
using HZY.Infrastructure;
using HzyEFCoreRepositories;
using Microsoft.Extensions.Hosting;
using Microsoft.AspNetCore.Builder;

namespace HZY.EFCore;

/// <summary>
/// 仓储模块
/// </summary>
public class EFCoreModule
{
    #region  AdminBaseDbContext 注册配置

    /// <summary>
    /// 注册 Admin 后台管理数据库
    /// </summary>
    /// <param name="services"></param>
    /// <param name="appConfiguration"></param>
    /// <param name="hostBuilder"></param>
    public static void AddAdminDbContext(IServiceCollection services, AppConfiguration appConfiguration, WebApplicationBuilder hostBuilder)
    {
        //取消域验证
        hostBuilder.Host.UseDefaultServiceProvider(options => { options.ValidateScopes = false; });

        var databaseType = appConfiguration.ConnectionStrings.DefaultDatabaseType;

        #region 后台 管理系统 数据库上下文

        services.AddDbContextPool<AdminDbContext>(options =>
        {
            if (hostBuilder.Environment.IsDevelopment())
            {
                // sql 日志写入控制台
                options.UseLoggerFactory(LoggerFactory.Create(builder => builder.AddConsole()));
            }

            // 无跟踪
            // options.UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking);
            // 懒加载代理
            //options.UseLazyLoadingProxies();
            //添加 EFCore 监控 和 动态表名
            options.AddHzyEFCore(appConfiguration.Configs.IsMonitorEFCore);
            options.AddInterceptors(new AuditInterceptor());

            if (databaseType == DefaultDatabaseType.SqlServer)
            {
                #region SqlSever
                options.UseSqlServer(appConfiguration.ConnectionStrings.DefaultSqlServer, w => w.MinBatchSize(1).MaxBatchSize(1000));
                #endregion
            }

            if (databaseType == DefaultDatabaseType.MySql)
            {
                #region MySql
                options.UseMySql(appConfiguration.ConnectionStrings.DefaultMySql, MySqlServerVersion.LatestSupportedServerVersion, w => w.MinBatchSize(1).MaxBatchSize(1000));
                #endregion
            }

            if (databaseType == DefaultDatabaseType.PostgreSql)
            {
                //EnableLegacyTimestampBehavior 启动旧行为，避免时区问题，存储时间报错
                System.AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);
                #region Npgsql
                options.UseNpgsql(appConfiguration.ConnectionStrings.DefaultPostgreSql, w => w.MinBatchSize(1).MaxBatchSize(1000));
                #endregion
            }

        }, 1000);

        #endregion
    }

    /// <summary>
    /// 使用 AdminDbContext
    /// </summary>
    /// <param name="serviceProvider"></param>
    public static void UseAdminDbContext(IServiceProvider serviceProvider)
    {
        serviceProvider.UseHzyEFCore(typeof(AdminDbContext));
    }

    #endregion

}
