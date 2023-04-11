namespace HZY.Repository.FreeSql.Admin;

/// <summary>
/// 程序启动器
/// </summary>
public class RepositoryFreeSqlAdminStartup : Startup<RepositoryFreeSqlAdminStartup>
{
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        var configuration = webApplicationBuilder.Configuration;

        var adminRepositoriesOptions = configuration.GetSection(nameof(AdminRepositoriesOptions)).Get<AdminRepositoriesOptions>();

        //配置freesql
        webApplicationBuilder.AddFreeSqlByAdmin(adminRepositoriesOptions.DefaultDatabaseType);
    }

}
