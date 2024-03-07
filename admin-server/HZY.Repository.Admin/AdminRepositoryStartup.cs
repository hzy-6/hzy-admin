namespace HZY.Repository.Admin;

/// <summary>
/// 程序启动器
/// </summary>
[ImportStartupModule<CoreEntityFrameworkStartup>]
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

        var repositoriesOptions = configuration
         .GetSection(nameof(AdminRepositoryOptions))
         .Get<AdminRepositoryOptions>() ?? throw new Exception("配置对象 空 异常！");

        var connectionString = repositoriesOptions?.ConnectionString;

        connectionString = string.IsNullOrWhiteSpace(connectionString) ?
            configuration["ConnectionStrings:" + repositoriesOptions!.DefaultDatabaseType.ToString()] :
            connectionString;

        services.AddDbContextFactory<AdminDbContext>(optionsBuilder =>
        {
            switch (repositoriesOptions.DefaultDatabaseType)
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
            optionsBuilder.AddEntityFrameworkMonitor(repositoriesOptions.IsMonitorEFCore);
            optionsBuilder.AddInterceptors(new AuditInterceptor());
        });

        services.AddEntityFrameworkRepositories<AdminDbContext>(repositoriesOptions, (auditOptions) =>
        {
            // 你的自定义审计字段 ...
            //auditOptions.Add(new AuditOptions()
            //{
            //    CreationTimeFieldName = nameof(ICreateEntityV2.CreateTime),
            //    CreatorUserIdFieldName = "",
            //    LastModificationTimeFieldName = nameof(IUpdateEntityV2.UpdateTime),
            //    LastModifierUserIdFieldName = "",
            //    DeletionTimeFieldName = "UpdateTime",
            //    DeleterUserIdFieldName = "UpdateBy",
            //    IsDeletedFieldName = "DelFlag",
            //});
        }, (freesqlOptions) =>
        {
            freesqlOptions.FreeSqlAuditAopList?.Add(new FreeSqlAuditAop());
            freesqlOptions.FreeSqlAction = (freeSql) =>
            {
                freeSql.Aop.CurdAfter += (object? sender, FreeSql.Aop.CurdAfterEventArgs curdAfter) =>
                {
                    var stringBuilder = new StringBuilder();
                    stringBuilder.Append($"\r\n====[FreeSql 开始 耗时: {curdAfter.ElapsedMilliseconds} ms]=========");
                    stringBuilder.Append($"\r\n{curdAfter.Sql}");
                    stringBuilder.Append($"\r\n====[FreeSql 结束 线程Id:{Environment.CurrentManagedThreadId}]=========");
                    LogUtil.Log.Warning(stringBuilder.ToString());
                };
            };
        });
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
