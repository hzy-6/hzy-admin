using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using FreeSql;
using FreeSql.Aop;
using FreeSql.Internal.CommonProvider;
using FreeSql.Internal.Model;
using HZY.Toolkit;
using Microsoft.Extensions.DependencyInjection;

namespace HZY.Repository.Core
{
    /// <summary>
    /// 仓储层扩展 Extensions
    /// </summary>
    public static class HzyRepositoryExtensions
    {
        /// <summary>
        /// 注册 仓储层
        /// </summary>
        /// <param name="services"></param>
        /// <param name="connectionString"></param>
        /// <param name="assemblyFilter"></param>
        public static void RegisterRepository(this IServiceCollection services, string connectionString, string assemblyFilter = "HZY.Repository")
        {
            var freeSql = CreateFreeSql(connectionString);
            services.AddSingleton(freeSql);
            services.AddScoped<UnitOfWorkManager>();
            services.AddFreeRepository(null, ServiceScanningExtensions.GetAssemblyList(w =>
            {
                var name = w.GetName().Name;
                return name != null && name.StartsWith(assemblyFilter);
            }).ToArray());
        }

        /// <summary>
        /// 创建 free sql 对象
        /// </summary>
        /// <param name="connectionString"></param>
        /// <returns></returns>
        private static IFreeSql CreateFreeSql(string connectionString)
        {
            var freeSql = new FreeSql.FreeSqlBuilder()
                .UseConnectionString(FreeSql.DataType.SqlServer, connectionString)
                .UseAutoSyncStructure(true) //自动迁移实体的结构到数据库
                .Build(); //请务必定义成 Singleton 单例模式

            // sql执行后
            freeSql.Aop.CurdAfter += (s, curdAfter) =>
            {
                var stringBuilder = new StringBuilder();
                stringBuilder.Append($"\r\n====[Sql Start 耗时: {curdAfter.ElapsedMilliseconds}]=========");
                stringBuilder.Append($"\r\n{curdAfter.Sql}");
                stringBuilder.Append($"\r\n====[Sql End 线程Id:{Thread.CurrentThread.ManagedThreadId}]=========");
                Console.WriteLine(stringBuilder);
            };

            // 审计属性值
            freeSql.Aop.AuditValue += (s, auditInfo) =>
            {
                switch (auditInfo.AuditValueType)
                {
                    case AuditValueType.Insert:
                        {
                            if (auditInfo.Property.Name == "CreateTime")
                            {
                                auditInfo.Value = DateTime.Now;
                            }

                            break;
                        }
                    case AuditValueType.Update:
                        break;
                    case AuditValueType.InsertOrUpdate:
                        {
                            if (auditInfo.Property.Name == "UpdateTime")
                            {
                                auditInfo.Value = DateTime.Now;
                            }

                            break;
                        }
                    default:
                        throw new ArgumentOutOfRangeException();
                }
            };

            return freeSql;
        }

        /// <summary>
        /// 根据 query 获取 查询的表信息
        /// </summary>
        /// <param name="query"></param>
        /// <returns></returns>
        public static List<SelectTableInfo> GetFreeSqlSelectTableInfos(this ISelect0 query)
        //(this ISelect0 query)
        {
            var select0Provider = query as Select0Provider;
            if (select0Provider == null) return new List<SelectTableInfo>();
            return select0Provider._tables;
        }

        /// <summary>
        /// 根据 query 获取 查询的表信息
        /// </summary>
        /// <param name="query"></param>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        public static List<SelectTableInfo> GetFreeSqlSelectTableInfos<T>(this ISelectedQuery<T> query)
        {
            var select0Provider = query.SelectOwner;
            if (select0Provider == null) return new List<SelectTableInfo>();
            return select0Provider._tables;
        }
    }
}
