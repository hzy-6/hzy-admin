namespace HZY.Api.Admin.Controllers.Systems;

/// <summary>
/// 组织机构控制器
/// </summary>
[ControllerDescriptor(MenuId = "21", DisplayName = "组织机构")]
public class SysOrganizationController : AdminControllerBase<SysOrganizationService>
{
    private readonly IRepository<SysOrganization> _sysOrganizationRepository;

    public SysOrganizationController(SysOrganizationService defaultService, IRepository<SysOrganization> sysOrganizationRepository)
        : base(defaultService)
    {
        _sysOrganizationRepository = sysOrganizationRepository;
    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看列表")]
    [HttpPost]
    public async Task<List<SysOrganization>> FindListAsync([FromBody] SysOrganization search)
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
    /// <param name="parentId"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看表单")]
    [HttpGet("{id?}/{parentId?}")]
    public async Task<Dictionary<string, object>> FindFormAsync([FromRoute] int id, int parentId)
    {
        return await _defaultService.FindFormAsync(id, parentId);
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
    public Task CreateAsync([FromBody] SysOrganization form)
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
    public Task UpdateAsync([FromBody] SysOrganization form)
    {
        return _defaultService.SaveFormAsync(form);
    }

    /// <summary>
    /// 获取组织架构树
    /// </summary>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看组织架构树")]
    [HttpPost]
    public async Task<dynamic> GetSysOrganizationTreeAsync()
    {
        var expandedRowKeys = new List<int>();
        var data = await _defaultService.GetSysOrganizationTreeAsync(expandedRowKeys, null, null);

        return new
        {
            expandedRowKeys,
            allKeys = await _sysOrganizationRepository.Select.OrderBy(w => w.OrderNumber).Select(w => w.Id).ToListAsync(),
            rows = await _defaultService.GetSysOrganizationTreeAsync(data)
        };
    }




}