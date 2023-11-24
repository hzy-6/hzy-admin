namespace HZY.Api.Admin.ApplicationServices.DevelopmentTools.LowCode.Impl;

/// <summary>
/// 服务 Low_Code_Table_InfoService
/// </summary>
public class LowCodeTableInfoService : ApplicationService<IRepository<LowCodeTableInfo>>
{
    private readonly IDatabaseTableService _databaseTableService;
    private readonly IRepository<LowCodeTable> _lowCodeTableRepository;

    public LowCodeTableInfoService(
        IDatabaseTableService databaseTableService,
        IRepository<LowCodeTableInfo> defaultRepository,
        IRepository<LowCodeTable> lowCodeTableRepository) : base(defaultRepository)
    {
        _databaseTableService = databaseTableService;
        _lowCodeTableRepository = lowCodeTableRepository;
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(PagingSearchInput<LowCodeTableInfo> pagingSearchInput)
    {
        var query = _defaultRepository.SelectNoTracking
                .WhereIf(pagingSearchInput.Search.Low_Code_TableId != Guid.Empty, w => w.Low_Code_TableId == pagingSearchInput.Search.Low_Code_TableId)
                .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search.ColumnName), w => w.ColumnName.Contains(pagingSearchInput.Search.ColumnName))
                .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search.Describe), w => w.Describe.Contains(pagingSearchInput.Search.Describe))
                .OrderBy(w => w.Position)
                .ThenByDescending(w => w.CreationTime)
                .Select(w => new
                {
                    w.Id,
                    w.IsPrimary,
                    w.IsIdentity,
                    w.IsNullable,
                    w.Position,
                    w.ColumnName,
                    w.Describe,
                    w.DatabaseColumnType,
                    w.CsType,
                    w.CsField,
                    w.DisplayName,
                    w.Low_Code_TableId,
                    w.LastModificationTime,
                    w.CreationTime,
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
    public Task DeleteListAsync(List<Guid> ids)
    {
        _databaseTableService.ClearAllTablesByCache();
        return _defaultRepository.DeleteByIdsAsync(ids);
    }

    /// <summary>
    /// 根据表名同步列数据
    /// </summary>
    /// <param name="tableId"></param>
    /// <param name="isTableSync">是否来自表格同步</param>
    /// <returns></returns>
    public async Task SynchronizationColumnByTableIdAsync(Guid tableId, bool isTableSync = false)
    {
        var allTables = _databaseTableService.GetAllTableInfos();
        var table = await _lowCodeTableRepository.FindAsync(w => w.Id == tableId);
        var tableInfo = allTables.Find(w => w.Name == table.TableName);

        //查询出当前表所有的字段
        var tableColumns = await _defaultRepository.ToListAsync(w => w.Low_Code_TableId == table.Id);

        //操作集合
        var list = new List<LowCodeTableInfo>();

        if (isTableSync)
        {
            if (tableColumns != null && tableColumns.Count == 0)
            {
                foreach (var item in tableInfo.Columns)
                {
                    // if (tableColumns.Any(w => w.ColumnName == item.Name)) continue;

                    var model = new LowCodeTableInfo();
                    model.IsPrimary = item.IsPrimary;
                    model.IsIdentity = item.IsIdentity;
                    model.IsNullable = item.IsNullable;
                    model.Position = item.Position;
                    model.Low_Code_TableId = table.Id;
                    model.ColumnName = item.Name;
                    model.DatabaseColumnType = item.DbTypeTextFull;
                    model.CsType = item.CsType.Name;
                    model.CsField = item.Name;
                    model.MaxLength = item.MaxLength;
                    if (!string.IsNullOrWhiteSpace(item.Comment))
                    {
                        model.Describe = item.Comment;
                        model.DisplayName = item.Comment;
                    }
                    list.Add(model);
                }
            }
        }
        else
        {
            await _defaultRepository.DeleteAsync(w => w.Low_Code_TableId == table.Id);

            foreach (var item in tableInfo.Columns)
            {
                // if (tableColumns.Any(w => w.ColumnName == item.Name)) continue;

                var model = new LowCodeTableInfo();
                model.IsPrimary = item.IsPrimary;
                model.IsIdentity = item.IsIdentity;
                model.IsNullable = item.IsNullable;
                model.Position = item.Position;
                model.Low_Code_TableId = table.Id;
                model.ColumnName = item.Name;
                model.DatabaseColumnType = item.DbTypeTextFull;
                model.CsType = item.CsType.Name;
                model.CsField = item.Name;
                model.MaxLength = item.MaxLength;
                if (!string.IsNullOrWhiteSpace(item.Comment))
                {
                    model.Describe = item.Comment;
                    model.DisplayName = item.Comment;
                }
                list.Add(model);
            }
        }

        await _defaultRepository.InsertRangeAsync(list);

        _databaseTableService.ClearAllTablesByCache();
    }

    /// <summary>
    /// 变更数据
    /// </summary>
    /// <param name="lowCodeTableInfos"></param>
    /// <returns></returns>
    public Task ChangeAsync(List<LowCodeTableInfo> lowCodeTableInfos)
    {
        _databaseTableService.ClearAllTablesByCache();
        return _defaultRepository.UpdateRangeAsync(lowCodeTableInfos);
    }



}