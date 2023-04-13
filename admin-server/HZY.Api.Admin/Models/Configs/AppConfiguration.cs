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
        _configuration = configuration;
    }

}

public class FileManagerNode
{
    /// <summary>
    /// 上传文件大小限制
    /// </summary>
    /// <value></value>
    public string? MaxRequestBodySize { get; set; }

    /// <summary>
    /// 服务器地址
    /// </summary>
    /// <value></value>
    public string? ServerUrl { get; set; }

    /// <summary>
    /// 保存文件根路径
    /// </summary>
    /// <value></value>
    public string? DirectoryUrl { get; set; }

    /// <summary>
    /// 上传文件大小
    /// </summary>
    /// <value></value>
    public string? MaxFileSizeLimit { get; set; }

    /// <summary>
    /// 允许上传格式
    /// </summary>
    /// <value></value>
    public string? AllowExtensions { get; set; }

    private long maxRequestBodySize = -1;
    private long maxFileSizeLimit = -1;

    /// <summary>
    /// 获取最大请求内容体长度
    /// </summary>
    /// <returns></returns>
    public long GetMaxRequestBodySize()
    {
        if (maxRequestBodySize == -1)
        {
            try
            {
                var value = MaxRequestBodySize.ToStorageByteLength();
                maxRequestBodySize = value;
            }
            catch (Exception)
            {
                throw new Exception("MaxRequestBodySize 格式错误");
            }
        }

        return maxRequestBodySize;
    }

    /// <summary>
    /// 获取最大文件长度
    /// </summary>
    /// <returns></returns>
    public long GetMaxFileSizeLimit()
    {
        if (maxFileSizeLimit == -1)
        {
            try
            {
                var value = MaxFileSizeLimit.ToStorageByteLength();
                maxFileSizeLimit = value;
            }
            catch (Exception)
            {
                throw new Exception("MaxFileSizeLimit 格式错误");
            }
        }

        return maxFileSizeLimit;
    }
}