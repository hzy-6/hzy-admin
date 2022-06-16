using System.Runtime.Versioning;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;
using HZY.Infrastructure;
using HzyScanDiService;
using Microsoft.Extensions.DependencyInjection;
using System.Linq.Expressions;
using System.Data;
using HZY.EFCore.Repositories.Admin.DevelopmentTool;

namespace HZY.EFCore.PagingViews;

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
    public List<Dictionary<string, object>> DataSource { get; set; } = new List<Dictionary<string, object>>();

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
    /// 初始化列头
    /// </summary>
    /// <param name="fieldNames"></param>
    /// <param name="columnHeads"></param>
    /// <param name="type"></param>
    public void InitColumns(List<string> fieldNames, List<TableColumnView> columnHeads, Type type)
    {
        using var scope = IOCUtil.CreateScope();
        var _databaseTablesRepository = scope.ServiceProvider.GetService<DatabaseTablesRepository>();

        var allTables = _databaseTablesRepository.GetAllTablesByCache();

        var table = allTables?
        .Where(w => w.EntityName.ToLower() == type.Name.ToLower())
        .FirstOrDefault();

        foreach (var item in fieldNames)
        {
            var tableInfo = table.TableInfos.FirstOrDefault(w => w.ColumnName == item);
            var title = string.IsNullOrWhiteSpace(tableInfo?.DisplayName) ? item : tableInfo.DisplayName;
            this.Columns.Add(new TableColumnView(item.FirstCharToLower(), title));
        }

        //如果 传入了 头信息 则 覆盖
        if (columnHeads != null)
        {
            foreach (var item in columnHeads)
            {
                var columnHead = this.Columns.Find(w => w.FieldName.ToLower() == item.FieldName.ToLower());
                if (columnHead == null) continue;
                columnHead.Show = item.Show;
                columnHead.Title = item.Title;
                columnHead.Width = item.Width;
            }
        }
    }

    /// <summary>
    /// 创建数据源
    /// </summary>
    /// <param name="data"></param>
    /// <param name="fieldNames"></param>
    /// <typeparam name="TEntity"></typeparam>
    public void CreateDataSource<TEntity>(List<TEntity> data, List<string> fieldNames)
    {
        var result = new List<Dictionary<string, object>>();
        foreach (var item in data)
        {
            var type = item.GetType();
            var dictionary = new Dictionary<string, object>();

            foreach (var fieldName in fieldNames)
            {
                dictionary[fieldName] = type.GetProperty(fieldName)?.GetValue(item);
            }

            result.Add(dictionary);
        }

        this.DataSource = result;
    }

    /// <summary>
    /// 创建数据源 根据 datatable
    /// </summary>
    /// <param name="data"></param>
    /// <param name="fieldNames"></param>
    public void CreateDataSource(DataTable data, List<string> fieldNames)
    {
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

        this.DataSource = result;
    }

    /// <summary>
    /// 获取指定列
    /// </summary>
    /// <param name="query"></param>
    /// <param name="queryField"></param>
    /// <typeparam name="TQuery"></typeparam>
    /// <returns></returns>
    public TableColumnView Column<TQuery>(IQueryable<TQuery> query, Expression<Func<TQuery, object>> queryField)
    {
        var nameQuery = Tools.GetNameByExpression(queryField);
        var TableColumnView = this.Columns
        .Where(w => w.FieldName.ToLower() == nameQuery.ToLower())
        .FirstOrDefault();
        return TableColumnView;
    }

}