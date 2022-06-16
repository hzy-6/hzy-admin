using System.Linq.Expressions;
using HZY.EFCore.Repositories.Admin.DevelopmentTool;
using HZY.Infrastructure;
using HzyScanDiService;
using Microsoft.Extensions.DependencyInjection;

namespace HZY.EFCore.PagingViews;

/// <summary>
/// 列头信息
/// </summary>
public class TableColumnView
{
    public TableColumnView(string fieldName, string title)
    {
        this.FieldName = fieldName;
        this.Title = title;
        if (fieldName.ToLower() == "Id".ToLower())
        {
            this.Show = false;
        }
        else
        {
            this.Show = !fieldName.StartsWith("_");
        }
    }

    public TableColumnView(string fieldName, string title, int width)
    {
        this.FieldName = fieldName;
        this.Title = title;
        if (fieldName.ToLower() == "Id".ToLower())
        {
            this.Show = false;
        }
        else
        {
            this.Show = !fieldName.StartsWith("_");
        }

        this.Width = width.ToString();
    }

    public TableColumnView(string fieldName, string title, bool show, int width)
    {
        this.FieldName = fieldName;
        this.Title = title;
        this.Show = show;
        this.Width = width.ToString();
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
    /// 映射字段
    /// </summary>
    /// <param name="title"></param>
    /// <param name="show"></param>
    /// <param name="width"></param>
    public void Mapping(string title, bool? show = null, string width = null)
    {
        if (!string.IsNullOrWhiteSpace(title)) this.Title = title;
        if (show != null) this.Show = show.Value;
        if (!string.IsNullOrWhiteSpace(width)) this.Width = width;
    }

    /// <summary>
    ///  映射字段 用于映射字段设置显示名称
    /// </summary>
    /// <param name="field"></param>
    /// <param name="show"></param>
    /// <param name="width"></param>
    /// <typeparam name="T"></typeparam>
    public void Mapping<T>(Expression<Func<T, object>> field = null, bool? show = null, string width = null)
    {
        //自动获取名称对应的显示名
        var type = typeof(T);
        var name = Tools.GetNameByExpression(field);
        using var scope = IOCUtil.CreateScope();
        var _databaseTablesRepository = scope.ServiceProvider.GetService<DatabaseTablesRepository>();
        var allTables = _databaseTablesRepository.GetAllTablesByCache();
        var table = allTables?
        .Where(w => w.EntityName.ToLower() == type.Name.ToLower())
        .FirstOrDefault();
        var tableInfo = table.TableInfos.FirstOrDefault(w => w.CsField.ToLower() == name.ToLower());
        this.Mapping(tableInfo?.DisplayName, show, width);
    }

}