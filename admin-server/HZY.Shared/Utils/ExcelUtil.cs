namespace HZY.Shared.Utils;

/// <summary>
/// Excel 工具类
/// </summary>
public class ExcelUtil
{
    /// <summary>
    /// 导出 Excel
    /// </summary>
    /// <param name="pagingView"></param>
    /// <param name="byName">别名</param>
    /// <param name="ignore"></param>
    /// <returns></returns>
    public static byte[] ExportExcelByPagingView(PagingView pagingView, Dictionary<string, string> byName = null, params string[] ignore)
    {
        var workbook = new HSSFWorkbook();
        var sheet = workbook.CreateSheet();
        //数据
        var data = pagingView.DataSource;
        if (pagingView.DataSource.FirstOrDefault() == null)
        {
            return default;
        }

        var cols = pagingView.DataSource.FirstOrDefault()?.Keys.Where(w => !ignore.Contains(w)).ToList();

        //填充表头
        var dataRow = sheet.CreateRow(0);
        foreach (var item in cols)
        {
            var index = cols.IndexOf(item);
            if (byName != null && byName.ContainsKey(item))
            {
                dataRow.CreateCell(index).SetCellValue(byName[item]);
            }
            else
            {
                dataRow.CreateCell(index).SetCellValue(item ?? item);
            }

            sheet.SetColumnWidth(index, 30 * 256);
        }

        //填充内容
        for (var i = 0; i < data.Count; i++)
        {
            var item = data[i];
            dataRow = sheet.CreateRow(i + 1);
            foreach (var col in cols)
            {
                if (col.StartsWith("_")) continue;
                var index = cols.IndexOf(col);
                var name = col.ToFirstCharConvertUpper();
                if (!item.ContainsKey(name)) continue;
                var value = item[name];
                dataRow.CreateCell(index).SetCellValue(value == null ? "" : value.ToString());
            }
        }

        //填充byte
        using var ms = new MemoryStream();
        workbook.Write(ms);
        return ms.ToArray();
    }



}
