﻿namespace HZY.Api.Admin.ApplicationServices.Systems;

/// <summary>
/// 数据字典服务
/// </summary>
public class SysDictionaryService : ApplicationService<IRepository<SysDictionary>>
{
    public SysDictionaryService(IRepository<SysDictionary> defaultRepository) : base(defaultRepository)
    {

    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    public async Task<List<SysDictionaryDto>> FindListAsync(SysDictionary search)
    {
        var query = (from sysDictionary in _defaultRepository.Select
                     from sysDictionaryParent in _defaultRepository.Select.Where(w => w.Id == sysDictionary.ParentId).DefaultIfEmpty()
                     select new
                     {
                         t1 = sysDictionary,
                         t2 = sysDictionaryParent
                     })
              //.WhereIf(search?.ParentId == 0 || search?.ParentId == null, w => w.t1.ParentId == null || w.t1.ParentId == 0)
              //.WhereIf(search?.ParentId != 0 && search?.ParentId != null, w => w.t1.ParentId == search.ParentId)
              .WhereIf(!string.IsNullOrWhiteSpace(search?.Name), a => a.t1.Name.Contains(search.Name))
              .OrderBy(w => w.t1.Sort)
              .Select(w => new SysDictionaryDto
              {
                  Sort = w.t1.Sort,
                  Code = w.t1.Code,
                  Name = w.t1.Name,
                  Value = w.t1.Value,
                  ParentId = w.t1.ParentId,
                  ParentName = w.t2.Name,
                  LastModificationTime = w.t1.LastModificationTime,
                  CreationTime = w.t1.CreationTime,
                  Id = w.t1.Id,
              })
          ;

        return await query.ToListAsync();
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    public async Task DeleteListAsync(List<int> ids)
    {
        await _defaultRepository.DeleteByIdsAsync(ids);
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public async Task<Dictionary<string, object>> FindFormAsync(int id)
    {
        var res = new Dictionary<string, object>();

        var form = await _defaultRepository.FindByIdAsync(id);

        res[nameof(id)] = id == 0 ? "" : id;
        res[nameof(form)] = form.NullSafe();
        return res;
    }

    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    public async Task SaveFormAsync(SysDictionary form)
    {
        if (await _defaultRepository.AnyAsync(w => w.Code == form.Code && w.Id != form.Id))
        {
            MessageBox.Show("编码已存在，请勿重复插入");
        }
        await _defaultRepository.InsertOrUpdateAsync(form);
    }

    /// <summary>
    /// 获取字典树
    /// </summary>
    /// <returns></returns>
    public async Task<List<SysDictionaryDto>> GetDictionaryTreeAsync()
    {
        var allDictionary = await _defaultRepository.ToListAllAsync();
        return CreateDictionaryTree(0, allDictionary);
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
            model.Children = CreateDictionaryTree(item.Id, allDictionary);
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

        var dictionary = await _defaultRepository.FindAsync(w => w.Code == code);
        if (dictionary == null) return default;
        var dictionarys = await _defaultRepository.Select.Where(w => w.ParentId == dictionary.Id).ToListAsync();
        if (!dictionarys.Any()) return default;
        var result = new List<SysDictionaryDto>();
        return CreateDictionaryTree(dictionary.Id, dictionarys);
    }

}