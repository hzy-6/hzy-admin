namespace HZY.Shared.Admin.ApplicationServices;

/// <summary>
/// 
/// </summary>
public interface IDatabaseTableService : IScopedDependency
{
    /// <summary>
    /// 获取所有的表 包含表下面的列
    /// </summary>
    /// <returns></returns>
    public List<FreeSql.DatabaseModel.DbTableInfo> GetAllTableInfos() => default;

    /// <summary>
    /// 获取所有的表 包含表下面的列
    /// </summary>
    /// <returns></returns>
    public List<GenDbTableDto> GetAllTables();

    /// <summary>
    /// 获取表信息根据缓存
    /// </summary>
    /// <returns></returns>
    public List<GenDbTableDto> GetAllTablesByCache() => default;

    /// <summary>
    /// 清空所有表缓存信息
    /// </summary>
    /// <returns></returns>
    public bool ClearAllTablesByCache();

    /// <summary>
    /// 获取数据库名称
    /// </summary>
    /// <returns></returns>
    public string? GetDatabaseName() => default;


}
