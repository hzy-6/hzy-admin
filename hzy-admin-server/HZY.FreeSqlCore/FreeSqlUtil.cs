using HZY.Infrastructure;
using HZY.Infrastructure.SerilogUtil;
using HZY.Framework.AutoRegisterIOC;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using HZY.Framework.Core.Utils;
using HZY.Infrastructure.Enums;

namespace HZY.FreeSqlCore;

/// <summary>
/// FreeSql 模块配置
/// </summary>
public static class FreeSqlUtil
{
    /// <summary>
    /// Admin IFreeSql
    /// </summary>
    private static IFreeSql AdminFreeSql;

    /// <summary>
    /// 注册 仓储层
    /// </summary>
    /// <param name="services"></param>
    /// <param name="appConfiguration"></param>
    /// <param name="assemblyFilter"></param>
    /// <exception cref="System.Exception"></exception>
    public static void AddFreeSql(this IServiceCollection services, AppConfiguration appConfiguration, string assemblyFilter = "HZY.Repositories")
    {
        #region Admin

        var databaseType = appConfiguration.ConnectionStrings.DefaultDatabaseType;
        var dataType = FreeSql.DataType.SqlServer;
        var connectionString = appConfiguration.ConnectionStrings.DefaultSqlServer;

        if (databaseType == DefaultDatabaseType.SqlServer)
        {
            connectionString = appConfiguration.ConnectionStrings.DefaultSqlServer;
            dataType = FreeSql.DataType.SqlServer;
        }
        if (databaseType == DefaultDatabaseType.MySql)
        {
            connectionString = appConfiguration.ConnectionStrings.DefaultMySql;
            dataType = FreeSql.DataType.MySql;
        }
        if (databaseType == DefaultDatabaseType.PostgreSql)
        {
            connectionString = appConfiguration.ConnectionStrings.DefaultPostgreSql;
            dataType = FreeSql.DataType.PostgreSQL;
        }

        FreeSqlUtil.AdminFreeSql = new FreeSql.FreeSqlBuilder()
            .UseConnectionString(dataType, connectionString)
            .UseAutoSyncStructure(false) //自动迁移实体的结构到数据库
            .Build(); //请务必定义成 Singleton 单例模式

        // sql执行后
        AdminFreeSql.Aop.CurdAfter += (s, curdAfter) =>
        {
            //if (curdAfter.ElapsedMilliseconds > 1000)
            {
                var stringBuilder = new StringBuilder();
                stringBuilder.Append($"\r\n====[Sql Start 耗时: {curdAfter.ElapsedMilliseconds} ms]=========");
                stringBuilder.Append($"\r\n{curdAfter.Sql}");
                stringBuilder.Append($"\r\n====[Sql End 线程Id:{Environment.CurrentManagedThreadId}]=========");
                Console.WriteLine(stringBuilder);
                LogUtil.Log.Warning(stringBuilder.ToString());
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

        services.AddSingleton(FreeSqlUtil.AdminFreeSql);
        //services.AddScoped<UnitOfWorkManager>();
        services.AddFreeRepository(null, AssemblyUtil.GetAssemblyList().Where(w =>
        {
            var name = w.GetName().Name;
            return name != null && name.StartsWith(assemblyFilter);
        }).ToArray());

        #endregion

    }
}