using HzyScanDiService;
using Microsoft.Extensions.Configuration;

namespace HZY.Infrastructure;

/// <summary>
/// 程序配置信息映射类 appsettings.json
/// </summary>
public class AppConfiguration : ISingletonSelfDependency
{
    /// <summary>
    /// IConfiguration 通过属性注入
    /// </summary>
    [Autowired]
    public virtual IConfiguration _configuration { get; }

    /// <summary>
    /// 程序默认配置项 通过属性注入
    /// </summary>
    [AppSettings(nameof(AppConfigurationOptions))]
    public virtual AppConfigurationOptions Configs { get; }

    /// <summary>
    /// 连接字符串 通过属性注入
    /// </summary>
    [AppSettings(nameof(ConnectionStrings))]
    public virtual ConnectionStringsOptions ConnectionStrings { get; }

    /// <summary>
    /// 程序配置信息映射类
    /// </summary>
    public AppConfiguration()
    {

    }

    /// <summary>
    /// 程序配置信息映射类
    /// </summary>
    /// <param name="configuration"></param>
    public AppConfiguration(IConfiguration configuration)
    {
        this._configuration = configuration;
        Configs = _configuration.GetSection(nameof(AppConfigurationOptions)).Get<AppConfigurationOptions>();
        ConnectionStrings = _configuration.GetSection(nameof(ConnectionStrings)).Get<ConnectionStringsOptions>();

    }

}

/// <summary>
/// 连接字符串配置
/// </summary>
public class ConnectionStringsOptions
{
    /// <summary>
    /// 默认数据库类型
    /// </summary>
    /// <value></value>
    public DefaultDatabaseType DefaultDatabaseType { get; set; }
    /// <summary>
    /// sqlserver
    /// </summary>
    /// <value></value>
    public string DefaultSqlServer { get; set; }
    /// <summary>
    /// mysql
    /// </summary>
    /// <value></value>
    public string DefaultMySql { get; set; }
    /// <summary>
    /// PostgreSql
    /// </summary>
    /// <value></value>
    public string DefaultPostgreSql { get; set; }
    /// <summary>
    /// redis 地址
    /// </summary>
    /// <value></value>
    public string Redis { get; set; }
}

/// <summary>
/// 应用程序配置
/// </summary>
public class AppConfigurationOptions
{
    /// <summary>
    /// 程序标题
    /// </summary>
    /// <value></value>
    public string AppTitle { get; set; }
    public string JwtValidAudience { get; set; }
    public string JwtValidIssuer { get; set; }
    public string JwtIssuerSigningKey { get; set; }
    /// <summary>
    /// token 键名
    /// </summary>
    /// <value></value>
    public string AuthorizationKeyName { get; set; }
    /// <summary>
    /// 超级管理员角色id
    /// </summary>
    /// <value></value>
    public Guid AdminRoleId { get; set; }
    /// <summary>
    /// 系统菜单id
    /// </summary>
    /// <value></value>
    public int SysMenuId { get; set; }
    /// <summary>
    /// 命名空间
    /// </summary>
    public string Namespace { get; set; }
    /// <summary>
    /// Api 白名单
    /// </summary>
    public string ApiWhiteList { get; set; }
    /// <summary>
    /// 是否监控EFCore程序
    /// </summary>
    public bool IsMonitorEFCore { get; set; }
    /// <summary>
    /// 是否拦截编辑 添加、修改、删除
    /// </summary>
    public bool IsInterceptEdit { get; set; }
    /// <summary>
    /// 是否运行 Quartz Task
    /// </summary>
    public bool IsRunQuartzTask { get; set; }
}