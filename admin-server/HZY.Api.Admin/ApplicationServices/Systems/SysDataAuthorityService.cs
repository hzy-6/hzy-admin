namespace HZY.Api.Admin.ApplicationServices.Systems;

/// <summary>
/// 服务 SysDataAuthorityService
/// </summary>
public class SysDataAuthorityService : ApplicationService<IRepository<SysDataAuthority>>
{
    private readonly IRepository<SysDataAuthorityCustom> _sysDataAuthorityCustomRepository;

    public SysDataAuthorityService(IRepository<SysDataAuthority> defaultRepository,
    IRepository<SysDataAuthorityCustom> sysDataAuthorityCustomRepository)
        : base(defaultRepository)
    {
        _sysDataAuthorityCustomRepository = sysDataAuthorityCustomRepository;
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="pagingSearchInput">page</param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(PagingSearchInput<SysDataAuthority> pagingSearchInput)
    {
        var query = _defaultRepository.Select
                .OrderByDescending(w => w.CreationTime)
                .Select(w => new
                {
                    w.PermissionType,
                    w.RoleId,
                    w.LastModificationTime,
                    w.CreationTime,
                    w.Id,
                })
            ;

        var result = await _defaultRepository.AsPagingViewAsync(query, pagingSearchInput);
        //覆盖值
        result
            .FormatValue(query, w => w.CreationTime, (oldValue) => oldValue.ToString("yyyy-MM-dd"))
            .FormatValue(query, w => w.LastModificationTime, (oldValue) => oldValue?.ToString("yyyy-MM-dd"))
            ;

        return result;
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids">ids</param>
    /// <returns></returns>
    public async Task DeleteListAsync(List<Guid> ids)
    {
        await _defaultRepository.DeleteByIdsAsync(ids);
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id">id</param>
    /// <returns></returns>
    public async Task<Dictionary<string, object>> FindFormAsync(Guid id)
    {
        var res = new Dictionary<string, object>();
        var form = await _defaultRepository.FindByIdAsync(id);
        form = form.NullSafe();

        res[nameof(id)] = id == Guid.Empty ? "" : id;
        res[nameof(form)] = form;
        return res;
    }

    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form">form</param>
    /// <returns></returns>
    public async Task SaveFormAsync(SysDataAuthorityFormDto form)
    {
        var sysDataAuthority = await _defaultRepository.InsertOrUpdateAsync(form.SysDataAuthority);

        //删除集合 操作自定义数据权限
        await _sysDataAuthorityCustomRepository.DeleteAsync(w => w.SysDataAuthorityId == sysDataAuthority.Id);
        foreach (var item in form.SysDataAuthorityCustomList)
        {
            item.SysDataAuthorityId = sysDataAuthority.Id;
        }

        await _sysDataAuthorityCustomRepository.InsertRangeAsync(form.SysDataAuthorityCustomList);

    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(PagingSearchInput<SysDataAuthority> pagingSearchInput)
    {
        pagingSearchInput.Page = -1;
        var tableViewModel = await FindListAsync(pagingSearchInput);
        return ExcelUtil.ExportExcelByPagingView(tableViewModel, null, "Id");
    }

    /// <summary>
    /// 根据角色 id 获取数据权限
    /// </summary>
    /// <param name="roleId"></param>
    /// <returns></returns>
    public async Task<Dictionary<string, object>> GetDataAuthorityByRoleIdAsync(Guid roleId)
    {
        var result = new Dictionary<string, object>();

        var sysDataAuthority = await _defaultRepository.FindAsync(w => w.RoleId == roleId);
        sysDataAuthority = sysDataAuthority.NullSafe();
        var sysDataAuthorityCustomList = await _sysDataAuthorityCustomRepository.Select
        .Where(w => w.SysDataAuthorityId == sysDataAuthority.Id)
        .ToListAsync();

        result.Add("sysDataAuthority", sysDataAuthority);
        result.Add("sysDataAuthorityCustomList", sysDataAuthorityCustomList);
        return result;
    }


}