namespace HZY.Api.Admin.Controllers.Systems;

/// <summary>
/// 操作日志控制器
/// </summary>
[ControllerDescriptor(MenuId = "24", DisplayName = "操作日志")]
public class SysOperationLogController : AdminControllerBase<SysOperationLogService>
{
    public SysOperationLogController(SysOperationLogService defaultService) : base(defaultService)
    {

    }

    /// <summary>
    /// 获取表单数据
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看列表")]
    [HttpPost]
    public async Task<PagingView> FindListAsync([FromBody] PagingSearchInput<SysOperationLogSearchDto> pagingSearchInput)
    {
        return await _defaultService.FindListAsync(pagingSearchInput);
    }

    /// <summary>
    /// 删除所有数据
    /// </summary>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "删除数据")]
    [HttpGet]
    public async Task<bool> DeleteAllDataAsync()
    {
        return await _defaultService.DeletedAllData();
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看表单")]
    [HttpGet("{id?}")]
    public async Task<Dictionary<string, object>> FindFormAsync([FromRoute] Guid id)
    {
        return await _defaultService.FindFormAsync(id);
    }

}