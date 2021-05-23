using HZY.Repository.AppCore.DbContexts;
using HZY.Repository.AppCore.Impl;
using HZY.Repository.AppCore.Interface;
using HZY.Repository.AppCore.Provider;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace HZY.Repository.AppCore
{
    public class RepositoryModule
    {

        public static void RegisterAdminRepository(IServiceCollection services, string connectionString)
        {
            #region 后台 管理系统 数据库上下文

            services.AddDbContext<AdminBaseDbContext>(options =>
            {
                options.UseLoggerFactory(LoggerFactory.Create(builder => builder.AddConsole()))
                    //无跟踪
                    // .UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking)

                #region SqlSever
                    .UseSqlServer(connectionString, w => w.MinBatchSize(1).MaxBatchSize(100))
                #endregion

                #region MySql
                    //.UseMySql(connectionString, MySqlServerVersion.LatestSupportedServerVersion, w => w.MinBatchSize(1).MaxBatchSize(100))
                #endregion

                #region Npgsql
                    //.UseNpgsql(connectionString, w => w.MinBatchSize(1).MaxBatchSize(100))
                #endregion

                    ;
            });

            #endregion

            services.AddSingleton<ICacheEntity, CacheEntityImpl>();
            services.AddScoped(typeof(AdminBaseRepository<>));
        }




    }
}
