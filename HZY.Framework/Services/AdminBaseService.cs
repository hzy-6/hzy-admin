using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using HZY.Repository.Core.Models;
using HZY.Toolkit;
using HZY.Toolkit.Attributes;
using Microsoft.AspNetCore.Http;
using NPOI.HSSF.UserModel;

namespace HZY.Framework.Services
{
    [AppService]
    public class AdminBaseService<TRepository> : FrameworkBaseService<TRepository> where TRepository : class
    {
        public AdminBaseService(TRepository repository) : base(repository)
        {
        }

        #region 导出 Excel

        /// <summary>
        /// 导出 Excel
        /// </summary>
        /// <param name="pagingViewModel"></param>
        /// <param name="byName">别名</param>
        /// <returns></returns>
        protected virtual byte[] ExportExcelByPagingViewModel(PagingViewModel pagingViewModel,
            Dictionary<string, string> byName = null)
        {
            var workbook = new HSSFWorkbook();
            var sheet = workbook.CreateSheet();
            //数据
            var data = pagingViewModel.DataSource;
            var cols = pagingViewModel.Columns.Where(w => w.Show).ToList();
            //填充表头
            var dataRow = sheet.CreateRow(0);
            foreach (var item in cols)
            {
                var index = cols.IndexOf(item);
                if (byName != null && byName.ContainsKey(item.FieldName))
                {
                    dataRow.CreateCell(index).SetCellValue(byName[item.FieldName]);
                }
                else
                {
                    dataRow.CreateCell(index).SetCellValue(item.Title);
                }
            }

            //填充内容
            for (var i = 0; i < data.Count; i++)
            {
                var item = data[i];
                dataRow = sheet.CreateRow(i + 1);
                foreach (var col in cols)
                {
                    if (!col.Show) continue;
                    var index = cols.IndexOf(col);
                    var name = col.FieldName.FirstCharToUpper();
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

        #endregion

    }
}