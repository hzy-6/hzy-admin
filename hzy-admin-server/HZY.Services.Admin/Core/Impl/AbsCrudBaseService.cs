using HZY.EFCore.PagingViews;
using HZY.EFCore.Repositories.Admin.Core;
using HZY.Infrastructure;
using NPOI.HSSF.UserModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Services.Admin.Core.Impl;

/// <summary>
/// 集成服务实现类
/// </summary>
/// <typeparam name="TRepository">默认仓储</typeparam>
/// <typeparam name="TSearchDto">查询列表检索对象</typeparam>
/// <typeparam name="TFormDto">保存数据表单对象</typeparam>
/// <typeparam name="TEntity">实体模型</typeparam>
/// <typeparam name="TKey">主键类型</typeparam>
public abstract class AbsCrudBaseService<TRepository, TSearchDto, TFormDto, TEntity, TKey> : ICrudBaseService<TRepository, TSearchDto, TFormDto, TEntity, TKey>
        where TRepository : IAdminRepository<TEntity>
        where TSearchDto : class
        where TFormDto : class, new()
        where TEntity : class, new()
{
    protected readonly TRepository _repository;

    protected AbsCrudBaseService(TRepository repository)
    {
        _repository = repository;
    }

    /// <summary>
    /// 根据 id 集合 删除多个数据
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    public virtual Task DeleteListAsync(List<TKey> ids)
    {
        return this._repository.DeleteByIdsAsync(ids);
    }

    /// <summary>
    /// 导出 excel
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    public virtual async Task<byte[]> ExportExcelAsync(TSearchDto search)
    {
        var tableViewModel = await this.FindListAsync(1, 999999, search);
        return this.ExportExcelByPagingView(tableViewModel, null, "Id");
    }

    /// <summary>
    /// 根据 id 获取表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public virtual async Task<Dictionary<string, object>> FindFormAsync(TKey id)
    {
        var res = new Dictionary<string, object>();
        var form = await this._repository.FindByIdAsync(id);
        form = form.NullSafe();

        if (id is Guid)
        {
            res[nameof(id)] = id.ToGuid() == Guid.Empty ? "" : id;
        }
        else
        {
            res[nameof(id)] = id == null ? "" : id;
        }

        res[nameof(form)] = form;
        return res;
    }

    /// <summary>
    /// 列表查询
    /// </summary>
    /// <param name="page"></param>
    /// <param name="size"></param>
    /// <param name="search"></param>
    /// <returns></returns>
    /// <exception cref="NotImplementedException"></exception>
    public virtual Task<PagingView> FindListAsync(int page, int size, TSearchDto search)
    {
        throw new NotImplementedException("在 HZY.Services.Admin 服务层 FindListAsync 请重写 ");

    }

    /// <summary>
    /// 保存表单
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    /// <exception cref="NotImplementedException"></exception>
    public virtual async Task<TFormDto> SaveFormAsync(TFormDto form)
    {
        if (form is TEntity)
        {
            return (await this._repository.InsertOrUpdateAsync(form as TEntity)) as TFormDto;
        }

        throw new NotImplementedException("在 HZY.Services.Admin 服务层 TFormDto 与 TEntity 类型不一致 需要 重写 函数 SaveFormAsync ");
    }

    #region 导出 Excel
    /// <summary>
    /// 导出 Excel
    /// </summary>
    /// <param name="PagingView"></param>
    /// <param name="byName">别名</param>
    /// <param name="ignore"></param>
    /// <returns></returns>
    protected virtual byte[] ExportExcelByPagingView(PagingView PagingView, Dictionary<string, string> byName = null, params string[] ignore)
    {
        var workbook = new HSSFWorkbook();
        var sheet = workbook.CreateSheet();
        //数据
        var data = PagingView.DataSource;
        var cols = ignore == null ? PagingView.Columns :
            PagingView.Columns.Where(w => !ignore.Any(i => i.ToLower() == w.FieldName.ToLower()))
            .ToList();

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
                dataRow.CreateCell(index).SetCellValue(item.Title ?? item.FieldName);
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
                if (col.FieldName.StartsWith("_")) continue;
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