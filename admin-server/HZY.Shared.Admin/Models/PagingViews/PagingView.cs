namespace HZY.Shared.Admin.Models.PagingViews;

/// <summary>
/// 分页视图模型
/// </summary>
public class PagingView
{
    /// <summary>
    /// 列信息
    /// </summary>
    public List<TableColumnView> Columns { get; set; } = new List<TableColumnView>();

    /// <summary>
    /// 转换后数据
    /// </summary>
    public List<Dictionary<string, object?>> DataSource { get; set; } = new List<Dictionary<string, object?>>();

    /// <summary>
    /// 总数
    /// </summary>
    public long Total { get; set; }

    /// <summary>
    /// 总页数
    /// </summary>
    public long PageCount { get; set; }

    /// <summary>
    /// 一页显示多少条
    /// </summary>
    public int Size { get; set; }

    /// <summary>
    /// 页码
    /// </summary>
    public int Page { get; set; }

    /// <summary>
    /// 初始化
    /// </summary>
    /// <param name="page"></param>
    /// <param name="size"></param>
    public PagingView(int page, int size)
    {
        Page = page;
        Size = size;
    }

    /// <summary>
    /// 创建 PagingView 对象
    /// </summary>
    /// <param name="page"></param>
    /// <param name="size"></param>
    /// <returns></returns>
    public static PagingView Create(int page, int size)
    {
        var pagingView = new PagingView(page, size);
        return pagingView;
    }

    /// <summary>
    /// 仓储主表实体类型
    /// </summary>
    private Type? _mainTableEntityType;

    /// <summary>
    /// 主表实体类型
    /// </summary>
    [JsonIgnore]
    public Type? MainTableEntityType => _mainTableEntityType;

    /// <summary>
    /// 创建数据源
    /// </summary>
    /// <typeparam name="TEntity"></typeparam>
    /// <param name="data"></param>
    /// <param name="mainTableEntityType"></param>
    public void BuilderDataSource<TEntity>(List<TEntity> data, Type mainTableEntityType)
    {
        _mainTableEntityType = mainTableEntityType;
        var propertyInfos = typeof(TEntity).GetProperties();
        var fieldNames = propertyInfos.Select(item => item.Name).ToList();

        var result = new List<Dictionary<string, object?>>();
        foreach (var item in data)
        {
            var type = item!.GetType();
            var dictionary = new Dictionary<string, object?>();

            foreach (var fieldName in fieldNames)
            {
                dictionary[fieldName] = type?.GetProperty(fieldName)?.GetValue(item);
            }

            result.Add(dictionary);
        }

        DataSource = result;

        foreach (var item in fieldNames)
        {
            if (item.StartsWith("_")) continue;
            Columns.Add(new TableColumnView(item.ToFirstCharConvertLower(), item));
        }
    }

    /// <summary>
    /// 创建数据源 根据 datatable
    /// </summary>
    /// <param name="data"></param>
    /// <param name="mainTableEntityType"></param>
    public void BuilderDataSourceByDataTable(DataTable data, Type mainTableEntityType)
    {
        _mainTableEntityType = mainTableEntityType;

        var fieldNames = (from DataColumn dc in data.Columns select dc.ColumnName).ToList();

        var result = new List<Dictionary<string, object>>();
        foreach (DataRow dr in data.Rows)
        {
            var dictionary = new Dictionary<string, object>();
            foreach (DataColumn dc in data.Columns)
            {
                dictionary.Add(dc.ColumnName, dr[dc.ColumnName]);
            }

            result.Add(dictionary);
        }

        DataSource = result;

        foreach (var item in fieldNames)
        {
            if (item.StartsWith("_")) continue;
            Columns.Add(new TableColumnView(item.ToFirstCharConvertLower(), item));
        }
    }

    /// <summary>
    /// 获取指定列
    /// </summary>
    /// <param name="query"></param>
    /// <param name="queryField"></param>
    /// <typeparam name="TQuery"></typeparam>
    /// <returns></returns>
    public TableColumnView GetColumn<TQuery>(IQueryable<TQuery> query, Expression<Func<TQuery, object>> queryField)
    {
        var nameQuery = Tools.GetNameByExpression(queryField);
        var TableColumnView = Columns
        .Where(w => w.FieldName.ToLower() == nameQuery.ToLower())
        .FirstOrDefault();

        return TableColumnView!;
    }

    /// <summary>
    /// 格式化值
    /// </summary>
    /// <typeparam name="TQuery"></typeparam>
    /// <typeparam name="TValue"></typeparam>
    /// <param name="query"></param>
    /// <param name="queryField"></param>
    /// <param name="funcValue"></param>
    public PagingView FormatValue<TQuery, TValue>(IQueryable<TQuery> query, Expression<Func<TQuery, TValue>> queryField, Func<TValue?, object?> funcValue)
    {
        var nameQuery = Tools.GetNameByExpression(queryField);
        foreach (var item in DataSource.Where(w => w.ContainsKey(nameQuery)))
        {
            var value = item[nameQuery];
            item[nameQuery] = funcValue?.Invoke(value == null ? default : (TValue)value ?? default);
        }
        return this;
    }

    /// <summary>
    /// 设置列显示名称
    /// </summary>
    /// <returns></returns>
    public PagingView SetColumnDisplayName()
    {
        // 设置列显示名称
        using var scope = App.CreateScope();
        var databaseTableService = scope.ServiceProvider.GetService<IDatabaseTableService>();

        if (databaseTableService == null) return this;

        var genDbTableDtos = databaseTableService!.GetAllTablesByCache();

        if (genDbTableDtos == null) return this;

        if (genDbTableDtos.Count == 0) return this;

        var table = genDbTableDtos?
          .Where(w => w.EntityName.ToLower() == MainTableEntityType.Name.ToLower())
          .FirstOrDefault();

        if (table == null) return this;

        foreach (var column in Columns)
        {
            var fieldName = column.FieldName.ToLower();
            var tableInfo = table?.TableInfos?.FirstOrDefault(w => w.ColumnName.ToLower() == fieldName);
            column.Title = string.IsNullOrWhiteSpace(tableInfo?.DisplayName) ? fieldName : tableInfo.DisplayName;
        }

        return this;
    }

}