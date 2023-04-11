namespace HZY.Api.Admin.Controllers.Systems;

/// <summary>
/// 数据字典控制器
/// </summary>
[ControllerDescriptor(MenuId = "23", DisplayName = "数据字典")]
public class SysDictionaryController : AdminControllerBase<SysDictionaryService>
{
    public SysDictionaryController(SysDictionaryService defaultService) : base(defaultService)
    {

    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看列表")]
    [HttpPost]
    public async Task<List<SysDictionaryDto>> FindListAsync([FromBody] SysDictionary search)
    {
        return await _defaultService.FindListAsync(search);
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
    public Task CreateAsync([FromBody] SysDictionary form)
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
    public Task UpdateAsync([FromBody] SysDictionary form)
    {
        return _defaultService.SaveFormAsync(form);
    }

    /// <summary>
    /// 获取字典树
    /// </summary>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "获取字典树")]
    [HttpGet()]
    public async Task<List<SysDictionaryDto>> GetDictionaryTreeAsync()
    {
        return await _defaultService.GetDictionaryTreeAsync();
    }

    /// <summary>
    /// 根据编码获取 字典集合
    /// </summary>
    /// <param name="code"></param>
    /// <returns></returns>
    [HttpGet("{code}")]
    public Task<List<SysDictionaryDto>> GetDictionaryByCodeAsync([FromRoute] string code)
    {
        return _defaultService.GetDictionaryByCodeAsync(code);
    }

}