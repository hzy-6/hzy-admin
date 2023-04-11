namespace HZY.Shared.ApplicationServices;

/// <summary>
/// 服务父类
/// </summary>
[Component]
public class ApplicationService
{



}

/// <summary>
/// 服务父类
/// </summary>
/// <typeparam name="TRepository">仓储</typeparam>
[Component]
public class ApplicationService<TRepository> where TRepository : class
{
    /// <summary>
    /// 默认仓储
    /// </summary>
    protected readonly TRepository _defaultRepository;

    /// <summary>
    /// 服务父类
    /// </summary>
    /// <param name="defaultRepository"></param>
    public ApplicationService(TRepository defaultRepository)
    {
        _defaultRepository = defaultRepository;
    }


}
