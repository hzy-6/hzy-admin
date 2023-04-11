using System.Linq.Expressions;

namespace HZY.Shared.ApplicationServices.PagingViews;

/// <summary>
/// 分页视图服务
/// </summary>
public class PagingViewService : ApplicationService
{
    private readonly DatabaseTableService _databaseTableService;
    private readonly List<GenDbTableDto> _genDbTableDtos;

    /// <summary>
    /// 分页视图服务
    /// </summary>
    /// <param name="databaseTableService"></param>
    public PagingViewService(DatabaseTableService databaseTableService)
    {
        _databaseTableService = databaseTableService;
        _genDbTableDtos = _databaseTableService.GetAllTablesByCache();
    }

    /// <summary>
    /// 构建列 对列头字段设置显示名称
    /// </summary>
    /// <param name="pagingView"></param>
    /// <returns></returns>
    public PagingView BuilderColumns(PagingView pagingView)
    {

        if (_genDbTableDtos == null) return pagingView;

        if (_genDbTableDtos.Count == 0) return pagingView;

        var table = _genDbTableDtos?
        .Where(w => w.EntityName.ToLower() == pagingView.MainTableEntityType.Name.ToLower())
        .FirstOrDefault();

        if (table == null) return pagingView;

        foreach (var column in pagingView.Columns)
        {
            var fieldName = column.FieldName.ToLower();
            var tableInfo = table?.TableInfos?.FirstOrDefault(w => w.ColumnName.ToLower() == fieldName);
            column.Title = string.IsNullOrWhiteSpace(tableInfo?.DisplayName) ? fieldName : tableInfo.DisplayName;
        }

        return pagingView;
    }

    /// <summary>
    /// 构建列 对列头字段设置显示名称
    /// </summary>
    /// <param name="pagingView"></param>
    /// <param name="action"></param>
    /// <returns></returns>
    public PagingView BuilderColumns(PagingView pagingView, Action<PagingViewService, PagingView> action)
    {

        action?.Invoke(this, pagingView);

        return this.BuilderColumns(pagingView);
    }

    /// <summary>
    /// 设置列信息 用于外键表列头得显示名称
    /// </summary>
    /// <typeparam name="TEntity"></typeparam>
    /// <param name="tableColumnView"></param>
    /// <param name="field"></param>
    /// <param name="show"></param>
    /// <param name="width"></param>
    /// <param name="sort"></param>
    /// <returns></returns>
    public PagingViewService SetColumn<TEntity>(TableColumnView tableColumnView, Expression<Func<TEntity, object>> field, bool? show = null, string? width = null, bool sort = true)
    {
        if (_genDbTableDtos == null) return this;

        if (_genDbTableDtos.Count == 0) return this;

        //自动获取名称对应的显示名
        var type = typeof(TEntity);
        var name = Tools.GetNameByExpression(field);

        var table = _genDbTableDtos?
        .Where(w => w.EntityName.ToLower() == type.Name.ToLower())
        .FirstOrDefault();

        if (table == null) return this;

        var tableInfo = table.TableInfos.FirstOrDefault(w => w.CsField.ToLower() == name.ToLower());

        if (tableInfo == null) return this;

        tableColumnView.SetColumn(tableInfo?.DisplayName, show, width, sort);

        return this;
    }

}
