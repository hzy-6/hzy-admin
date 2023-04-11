namespace HZY.Repository.EntityFramework.Admin.Models.PagingViews;

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
        if (fieldName.ToLower() == "Id".ToLower())
        {
            Show = false;
        }
        else
        {
            Show = !fieldName.StartsWith("_");
        }
    }

    public TableColumnView(string fieldName, string title, int width)
    {
        FieldName = fieldName;
        Title = title;
        if (fieldName.ToLower() == "Id".ToLower())
        {
            Show = false;
        }
        else
        {
            Show = !fieldName.StartsWith("_");
        }

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
    public bool Sort { get; set; } = true;

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
        Sort = sort;
    }

}