namespace HZY.Shared.Models.PagingViews;

/// <summary>
/// 列头信息
/// </summary>
public class TableColumnView
{
    public TableColumnView()
    {
    }

    public TableColumnView(string fieldName, string title)
    {
        FieldName = fieldName;
        Title = title;
        Show = !fieldName.StartsWith("_");
    }

    public TableColumnView(string fieldName, string title, int width)
    {
        FieldName = fieldName;
        Title = title;
        Show = !fieldName.StartsWith("_");
        Width = width.ToString();
    }

    public TableColumnView(string fieldName, string title, bool show, int width)
    {
        FieldName = fieldName;
        Title = title;
        Show = show;
        Width = width.ToString();
    }

    /// <summary>
    /// 字段名称
    /// </summary>
    [JsonProperty("dataIndex")]
    public string FieldName { get; set; }

    /// <summary>
    /// 标题名称
    /// </summary>
    public string Title { get; set; }

    /// <summary>
    /// 是否显示
    /// </summary>
    public bool Show { get; set; } = true;

    /// <summary>
    /// 列宽度
    /// </summary>
    public string Width { get; set; } = string.Empty;

    /// <summary>
    /// 是否参加排序
    /// </summary>
    public bool Sorter { get; set; } = true;

    /// <summary>
    /// 映射字段
    /// </summary>
    /// <param name="title">列显示名称</param>
    /// <param name="show">是否显示列</param>
    /// <param name="width">列宽</param>
    /// <param name="sort">是否参加排序</param>
    public void SetColumn(string title = null, bool? show = null, string width = null, bool sort = true)
    {
        if (!string.IsNullOrWhiteSpace(title)) Title = title;
        if (show != null) Show = show.Value;
        if (!string.IsNullOrWhiteSpace(width)) Width = width;
        Sorter = sort;
    }

    /// <summary>
    /// 设置列信息 用于外键表列头得显示名称
    /// </summary>
    /// <typeparam name="TEntity"></typeparam>
    /// <param name="field"></param>
    /// <param name="show"></param>
    /// <param name="width"></param>
    /// <param name="sort"></param>
    /// <returns></returns>
    public TableColumnView SetColumn<TEntity>(Expression<Func<TEntity, object>> field, bool? show = null, string? width = null, bool sort = true)
    {
        // 设置列显示名称
        using var scope = App.CreateScope();
        var databaseTableService = scope.ServiceProvider.GetService<IDatabaseTableService>();

        if (databaseTableService == null) return this;

        var genDbTableDtos = databaseTableService!.GetAllTablesByCache();

        if (genDbTableDtos == null) return this;

        if (genDbTableDtos.Count == 0) return this;

        //自动获取名称对应的显示名
        var type = typeof(TEntity);
        var name = Tools.GetNameByExpression(field);

        var table = genDbTableDtos?
        .Where(w => w.EntityName.ToLower() == type.Name.ToLower())
        .FirstOrDefault();

        if (table == null) return this;

        var tableInfo = table.TableInfos.FirstOrDefault(w => w.CsField.ToLower() == name.ToLower());

        if (tableInfo == null) return this;

        this.SetColumn(tableInfo?.DisplayName, show, width, sort);

        return this;
    }

}