namespace HZY.Shared;

/// <summary>
/// 基础启动器
/// </summary>
/// <typeparam name="TStartup"></typeparam>
[ImportStartup(typeof(SharedStartup),
    typeof(RepositoryEFAdminStartup),
    typeof(RepositoryFreeSqlAdminStartup)
    )]
public class MicroserviceStartupBase<TStartup> : AppStartupBaseCore<TStartup> where TStartup : Framework.Core.AspNetCore.IStartup, new()
{
    /// <summary>
    /// 注册服务
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        base.ConfigureServices(webApplicationBuilder);

        // Add services to the container.
        webApplicationBuilder.Services
            .AddControllers(options =>
            {
                options.Filters.Add<ApiExceptionFilter>();
            })
            .AddDynamicApiController(options => options.IsLower = false)
            .AddControllersAsServices()
            .AddNewtonsoftJson(options =>
            {
                options.SerializerSettings.DateFormatString = "yyyy-MM-dd HH:mm:ss";
                //小驼峰命名
                options.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
            })
            ;
    }

    /// <summary>
    /// 使用服务
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {
        base.Configure(webApplication);
    }


}
