namespace HZY.Api.Admin.Controllers.DevelopmentTools;

/// <summary>
/// 系统账号管理
/// </summary>
[ControllerDescriptor(MenuId = "30")]
public class QuartzTasksController : AdminControllerBase<ITaskService>
{
    private readonly IJobLoggerService _jobLoggerService;
    private readonly IRepository<QuartzJobTask> _quartzJobTaskRepository;

    public QuartzTasksController(ITaskService defaultService, IJobLoggerService jobLoggerService, IRepository<QuartzJobTask> quartzJobTaskRepository) : base(defaultService)
    {
        _jobLoggerService = jobLoggerService;
        _quartzJobTaskRepository = quartzJobTaskRepository;
    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="filter"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看列表")]
    [HttpPost("{filter?}")]
    public async Task<List<QuartzJobTask>> FindListAsync([FromRoute] string filter) => (await _defaultService.FindListAsync(filter))?.ToList();

    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "保存/编辑表单")]
    [HttpPost]
    public async Task<QuartzJobTask> SaveFormAsync([FromBody] QuartzJobTask form) => await _defaultService.SaveAsync(form);

    /// <summary>
    /// 删除数据
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "删除数据")]
    [HttpPost]
    public async Task<bool> DeleteListAsync([FromBody] List<Guid> ids) => await _defaultService.DeleteAsync(ids);

    /// <summary>
    /// 根据Id 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看表单")]
    [HttpGet("{id?}")]
    public async Task<QuartzJobTask> FindFormAsync([FromRoute] Guid id) => await _defaultService.FindByIdAsync(id);

    /// <summary>
    /// 根据任务id 运行任务调度
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "运行任务")]
    [HttpPost]
    public async Task<bool> RunAsync([FromBody] List<Guid> ids)
    {
        var quartzJobTasks = await _quartzJobTaskRepository.SelectNoTracking.Where(w => ids.Contains(w.Id)).ToListAsync();

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
    [ActionDescriptor(DisplayName = "关闭任务")]
    [HttpPost]
    public async Task<bool> CloseAsync([FromBody] List<Guid> ids)
    {
        var quartzJobTasks = await _quartzJobTaskRepository.SelectNoTracking.Where(w => ids.Contains(w.Id)).ToListAsync();

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
    [ActionDescriptor(DisplayName = "查看运行日志")]
    [HttpGet("{taskId}/{page}/{size}")]
    public List<QuartzJobTaskLog> GetJobLoggers([FromRoute] Guid taskId, [FromRoute] int page, [FromRoute] int size)
    {
        return _jobLoggerService.FindListById(taskId, page, size)
            .OrderByDescending(w => w.CreationTime)
            .ToList()
            ;
    }



}
