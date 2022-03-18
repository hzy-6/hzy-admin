﻿using HZY.EFCore.DbContexts;
using HZY.EFCore.Impl;
using HZY.EFCore.Interface;
using HZY.Infrastructure;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace HZY.EFCore;

/// <summary>
/// 仓储模块
/// </summary>
public class EFCoreModule
{
    /// <summary>
    /// 注册 Admin 后台管理数据库
    /// </summary>
    /// <param name="services"></param>
    /// <param name="configuration"></param>
    /// <exception cref="System.Exception"></exception>
    public static void RegisterAdminBaseDbContext(IServiceCollection services, IConfiguration configuration)
    {
        DefaultDatabaseType defaultDatabaseType = DefaultDatabaseType.SqlServer;

        var databaseType = configuration["AppConfiguration:DefaultDatabaseType"];
        if (databaseType == "SqlServer")
            defaultDatabaseType = DefaultDatabaseType.SqlServer;
        else if (databaseType == "MySql")
            defaultDatabaseType = DefaultDatabaseType.MySql;
        else if (databaseType == "PgSql")
            defaultDatabaseType = DefaultDatabaseType.PostgreSql;
        else
            throw new System.Exception("设置了无法识别的数据库类型!");

        var connectionString = configuration[$"AppConfiguration:DefaultConnectionString_{databaseType}"];

        #region 后台 管理系统 数据库上下文

        services.AddDbContextPool<AdminBaseDbContext>(options =>
        {

            options.UseLoggerFactory(LoggerFactory.Create(builder => builder.AddConsole()))
            //.UseLazyLoadingProxies()
            ;
            //无跟踪
            // .UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking)

            if (defaultDatabaseType == DefaultDatabaseType.SqlServer)
            {
                #region SqlSever
                options.UseSqlServer(connectionString, w => w.MinBatchSize(1).MaxBatchSize(1000));
                #endregion
            }

            if (defaultDatabaseType == DefaultDatabaseType.MySql)
            {
                #region MySql
                options.UseMySql(connectionString, MySqlServerVersion.LatestSupportedServerVersion, w => w.MinBatchSize(1).MaxBatchSize(1000));
                #endregion
            }

            if (defaultDatabaseType == DefaultDatabaseType.PostgreSql)
            {
                //EnableLegacyTimestampBehavior 启动旧行为，避免时区问题，存储时间报错
                System.AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);
                #region Npgsql
                options.UseNpgsql(connectionString, w => w.MinBatchSize(1).MaxBatchSize(1000));
                #endregion
            }

        }, 100);

        #endregion

        services.AddSingleton<ICacheEntity, CacheEntityImpl>();
    }




}