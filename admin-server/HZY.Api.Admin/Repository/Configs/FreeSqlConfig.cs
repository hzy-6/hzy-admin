namespace HZY.Api.Admin.Repository.Configs;

/// <summary>
/// FreeSql 模块配置
/// </summary>
public static class FreeSqlConfig
{
    /// <summary>
    /// Admin IFreeSql
    /// </summary>
    private static IFreeSql? AdminFreeSql;

    /// <summary>
    /// 注册 仓储
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    /// <param name="defaultDatabaseType"></param>
    public static void AddFreeSqlByAdmin(this WebApplicationBuilder webApplicationBuilder, DefaultDatabaseType defaultDatabaseType)
    {
        var connectionString = webApplicationBuilder.Configuration["ConnectionStrings:" + defaultDatabaseType.ToString()];

        var dataType = DataType.SqlServer;

        if (defaultDatabaseType == DefaultDatabaseType.SqlServer)
        {
            dataType = DataType.SqlServer;
        }

        if (defaultDatabaseType == DefaultDatabaseType.MySql)
        {
            dataType = DataType.MySql;
        }

        if (defaultDatabaseType == DefaultDatabaseType.PostgreSql)
        {
            dataType = DataType.PostgreSQL;
        }

        AdminFreeSql = new FreeSqlBuilder()
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

        webApplicationBuilder.Services.AddSingleton(AdminFreeSql);
        //services.AddScoped<UnitOfWorkManager>();
        webApplicationBuilder.Services.AddFreeRepository(null, typeof(FreeSqlConfig).Assembly);

    }
}