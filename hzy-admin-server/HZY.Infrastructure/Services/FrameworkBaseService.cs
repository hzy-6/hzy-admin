using HzyScanDiService;

namespace HZY.Infrastructure.Services;

/// <summary>
/// 服务层 基类
/// </summary>
/// <typeparam name="TRepository">默认仓储 类型</typeparam>
public class FrameworkBaseService<TRepository> : IScopedSelfDependency where TRepository : class
{
    /// <summary>
    /// 默认 仓储
    /// </summary>
    protected readonly TRepository _defaultRepository;

    public FrameworkBaseService(TRepository defaultRepository)
    {
        _defaultRepository = defaultRepository;
    }


}