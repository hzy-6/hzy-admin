namespace HZY.Api.Admin.ApplicationServices.Systems;

/// <summary>
/// 操作日服务
/// </summary>
public class SysOperationLogService : ApplicationService<IRepository<SysOperationLog>>
{
    private readonly IRepository<SysUser> _sysUserRepository;

    public SysOperationLogService(IRepository<SysOperationLog> defaultRepository,
          IRepository<SysUser> sysUserRepository)
        : base(defaultRepository)
    {
        _sysUserRepository = sysUserRepository;
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(PagingSearchInput<SysOperationLogSearchDto> pagingSearchInput)
    {
        var query = (from log in _defaultRepository.Select.OrderByDescending(w => w.CreationTime)
                     from use in _sysUserRepository.Select.Where(w => w.Id == log.UserId).DefaultIfEmpty()
                     select new { log, use })
                     .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search.Api), w => w.log.Api.Contains(pagingSearchInput.Search.Api))
                     .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search.Browser), w => w.log.Browser.Contains(pagingSearchInput.Search.Browser))
                     .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search.Ip), w => w.log.Ip.Contains(pagingSearchInput.Search.Ip))
                     .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search.OS), w => w.log.OS.Contains(pagingSearchInput.Search.OS))
                     .WhereIf(pagingSearchInput.Search.StartTime != null, w => w.log.CreationTime.Date >= pagingSearchInput.Search.StartTime.Value)
                     .WhereIf(pagingSearchInput.Search.EndTime != null, w => w.log.CreationTime.Date <= pagingSearchInput.Search.EndTime.Value)
                     .Select(w => new
                     {
                         w.log.Api,
                         w.log.Browser,
                         w.log.Ip,
                         w.log.OS,
                         w.log.TakeUpTime,
                         UserName = w.use.Name,
                         w.use.LoginName,
                         w.log.ControllerDisplayName,
                         w.log.ActionDisplayName,
                         w.log.CreationTime,
                         w.log.Id,
                     })
                     ;

        var result = await _defaultRepository.AsPagingViewAsync(query, pagingSearchInput);
        //覆盖值
        result
            .FormatValue(query, w => w.CreationTime, (oldValue) => oldValue.ToString("yyyy-MM-dd HH:mm:ss"))
            ;

        return result;
    }

    /// <summary>
    /// 删除所有数据
    /// </summary>
    /// <returns></returns>
    public async Task<bool> DeletedAllData()
    {
        return await _defaultRepository.DeleteAsync(w => 1 == 1) >= 0;
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
        var use = await _sysUserRepository.FindByIdAsync(form.UserId);
        use = use.NullSafe();
        res[nameof(id)] = id == Guid.Empty ? "" : id;
        res[nameof(form)] = form;
        res[nameof(use)] = use;
        return res;
    }

    /// <summary>
    /// 定时清理日志 保留一个月
    /// </summary>
    /// <returns></returns>
    [Scheduled("59 59 23 ? * *", Remark = "每天晚上 23：59：59 执行")]
    public async Task<bool> ClearLogAsync()
    {
        var now = DateTime.Now;
        await _defaultRepository.DeleteBulkAsync(w => w.CreationTime < now.AddMonths(-1));

        return true;
    }



}