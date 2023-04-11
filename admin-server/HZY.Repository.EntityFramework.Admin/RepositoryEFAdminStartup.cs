namespace HZY.Repository.EntityFramework.Admin;

/// <summary>
/// 程序启动器
/// </summary>
public class RepositoryEFAdminStartup : Startup<RepositoryEFAdminStartup>
{
    /// <summary>
    /// 程序启动器
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        var configuration = webApplicationBuilder.Configuration;

        var adminRepositoriesOptions = configuration.GetSection(nameof(AdminRepositoriesOptions)).Get<AdminRepositoriesOptions>();

        //配置efcore
        webApplicationBuilder.AddEFByAdmin(adminRepositoriesOptions);
    }

    /// <summary>
    /// Configure
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {

        // 使用 DbContext
        webApplication.UseEFByAdmin();

    }


}
