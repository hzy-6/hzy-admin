using HZY.EFCore.Extensions;
using HZY.EFCore.Models;
using HZY.Infrastructure;
using HZY.Infrastructure.ApiResultManage;
using HZY.Models.DTO;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Repositories.Framework;
using HZY.Services.Admin.BaseServicesAdmin;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Services.Admin.Framework;

/// <summary>
/// 数据字典服务
/// </summary>
public class SysDictionaryService : AdminBaseService<SysDictionaryRepository>
{
    public SysDictionaryService(SysDictionaryRepository repository) : base(repository)
    {

    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="page"></param>
    /// <param name="size"></param>
    /// <param name="search"></param>
    /// <returns></returns>
    public async Task<PagingViewModel> FindListAsync(int page, int size, SysDictionary search)
    {
        var query = (from sysDictionary in this.Repository.Orm.SysDictionary
                     from sysDictionaryParent in this.Repository.Orm.SysDictionary.Where(w => w.Id == sysDictionary.ParentId).DefaultIfEmpty()
                     select new { t1 = sysDictionary, t2 = sysDictionaryParent })
              .WhereIf(search?.ParentId == 0 || search?.ParentId == null, w => w.t1.ParentId == null || w.t1.ParentId == 0)
              .WhereIf(search?.ParentId != 0 && search?.ParentId != null, w => w.t1.ParentId == search.ParentId)
              .WhereIf(!string.IsNullOrWhiteSpace(search?.Name), a => a.t1.Name.Contains(search.Name))
              .OrderBy(w => w.t1.Sort)
              .Select(w => new
              {
                  w.t1.Id,
                  w.t1.Sort,
                  w.t1.Code,
                  w.t1.Name,
                  w.t1.Value,
                  父级菜单 = w.t2.Name,
                  LastModificationTime = w.t1.LastModificationTime.ToString("yyyy-MM-dd"),
                  CreationTime = w.t1.CreationTime.ToString("yyyy-MM-dd"),
              })
          ;

        return await this.Repository.AsPagingViewModelAsync(query, page, size);
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    public async Task DeleteListAsync(List<Guid> ids)
    {
        await this.Repository.DeleteByIdsAsync(ids);
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public async Task<Dictionary<string, object>> FindFormAsync(int id)
    {
        var res = new Dictionary<string, object>();

        var form = await this.Repository.FindByIdAsync(id);

        res[nameof(id)] = id == 0 ? "" : id;
        res[nameof(form)] = form.NullSafe();
        return res;
    }

    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    public async Task<SysDictionary> SaveFormAsync(SysDictionary form)
    {
        return await this.Repository.InsertOrUpdateAsync(form);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(SysDictionary search)
    {
        var tableViewModel = await this.FindListAsync(1, 999999, search);
        return this.ExportExcelByPagingViewModel(tableViewModel, null, "Id");
    }

    /// <summary>
    /// 获取字典树
    /// </summary>
    /// <returns></returns>
    public async Task<List<SysDictionaryDto>> GetDictionaryTreeAsync()
    {
        var allDictionary = await this.Repository.ToListAllAsync();
        return this.CreateDictionaryTree(0, allDictionary);
    }

    /// <summary>
    /// 创建字典树
    /// </summary>
    /// <returns></returns>
    private List<SysDictionaryDto> CreateDictionaryTree(int id, List<SysDictionary> allDictionary)
    {
        List<SysDictionaryDto> result = new();

        var data = new List<SysDictionary>();
        if (id == 0)
        {
            data = allDictionary
                .Where(w => w.ParentId == null || w.ParentId == 0)
                .ToList()
                ;
        }
        else
        {
            data = allDictionary
                .Where(w => w.ParentId == id)
                .ToList()
                ;
        }

        foreach (var item in data)
        {
            var model = item.MapTo<SysDictionary, SysDictionaryDto>();
            model.Children = this.CreateDictionaryTree(item.Id, allDictionary);
            result.Add(model);
        }

        return result;
    }

    /// <summary>
    /// 根据 Code 获取 字典集
    /// </summary>
    /// <param name="code"></param>
    /// <returns></returns>
    public async Task<List<SysDictionaryDto>> GetDictionaryByCodeAsync(string code)
    {
        if (string.IsNullOrWhiteSpace(code))
        {
            MessageBox.Show("参数Code是空!");
        }

        var dictionary = await this.Repository.FindAsync(w => w.Code == code);
        if (dictionary == null) return default;
        var dictionarys = await this.Repository.Select.Where(w => w.ParentId == dictionary.Id).ToListAsync();
        if (dictionarys.Any()) return default;
        var result = new List<SysDictionaryDto>();
        return this.CreateDictionaryTree(dictionary.Id, dictionarys);
    }

}