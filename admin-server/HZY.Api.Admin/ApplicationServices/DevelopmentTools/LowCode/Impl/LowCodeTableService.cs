namespace HZY.Api.Admin.ApplicationServices.DevelopmentTools.LowCode.Impl;

/// <summary>
/// 服务 Low_Code_TableService
/// </summary>
public class LowCodeTableService : ApplicationService<IRepository<LowCodeTable>>
{
    private readonly IRepository<LowCodeTableInfo> _lowCodeTableInfoRepository;
    private readonly LowCodeTableInfoService _lowCodeTableInfoService;
    private readonly IDatabaseTableService _databaseTableService;
    private readonly ICodeGenerationService _codeGenerationService;

    public LowCodeTableService(IRepository<LowCodeTable> defaultRepository,
        LowCodeTableInfoService lowCodeTableInfoService,
        IRepository<LowCodeTableInfo> lowCodeTableInfoRepository,
        IDatabaseTableService databaseTableService,
        ICodeGenerationService codeGenerationService) : base(defaultRepository)
    {
        _lowCodeTableInfoService = lowCodeTableInfoService;
        _lowCodeTableInfoRepository = lowCodeTableInfoRepository;
        _databaseTableService = databaseTableService;
        _codeGenerationService = codeGenerationService;
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(PagingSearchInput<LowCodeTable> pagingSearchInput)
    {
        var query = _defaultRepository.SelectNoTracking
                .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search.TableName),
                    w => w.TableName.Contains(pagingSearchInput.Search.TableName))
                .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search.EntityName),
                    w => w.EntityName.Contains(pagingSearchInput.Search.EntityName))
                .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search.DisplayName),
                    w => w.DisplayName.Contains(pagingSearchInput.Search.DisplayName))
                .OrderByDescending(w => w.CreationTime)
                .ThenByDescending(w => w.LastModificationTime)
                .Select(w => new
                {
                    w.Id,
                    w.TableName,
                    w.DisplayName,
                    w.EntityName,
                    w.Remark,
                    w.LastModificationTime,
                    w.CreationTime,
                })
            ;

        //获取一下数据用于缓存
        _databaseTableService.GetAllTables();

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
        _databaseTableService.ClearAllTablesByCache();
        //删除子表
        //await this._lowCodeTableInfoRepository.DeleteBulkAsync(w => ids.Contains(w.Low_Code_TableId));
        await _lowCodeTableInfoRepository.DeleteAsync(w => ids.Contains(w.Low_Code_TableId));
        //删除主表
        await _defaultRepository.DeleteByIdsAsync(ids);
    }

    /// <summary>
    /// 同步表
    /// </summary>
    public async Task SynchronizationAsync()
    {
        var allTables = _databaseTableService.GetAllTableInfos();
        var oldAllTables = await _defaultRepository.ToListAllAsync();

        #region 同步表

        var insertList = new List<LowCodeTable>();
        var updateList = new List<LowCodeTable>();
        var ids = new List<Guid>();
        foreach (var item in allTables)
        {
            var table = oldAllTables.Find(w => w.TableName == item.Name);
            var id = Guid.NewGuid();
            if (table == null)
            {
                var lowCodeTable = new LowCodeTable
                {
                    Id = id,
                    DisplayName = item.Comment,
                    TableName = item.Name,
                    EntityName = item.Name.ToLineConvertHump()
                };
                insertList.Add(lowCodeTable);
            }
            else
            {
                id = table.Id;
                updateList.Add(table);
            }

            ids.Add(id);
        }

        if (insertList.Count > 0)
        {
            await _defaultRepository.InsertRangeAsync(insertList);
        }

        if (updateList.Count > 0)
        {
            await _defaultRepository.UpdateRangeAsync(updateList);
        }

        foreach (var item in ids)
        {
            await _lowCodeTableInfoService.SynchronizationColumnByTableIdAsync(item, true);
        }

        _databaseTableService.ClearAllTablesByCache();

        #endregion
    }

    /// <summary>
    /// 变更数据
    /// </summary>
    /// <param name="lowCodeTables"></param>
    /// <returns></returns>
    public async Task ChangeAsync(List<LowCodeTable> lowCodeTables)
    {
        _databaseTableService.ClearAllTablesByCache();
        var oldLowCodeTables =
            await _defaultRepository.ToListAsync(w => lowCodeTables.Select(w => w.Id).Contains(w.Id));
        var updateList = new List<LowCodeTable>();
        foreach (var item in lowCodeTables)
        {
            var lowCodeTable = oldLowCodeTables.Find(w => w.Id == item.Id);
            lowCodeTable.DisplayName = item.DisplayName;
            lowCodeTable.EntityName = item.EntityName;
            lowCodeTable.Remark = item.Remark;
            updateList.Add(lowCodeTable);
        }

        await _defaultRepository.UpdateRangeAsync(updateList);
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public async Task<Dictionary<string, object>> FindFormAsync(Guid id)
    {
        var res = new Dictionary<string, object>();
        var form = (await _defaultRepository.FindByIdAsync(id)).NullSafe();

        _codeGenerationService.FillPathByLowCodeTable(form);

        res[nameof(id)] = id == Guid.Empty ? "" : id;
        res[nameof(form)] = form;
        return res;
    }

    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [Transactional]
    public virtual async Task SaveFormAsync(LowCodeTable form)
    {
        await _defaultRepository.InsertOrUpdateAsync(form);
    }
}