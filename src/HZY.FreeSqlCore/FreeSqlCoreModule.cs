using HZY.Infrastructure;
using HZY.Infrastructure.NLogService;
using HzyScanDiService.Extensions;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace HZY.FreeSqlCore;

/// <summary>
/// FreeSql 模块配置
/// </summary>
public static class FreeSqlCoreModule
{
    /// <summary>
    /// 注册 仓储层
    /// </summary>
    /// <param name="services"></param>
    /// <param name="configuration"></param>
    /// <param name="assemblyFilter"></param>
    /// <exception cref="System.Exception"></exception>
    public static void RegisterFreeSql(this IServiceCollection services, IConfiguration configuration, string assemblyFilter = "HZY.Repositories")
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

        var freeSql = CreateFreeSql(connectionString, defaultDatabaseType);
        services.AddSingleton(freeSql);
        //services.AddScoped<UnitOfWorkManager>();
        services.AddFreeRepository(null, DiServiceScanningExtensions.GetAssemblyList(w =>
        {
            var name = w.GetName().Name;
            return name != null && name.StartsWith(assemblyFilter);
        }).ToArray());
    }

    /// <summary>
    /// 创建 free sql 对象
    /// </summary>
    /// <param name="connectionString"></param>
    /// <param name="defaultDatabaseType"></param>
    /// <returns></returns>
    private static IFreeSql CreateFreeSql(string connectionString, DefaultDatabaseType defaultDatabaseType)
    {
        var dataType = FreeSql.DataType.SqlServer;

        dataType = defaultDatabaseType switch
        {
            DefaultDatabaseType.SqlServer => FreeSql.DataType.SqlServer,
            DefaultDatabaseType.MySql => FreeSql.DataType.MySql,
            DefaultDatabaseType.PostgreSql => FreeSql.DataType.PostgreSQL,
            _ => FreeSql.DataType.SqlServer,
        };
        var freeSql = new FreeSql.FreeSqlBuilder()
            .UseConnectionString(dataType, connectionString)
            .UseAutoSyncStructure(false) //自动迁移实体的结构到数据库
            .Build(); //请务必定义成 Singleton 单例模式

        // sql执行后
        freeSql.Aop.CurdAfter += (s, curdAfter) =>
        {
            if (curdAfter.ElapsedMilliseconds > 1000)
            {
                var stringBuilder = new StringBuilder();
                stringBuilder.Append($"\r\n====[Sql Start 耗时: {curdAfter.ElapsedMilliseconds} ms]=========");
                stringBuilder.Append($"\r\n{curdAfter.Sql}");
                stringBuilder.Append($"\r\n====[Sql End 线程Id:{Environment.CurrentManagedThreadId}]=========");
                Console.WriteLine(stringBuilder);
                NLogUtil.Write(stringBuilder.ToString());
            }
        };

        // 审计属性值
        //freeSql.Aop.AuditValue += (s, auditInfo) =>
        //{
        //    switch (auditInfo.AuditValueType)
        //    {
        //        case AuditValueType.Insert:
        //            {
        //                if (auditInfo.Property.Name == nameof(BaseModel.CreateTime) ||
        //                    auditInfo.Property.Name == nameof(BaseModel.UpdateTime))
        //                {
        //                    auditInfo.Value = DateTime.Now;
        //                }

        //                break;
        //            }
        //        case AuditValueType.Update:
        //        case AuditValueType.InsertOrUpdate:
        //            {
        //                if (auditInfo.Property.Name == nameof(BaseModel.UpdateTime))
        //                {
        //                    auditInfo.Value = DateTime.Now;
        //                }

        //                break;
        //            }
        //        default:
        //            throw new ArgumentOutOfRangeException();
        //    }
        //};

        return freeSql;
    }


}