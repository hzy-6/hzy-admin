namespace HZY.Api.Admin.Controllers.DevelopmentTools.LowCode;

[ControllerDescriptor(MenuId = "请设置菜单Id 系统菜单表中查找", DisplayName = nameof(LowCodeTableController))]
public class LowCodeTableController : AdminControllerBase<LowCodeTableService>
{
    public LowCodeTableController(LowCodeTableService defaultService)
        : base(defaultService)
    {

    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    [HttpPost]
    public async Task<PagingView> FindListAsync([FromBody] PagingSearchInput<LowCodeTable> pagingSearchInput)
    {
        return await _defaultService.FindListAsync(pagingSearchInput);
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    [HttpPost]
    public async Task<bool> DeleteListAsync([FromBody] List<Guid> ids)
    {
        await _defaultService.DeleteListAsync(ids);
        return true;
    }

    /// <summary>
    /// 同步表
    /// </summary>
    /// <returns></returns>
    [HttpPost]
    public Task SynchronizationAsync()
    {
        return _defaultService.SynchronizationAsync();
    }

    /// <summary>
    /// 变更数据
    /// </summary>
    /// <param name="lowCodeTables"></param>
    /// <returns></returns>
    [HttpPost]
    public Task ChangeAsync([FromBody] List<LowCodeTable> lowCodeTables)
    {
        return _defaultService.ChangeAsync(lowCodeTables);
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查询数据")]
    [HttpGet("{id?}")]
    public Task<Dictionary<string, object>> FindFormAsync([FromRoute] Guid id)
    {
        return _defaultService.FindFormAsync(id);
    }

    /// <summary>
    /// 添加
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [RequestLimitFilter]
    [ActionDescriptor(PermissionFunctionConsts.Function_Insert, DisplayName = "创建表单")]
    [HttpPost]
    [ApiCheckModel]
    public Task CreateAsync([FromBody] LowCodeTable form)
    {
        return _defaultService.SaveFormAsync(form);
    }

    /// <summary>
    /// 编辑
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [RequestLimitFilter]
    [ActionDescriptor(PermissionFunctionConsts.Function_Update, DisplayName = "编辑表单")]
    [HttpPost]
    [ApiCheckModel]
    public Task UpdateAsync([FromBody] LowCodeTable form)
    {
        return _defaultService.SaveFormAsync(form);
    }



}