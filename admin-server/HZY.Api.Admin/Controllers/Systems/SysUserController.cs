namespace HZY.Api.Admin.Controllers.Systems;

/// <summary>
/// 系统账号管理
/// </summary>
[ControllerDescriptor(MenuId = "15", DisplayName = "系统账号")]
public class SysUserController : AdminControllerBase<SysUserService>
{

    public SysUserController(SysUserService defaultService)
        : base(defaultService)
    {

    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    [ActionDescriptor(PermissionFunctionConsts.Function_Display, DisplayName = "查看数据")]
    [HttpPost]
    public Task<PagingView> FindListAsync([FromBody] PagingSearchInput<SysUser> pagingSearchInput)
    {
        return _defaultService.FindListAsync(pagingSearchInput);
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
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
    public Task CreateAsync([FromBody] SysUserFormDto form)
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
    public Task UpdateAsync([FromBody] SysUserFormDto form)
    {
        return _defaultService.SaveFormAsync(form);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    [ActionDescriptor(PermissionFunctionConsts.Function_Export, DisplayName = "导出数据")]
    [ApiResourceCacheFilter(10)]
    [HttpPost]
    public async Task ExportExcelAsync([FromBody] PagingSearchInput<SysUser> pagingSearchInput)
    {
        var data = await _defaultService.ExportExcelAsync(pagingSearchInput);
        var name = $"{PermissionUtil.GetControllerDisplayName(GetType())}列表数据 {DateTime.Now.ToString("yyyy-MM-dd")}.xls";
        HttpContext.DownLoadFile(data, Tools.GetFileContentType[".xls"].ToStr(), name);
    }

    /// <summary>
    /// 获取用户信息
    /// </summary>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "获取当前用户信息")]
    [ApiResourceCacheFilter(20)]
    [HttpGet(Name = "info")]
    public Task<AccountContext> GetUserInfoAsync()
    {
        return _defaultService.GetUserInfoAsync();
    }

}