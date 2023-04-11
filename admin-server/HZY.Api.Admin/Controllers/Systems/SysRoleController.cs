namespace HZY.Api.Admin.Controllers.Systems;

/// <summary>
/// 角色控制器
/// </summary>
[ControllerDescriptor(MenuId = "16", DisplayName = "角色")]
public class SysRoleController : AdminControllerBase<SysRoleService>
{
    public SysRoleController(SysRoleService defaultService) : base(defaultService)
    {

    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看表格")]
    [ApiResourceCacheFilter(1)]
    [HttpPost]
    public async Task<PagingView> FindListAsync([FromBody] PagingSearchInput<SysRole> pagingSearchInput)
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
    public async Task<bool> DeleteListAsync([FromBody] List<Guid> ids)
    {
        await _defaultService.DeleteListAsync(ids);
        return true;
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "获取数据")]
    [HttpGet("{id?}")]
    public async Task<Dictionary<string, object>> FindFormAsync([FromRoute] Guid id)
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
    public Task CreateAsync([FromBody] SysRole form)
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
    public Task UpdateAsync([FromBody] SysRole form)
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
    public async Task ExportExcelAsync([FromBody] PagingSearchInput<SysRole> pagingSearchInput)
        => HttpContext.DownLoadFile(await _defaultService.ExportExcelAsync(pagingSearchInput), Tools.GetFileContentType[".xls"].ToStr(),
            $"{PermissionUtil.GetControllerDisplayName(GetType())}列表数据 {DateTime.Now.ToString("yyyy-MM-dd")}.xls");




}