using HZY.Framework.DependencyInjection.Attributes;

namespace HZY.Core.ApplicationServices;

/// <summary>
/// 服务父类
/// </summary>
[Component]
public class ApplicationService //: IScopedSelfDependency
{

}

/// <summary>
/// 服务父类
/// </summary>
/// <typeparam name="TRepository">仓储</typeparam>
public class ApplicationService<TRepository> : ApplicationService where TRepository : class
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
