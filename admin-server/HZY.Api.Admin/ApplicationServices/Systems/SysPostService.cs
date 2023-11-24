namespace HZY.Api.Admin.ApplicationServices.Systems;

public class SysPostService : ApplicationService<IRepository<SysPost>>
{
    public SysPostService(IRepository<SysPost> defaultRepository) : base(defaultRepository)
    {

    }

    /// <summary>
    /// pagingSearchInput
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(PagingSearchInput<SysPost> pagingSearchInput)
    {
        var query = _defaultRepository.Select
                .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search?.Name), a => a.Name.Contains(pagingSearchInput.Search.Name))
                .OrderBy(w => w.Number)
                .Select(w => new
                {
                    w.Number,
                    w.Code,
                    w.Name,
                    //State = w.State == StateEnum.正常 ? "正常" : "停用",
                    w.State,
                    //State=w.State.ToString(),
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
    /// <param name="ids"></param>
    /// <returns></returns>
    public async Task DeleteListAsync(List<Guid> ids)
    {
        await _defaultRepository.DeleteAsync(w => ids.Contains(w.Id));
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
            form.Number = (maxNum ?? 0) + 1;
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
    public async Task SaveFormAsync(SysPost form)
    {
        await _defaultRepository.InsertOrUpdateAsync(form);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(PagingSearchInput<SysPost> pagingSearchInput)
    {
        pagingSearchInput.Page = -1;
        var tableViewModel = await FindListAsync(pagingSearchInput);
        return ExcelUtil.ExportExcelByPagingView(tableViewModel);
    }


}