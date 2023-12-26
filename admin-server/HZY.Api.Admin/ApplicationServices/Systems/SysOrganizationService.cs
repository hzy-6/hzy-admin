namespace HZY.Api.Admin.ApplicationServices.Systems;

public class SysOrganizationService : ApplicationService<IRepository<SysOrganization>>
{
    public SysOrganizationService(IRepository<SysOrganization> defaultRepository) : base(defaultRepository)
    {
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    public async Task<List<SysOrganization>> FindListAsync(SysOrganization search)
    {
        var query = _defaultRepository.Select
            .WhereIf(search?.State == null, w => w.State == StateEnum.正常)
            .WhereIf(search?.State != null, w => w.State == search.State)
            .WhereIf(!string.IsNullOrWhiteSpace(search?.Name), w => w.Name.Contains(search.Name))
            ;

        var data = await query
            //.Where(w => w.ParentId == null)
            .OrderBy(w => w.OrderNumber)
            .ToListAsync()
            ;

        return data;
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    public async Task DeleteListAsync(List<int> ids)
    {
        foreach (var item in ids)
        {
            //删除当前菜单及一下的子集菜单
            var sysOrganization = await _defaultRepository.FindByIdAsync(item);
            var sysOrganizations = await _defaultRepository
                .ToListAsync(w => w.LevelCode == sysOrganization.LevelCode || w.LevelCode.StartsWith(sysOrganization.LevelCode + "."));
            await _defaultRepository.DeleteAsync(sysOrganizations);
        }
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <param name="parentId"></param>
    /// <returns></returns>
    public async Task<Dictionary<string, object>> FindFormAsync(int id, int parentId)
    {
        var res = new Dictionary<string, object>();
        var form = await _defaultRepository.FindByIdAsync(id);
        form = form.NullSafe();

        if (id == 0)
        {
            var maxNum = await _defaultRepository.Select
                .WhereIf(parentId == 0, w => w.ParentId == null)
                .WhereIf(parentId != 0, w => w.ParentId == parentId)
                .MaxAsync(w => w.OrderNumber);
            form.OrderNumber = (maxNum ?? 0) + 1;
        }

        res[nameof(id)] = id == 0 ? "" : id;
        res[nameof(form)] = form;
        return res;
    }

    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    public async Task SaveFormAsync(SysOrganization form)
    {
        var model = await _defaultRepository.InsertOrUpdateAsync(form);

        #region 更新级别码

        if (model.ParentId == null || model.ParentId == 0)
        {
            model.LevelCode = model.Id.ToString();
        }
        else
        {
            var parent = await _defaultRepository.FindByIdAsync(model.ParentId);
            model.LevelCode = parent.LevelCode + "." + model.Id;
        }

        model = await _defaultRepository.InsertOrUpdateAsync(model);

        #endregion

    }
}