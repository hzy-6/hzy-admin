namespace HZY.Api.Admin.Controllers.Bases;

/// <summary>
/// 会员控制器
/// </summary>
[ControllerDescriptor(MenuId = "13", DisplayName = "会员")]
public class MemberController : AdminControllerBase<MemberService>
{
    public MemberController(MemberService defaultService) : base(defaultService)
    {

    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    [RequestLimitFilter(LimitCount = 3)]
    [ApiResourceCacheFilter(1)]
    [ActionDescriptor(PermissionFunctionConsts.Function_Display, DisplayName = "查看列表")]
    [HttpPost]
    public async Task<PagingView> FindListAsync([FromBody] PagingSearchInput<Member> pagingSearchInput)
    {
        return await _defaultService.FindListAsync(pagingSearchInput);
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
    [ActionDescriptor(PermissionFunctionConsts.Function_Display, DisplayName = "查看表单")]
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
    public Task CreateAsync([FromBody] Member form)
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
    public Task UpdateAsync([FromBody] Member form)
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
    public async Task ExportExcelAsync([FromBody] PagingSearchInput<Member> pagingSearchInput)
    {
        var data = await _defaultService.ExportExcelAsync(pagingSearchInput);
        var name = $"{PermissionUtil.GetControllerDisplayName(GetType())}列表数据 {DateTime.Now.ToString("yyyy-MM-dd")}.xls";
        HttpContext.DownLoadFile(data, Tools.GetFileContentType[".xls"].ToStr(), name);
    }
}