namespace HZY.Api.Admin.ApplicationServices.Systems;

/// <summary>
/// 服务 SysDataAuthorityCustomService
/// </summary>
public class SysDataAuthorityCustomService : ApplicationService<IRepository<SysDataAuthorityCustom>>
{
    public SysDataAuthorityCustomService(IRepository<SysDataAuthorityCustom> defaultRepository)
        : base(defaultRepository)
    {

    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="pagingSearchInput">page</param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(PagingSearchInput<SysDataAuthorityCustom> pagingSearchInput)
    {
        var query = _defaultRepository.Select
                .OrderByDescending(w => w.CreationTime)
                .Select(w => new
                {
                    w.SysDataAuthorityId,
                    w.SysOrganizationId,
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
    public async Task SaveFormAsync(SysDataAuthorityCustom form)
    {
        await _defaultRepository.InsertOrUpdateAsync(form);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(PagingSearchInput<SysDataAuthorityCustom> pagingSearchInput)
    {
        pagingSearchInput.Page = -1;
        var tableViewModel = await FindListAsync(pagingSearchInput);
        return ExcelUtil.ExportExcelByPagingView(tableViewModel, null, "Id");
    }



}