namespace HZY.Api.Admin.Controllers.Systems;

[ControllerDescriptor(MenuId = "请设置菜单Id 系统菜单表中查找", DisplayName = "数据权限")]
public class SysDataAuthorityController : AdminControllerBase<SysDataAuthorityService>
{
    public SysDataAuthorityController(SysDataAuthorityService defaultService)
        : base(defaultService)
    {

    }


    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    [ApiResourceCacheFilter(1)]
    [ActionDescriptor(PermissionFunctionConsts.Function_Display, DisplayName = "查看列表")]
    [HttpPost]
    public async Task<PagingView> FindListAsync([FromBody] PagingSearchInput<SysDataAuthority> pagingSearchInput)
    {
        return await _defaultService.FindListAsync(pagingSearchInput);
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids">ids</param>
    /// <returns></returns>
    [ActionDescriptor(PermissionFunctionConsts.Function_Delete, DisplayName = "删除数据")]
    [HttpPost]
    public async Task<bool> DeleteListAsync([FromBody] List<Guid> ids)
    {
        await _defaultService.DeleteListAsync(ids);
        return true;
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id">id</param>
    /// <returns></returns>
    [ActionDescriptor(PermissionFunctionConsts.Function_Display, DisplayName = "查看表单")]
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
    public Task CreateAsync([FromBody] SysDataAuthorityFormDto form)
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
    public Task UpdateAsync([FromBody] SysDataAuthorityFormDto form)
    {
        return _defaultService.SaveFormAsync(form);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    [ApiResourceCacheFilter(5)]
    [ActionDescriptor(PermissionFunctionConsts.Function_Export, DisplayName = "导出数据")]
    [HttpPost]
    public async Task ExportExcelAsync([FromBody] PagingSearchInput<SysDataAuthority> pagingSearchInput)
    => HttpContext.DownLoadFile(await _defaultService.ExportExcelAsync(pagingSearchInput), Tools.GetFileContentType[".xls"].ToStr(),
        $"{PermissionUtil.GetControllerDisplayName(GetType())}列表数据 {DateTime.Now.ToString("yyyy-MM-dd")}.xls");

    /// <summary>
    /// 根据角色id获取数据权限信息
    /// </summary>
    /// <param name="roleId"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "获取数据权限信息")]
    [ApiResourceCacheFilter(10)]
    [HttpGet("{roleId?}")]
    public Task<Dictionary<string, object>> GetDataAuthorityByRoleIdAsync([FromRoute] Guid roleId)
    {
        return _defaultService.GetDataAuthorityByRoleIdAsync(roleId);
    }


}