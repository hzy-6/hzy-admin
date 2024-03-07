namespace HZY.Api.Admin.Controllers.DevelopmentTools;

/// <summary>
/// 系统账号管理
/// </summary>
[ControllerDescriptor(MenuId = "30")]
public class QuartzTasksController : AdminControllerBase<ITaskService>
{
    private readonly IJobLoggerService _jobLoggerService;
    private readonly IRepository<QuartzJob> _quartzJobRepository;

    public QuartzTasksController(ITaskService defaultService, IJobLoggerService jobLoggerService, IRepository<QuartzJob> quartzJobRepository) : base(defaultService)
    {
        _jobLoggerService = jobLoggerService;
        _quartzJobRepository = quartzJobRepository;
    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="filter"></param>
    /// <returns></returns>
    [HttpPost("/{filter?}")]
    public Task<List<QuartzJob>> FindListAsync([FromRoute] string? filter) => _defaultService.FindListAsync(filter);

    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [HttpPost]
    public Task<QuartzJob> SaveFormAsync([FromBody] QuartzJob form) => _defaultService.SaveAsync(form);

    /// <summary>
    /// 删除数据
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    [HttpPost]
    public Task<bool> DeleteListAsync([FromBody] List<Guid> ids) => _defaultService.DeleteAsync(ids);

    /// <summary>
    /// 根据Id 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    [HttpGet("{id?}")]
    public Task<QuartzJob> FindFormAsync([FromRoute] Guid id) => _defaultService.FindByIdAsync(id);

    /// <summary>
    /// 根据任务id 运行任务调度
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    [HttpPost]
    public async Task<bool> RunAsync([FromBody] List<Guid> ids)
    {
        var quartzJobTasks = await _quartzJobRepository.SelectNoTracking.Where(w => ids.Contains(w.Id)).ToListAsync();

        foreach (var item in quartzJobTasks)
        {
            await _defaultService.RunByIdAsync(item);
        }
        return true;
    }

    /// <summary>
    /// 根据任务id 关闭任务调度
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    [HttpPost]
    public async Task<bool> CloseAsync([FromBody] List<Guid> ids)
    {
        var quartzJobTasks = await _quartzJobRepository.SelectNoTracking.Where(w => ids.Contains(w.Id)).ToListAsync();

        foreach (var item in quartzJobTasks)
        {
            await _defaultService.CloseByIdAsync(item);
        }
        return true;
    }

    /// <summary>
    /// 获取运行日志
    /// </summary>
    /// <param name="taskId"></param>
    /// <param name="page"></param>
    /// <param name="size"></param>
    /// <returns></returns>
    [HttpGet("{taskId}/{page}/{size}")]
    public object GetJobLoggers([FromRoute] Guid taskId, [FromRoute] int page, [FromRoute] int size)
    {
        var list = _jobLoggerService.FindListById(taskId, page, size, out var total)
            .OrderByDescending(w => w.CreationTime)
            .ToList()
            ;

        return new
        {
            list,
            total
        };
    }

    /// <summary>
    /// 扫描本地任务
    /// </summary>
    /// <returns></returns>
    [HttpGet]
    public Task<bool> ScanTaskAsync()
    {
        return _defaultService.RecoveryTaskAsync();
    }

}
