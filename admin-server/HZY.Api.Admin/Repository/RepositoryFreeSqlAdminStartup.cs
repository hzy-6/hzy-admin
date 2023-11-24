namespace HZY.Api.Admin.Repository;

/// <summary>
/// 程序启动器
/// </summary>
public class RepositoryFreeSqlAdminStartup : StartupModule<RepositoryFreeSqlAdminStartup>
{
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        var configuration = webApplicationBuilder.Configuration;

        var adminRepositoriesOptions = configuration.GetSection(nameof(AdminRepositoryOptions)).Get<AdminRepositoryOptions>();

        //配置freesql
        webApplicationBuilder.AddFreeSqlByAdmin(adminRepositoriesOptions.DefaultDatabaseType);
    }

}
