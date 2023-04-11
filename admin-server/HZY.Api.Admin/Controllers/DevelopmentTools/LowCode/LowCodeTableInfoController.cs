namespace HZY.Api.Admin.Controllers.DevelopmentTools.LowCode;

[ControllerDescriptor(MenuId = "请设置菜单Id 系统菜单表中查找", DisplayName = nameof(LowCodeTableInfoController))]
public class LowCodeTableInfoController : AdminControllerBase<LowCodeTableInfoService>
{
    public LowCodeTableInfoController(LowCodeTableInfoService defaultService)
        : base(defaultService)
    {

    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    [HttpPost]
    public async Task<PagingView> FindListAsync([FromBody] PagingSearchInput<LowCodeTableInfo> pagingSearchInput)
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
    [HttpPost("{tableId}")]
    public Task SynchronizationAsync([FromRoute] Guid tableId)
    {
        return _defaultService.SynchronizationColumnByTableIdAsync(tableId);
    }

    /// <summary>
    /// 变更数据
    /// </summary>
    /// <param name="lowCodeTableInfos"></param>
    /// <returns></returns>
    [HttpPost]
    public Task ChangeAsync([FromBody] List<LowCodeTableInfo> lowCodeTableInfos)
    {
        return _defaultService.ChangeAsync(lowCodeTableInfos);
    }

}