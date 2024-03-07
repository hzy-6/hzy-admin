namespace HZY.Shared;

/// <summary>
/// 基础启动器
/// </summary>
/// <typeparam name="TStartupMoudle"></typeparam>
[ImportStartupModule<SharedStartup>]
public class AppStartupBase<TStartupMoudle> : AppStartupBaseCore<TStartupMoudle> where TStartupMoudle : IStartupModule, new()
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
