namespace HZY.Api.Admin.ApplicationServices.DevelopmentTools.LowCode.Impl;

/// <summary>
/// 数据库表服务
/// </summary>
public class DatabaseTableService : IDatabaseTableService
{
    private readonly string TableInfoKey = "TableInfo:GenDbTableDto";
    private readonly int CacheTime = 12;

    private readonly IFreeSql _freeSql;
    private readonly IMemoryCache _memoryCache;
    private readonly IRepository<LowCodeTable> _lowCodeTableRepository;
    private readonly IRepository<LowCodeTableInfo> _lowCodeTableInfoRepository;

    /// <summary>
    /// 
    /// </summary>
    /// <param name="freeSql"></param>
    /// <param name="memoryCache"></param>
    /// <param name="lowCodeTableRepository"></param>
    /// <param name="lowCodeTableInfoRepository"></param>
    public DatabaseTableService(IFreeSql freeSql,
        IMemoryCache memoryCache,
        IRepository<LowCodeTable> lowCodeTableRepository,
        IRepository<LowCodeTableInfo> lowCodeTableInfoRepository)
    {
        _freeSql = freeSql;
        _memoryCache = memoryCache;
        _lowCodeTableRepository = lowCodeTableRepository;
        _lowCodeTableInfoRepository = lowCodeTableInfoRepository;
    }

    /// <summary>
    /// 获取所有的表 包含表下面的列
    /// </summary>
    /// <returns></returns>
    public virtual List<DbTableInfo> GetAllTableInfos() => _freeSql.DbFirst.GetTablesByDatabase();

    /// <summary>
    /// 获取所有的表 包含表下面的列
    /// </summary>
    /// <returns></returns>
    public virtual List<GenDbTableDto> GetAllTables()
    {
        var tables = _lowCodeTableRepository.ToListAll();
        var tableColumns = _lowCodeTableInfoRepository.ToListAll();

        var result = new List<GenDbTableDto>();
        foreach (var item in tables)
        {
            var table = item.MapTo<LowCodeTable, GenDbTableDto>();
            table.TableInfos = tableColumns.Where(w => w.Low_Code_TableId == item.Id).ToList();
            result.Add(table);
        }

        _memoryCache.Set(TableInfoKey, result, DateTime.Now.AddHours(CacheTime));

        return result;
    }

    /// <summary>
    /// 获取表信息根据缓存
    /// </summary>
    /// <returns></returns>
    public List<GenDbTableDto> GetAllTablesByCache() => _memoryCache.Get<List<GenDbTableDto>>(TableInfoKey) ?? GetAllTables();

    /// <summary>
    /// 清空所有表缓存信息
    /// </summary>
    /// <returns></returns>
    public bool ClearAllTablesByCache()
    {
        _memoryCache.Remove(TableInfoKey);
        return true;
    }

    /// <summary>
    /// 获取数据库名称
    /// </summary>
    /// <returns></returns>
    public string? GetDatabaseName() => _lowCodeTableRepository.GetContext()?.Database.GetDbConnection().Database;


}
