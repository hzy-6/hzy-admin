namespace HZY.Api.Admin.ApplicationServices.Bases;

/// <summary>
/// 会员服务
/// </summary>
public class MemberService : ApplicationService<IRepository<Member>>
{
    private readonly IRepository<SysUser> _sysUserRepository;
    private readonly IAccountService _accountService;

    public MemberService(IRepository<Member> defaultRepository,
        IRepository<SysUser> sysUserRepository,
        IAccountService accountService)
        : base(defaultRepository)
    {
        _sysUserRepository = sysUserRepository;
        _accountService = accountService;
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(PagingSearchInput<Member> pagingSearchInput)
    {
        var accountInfo = _accountService.GetAccountContext();

        var query = (
                    from member in _defaultRepository.Select
                    from user in _sysUserRepository.Select.Where(w => w.Id == member.UserId).DefaultIfEmpty()
                    select new { t1 = member, t2 = user }
                )
                .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search.Name), w => w.t1.Name.Contains(pagingSearchInput.Search.Name))
                .OrderBy(w => w.t1.Number)
                .Select(w => new
                {
                    w.t1.Number,
                    w.t1.Photo,
                    w.t1.Name,
                    w.t1.Phone,
                    w.t1.Sex,
                    w.t1.Birthday,
                    OperatorName = w.t2.Name,
                    w.t1.LastModificationTime,
                    w.t1.CreationTime,
                    //别名 前面包含 _ 则表示界面上会隐藏列
                    _UserId = w.t1.UserId,
                    _OrganizationId = w.t2.OrganizationId,
                    w.t1.Id,
                })
            ;

        var result = await _defaultRepository.AsPagingViewAsync(query, pagingSearchInput, accountInfo, w => w._UserId, w => w._OrganizationId);

        // 覆盖值
        result
            .FormatValue(query, w => w.CreationTime, (oldValue) => oldValue.ToString("yyyy-MM-dd"))
            .FormatValue(query, w => w.LastModificationTime, (oldValue) => oldValue?.ToString("yyyy-MM-dd"))
            .FormatValue(query, w => w.Birthday, (oldValue) => oldValue.ToString("yyyy-MM-dd"))
            ;

        // 设置列
        //result.GetColumn(query, w => w.OperatorName).SetColumn("操作人");
        result.GetColumn(query, w => w.OperatorName!).SetColumn<SysUser>(w => w.Name!);

        return result;
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    public async Task DeleteListAsync(List<Guid> ids)
    {
        await _defaultRepository.DeleteByIdsAsync(ids);
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
        var sysUser = await _sysUserRepository.FindByIdAsync(form.UserId.ToGuid());
        sysUser = sysUser.NullSafe();

        res[nameof(id)] = id == Guid.Empty ? "" : id;
        res[nameof(form)] = form;
        res[nameof(sysUser)] = sysUser;
        return res;
    }

    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    public async Task SaveFormAsync(Member form)
    {
        await _defaultRepository.InsertOrUpdateAsync(form);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(PagingSearchInput<Member> pagingSearchInput)
    {
        pagingSearchInput.Page = -1;
        var tableViewModel = await FindListAsync(pagingSearchInput);
        return ExcelUtil.ExportExcelByPagingView(tableViewModel);
    }
}