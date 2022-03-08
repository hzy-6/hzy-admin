using System;
using System.Collections;
using System.Collections.Generic;
using System.Text;

namespace HZY.EFCore.Models;

public class PagingViewModel
{
    /// <summary>
    /// 列信息
    /// </summary>
    public List<TableViewColumn> Columns { get; set; } = new List<TableViewColumn>();

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
}