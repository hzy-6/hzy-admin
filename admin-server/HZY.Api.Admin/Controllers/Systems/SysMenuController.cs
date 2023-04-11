namespace HZY.Api.Admin.Controllers.Systems;

/// <summary>
/// 菜单控制器
/// </summary>
[ControllerDescriptor(MenuId = "25", DisplayName = "菜单")]
public class SysMenuController : AdminControllerBase<SysMenuService>
{
    public SysMenuController(SysMenuService defaultService) : base(defaultService)
    {

    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    //[ApiResourceCacheFilter(1)]
    [ActionDescriptor(DisplayName = "查询列表")]
    [HttpPost]
    public async Task<PagingView> FindListAsync([FromBody] PagingSearchInput<SysMenu> pagingSearchInput)
    {
        return await _defaultService.FindListAsync(pagingSearchInput);
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "删除数据")]
    [HttpPost]
    public async Task<bool> DeleteListAsync([FromBody] List<int> ids)
    {
        await _defaultService.DeleteListAsync(ids);
        return true;
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看表单")]
    [HttpGet("{id?}")]
    public async Task<Dictionary<string, object>> FindFormAsync([FromRoute] int id)
    {
        return await _defaultService.FindFormAsync(id);
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
    public Task CreateAsync([FromBody] SysMenuFormDto form)
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
    public Task UpdateAsync([FromBody] SysMenuFormDto form)
    {
        return _defaultService.SaveFormAsync(form);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "导出数据")]
    [ApiResourceCacheFilter(10)]
    [HttpPost]
    public async Task ExportExcelAsync([FromBody] PagingSearchInput<SysMenu> pagingSearchInput)
        => HttpContext.DownLoadFile(await _defaultService.ExportExcelAsync(pagingSearchInput), Tools.GetFileContentType[".xls"].ToStr(),
            $"{PermissionUtil.GetControllerDisplayName(GetType())}列表数据 {DateTime.Now.ToString("yyyy-MM-dd")}.xls");

    /// <summary>
    /// 获取所有菜单
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "获取所有的菜单")]
    [HttpPost]
    public async Task<List<SysMenuDto>> GetAllAsync([FromBody] SysMenu search)
    {
        return await _defaultService.GetAllAsync(search);
    }

    /// <summary>
    /// 复制
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    [Transactional]
    [HttpPost("{id}")]
    public async Task<int> CopyMenuAsync([FromRoute] int id)
    {
        return await this._defaultService.CopyMenuAsync(id);
    }


}