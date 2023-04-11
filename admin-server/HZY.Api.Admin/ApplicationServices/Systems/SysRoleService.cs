using HZY.Shared.ApplicationServices.PagingViews;

namespace HZY.Api.Admin.ApplicationServices.Systems;

/// <summary>
/// 角色服务
/// </summary>
public class SysRoleService : ApplicationService<IRepository<SysRole>>
{
    private readonly IRepository<SysUserRole> _sysUserRoleRepository;
    private readonly IRepository<SysDataAuthority> _sysDataAuthorityRepository;
    private readonly IRepository<SysDataAuthorityCustom> _sysDataAuthorityCustomRepository;
    private readonly PagingViewService _pagingViewService;

    public SysRoleService(IRepository<SysRole> defaultRepository,
        IRepository<SysUserRole> sysUserRoleRepository,
        IRepository<SysDataAuthority> sysDataAuthorityRepository,
        IRepository<SysDataAuthorityCustom> sysDataAuthorityCustomRepository,
        PagingViewService pagingViewService) : base(defaultRepository)
    {
        _sysUserRoleRepository = sysUserRoleRepository;
        _sysDataAuthorityRepository = sysDataAuthorityRepository;
        _sysDataAuthorityCustomRepository = sysDataAuthorityCustomRepository;
        _pagingViewService = pagingViewService;
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(PagingSearchInput<SysRole> pagingSearchInput)
    {
        var query = (from sysRole in _defaultRepository.Select
                     from sysDataAuthority in _sysDataAuthorityRepository.Select
                     .Where(w => w.RoleId == sysRole.Id)
                     .DefaultIfEmpty()
                     select new
                     {
                         t1 = sysRole,
                         t2 = sysDataAuthority
                     })
                    .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search?.Name), a => a.t1.Name.Contains(pagingSearchInput.Search.Name))
                    .OrderBy(w => w.t1.Number)
                    .Select(w => new
                    {
                        w.t1.Id,
                        w.t1.Number,
                        w.t1.Name,
                        w.t1.Remark,
                        w.t1.DeleteLock,
                        PermissionType = w.t2 == null ? 0 : w.t2.PermissionType,
                        w.t1.LastModificationTime,
                        w.t1.CreationTime,
                    })
                    ;

        var result = await _defaultRepository.AsPagingViewAsync(query, pagingSearchInput);
        //覆盖值
        result
            .FormatValue(query, w => w.CreationTime, (oldValue) => oldValue.ToString("yyyy-MM-dd"))
            .FormatValue(query, w => w.LastModificationTime, (oldValue) => oldValue?.ToString("yyyy-MM-dd"))
            ;

        return _pagingViewService.BuilderColumns(result);
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    public async Task DeleteListAsync(List<Guid> ids)
    {
        foreach (var item in ids)
        {
            var role = await _defaultRepository.FindByIdAsync(item);
            if (role.DeleteLock) MessageBox.Show("该信息已被锁定不能删除！");
            await _defaultRepository.DeleteAsync(role);
            await _sysUserRoleRepository.DeleteAsync(w => w.RoleId == item);
            var list = await _sysDataAuthorityRepository.ToListAsync(w => w.RoleId == item);
            await _sysDataAuthorityCustomRepository.DeleteAsync(w => list.Select(w => w.Id).Contains(w.SysDataAuthorityId.Value));
            await _sysDataAuthorityRepository.DeleteAsync(list);
        }
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public async Task<Dictionary<string, object>> FindFormAsync(Guid id)
    {
        var res = new Dictionary<string, object>();
        var form = await _defaultRepository.FindByIdAsync(id);
        form = form.NullSafe();

        if (id == Guid.Empty)
        {
            var maxNum = await _defaultRepository.Select.MaxAsync(w => w.Number);
            form.Number = maxNum + 1;
        }

        res[nameof(id)] = id == Guid.Empty ? "" : id;
        res[nameof(form)] = form;
        return res;
    }

    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    public async Task SaveFormAsync(SysRole form)
    {
        await _defaultRepository.InsertOrUpdateAsync(form);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(PagingSearchInput<SysRole> pagingSearchInput)
    {
        pagingSearchInput.Page = -1;
        var tableViewModel = await FindListAsync(pagingSearchInput);
        return ExcelUtil.ExportExcelByPagingView(tableViewModel, null, "Id");
    }


}