using HZY.EFCore.PagingViews;
using HZY.EFCore.Repositories.Admin.Core;
using HZY.Infrastructure;
using HZY.Infrastructure.ApiResultManage;
using HZY.Models.DTO;
using HZY.Models.DTO.Framework;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Services.Admin.Core;
using HzyEFCoreRepositories.Extensions;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Internal;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Services.Admin.Framework;

public class SysOrganizationService : AdminBaseService<IAdminRepository<SysOrganization>>
{
    public SysOrganizationService(IAdminRepository<SysOrganization> defaultRepository) : base(defaultRepository)
    {

    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    public async Task<List<SysOrganization>> FindListAsync(SysOrganization search)
    {
        var query = this._defaultRepository.Select
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
            var sysOrganization = await this._defaultRepository.FindByIdAsync(item);
            var sysOrganizations = await this._defaultRepository
                .ToListAsync(w => w.LevelCode == sysOrganization.LevelCode || w.LevelCode.StartsWith(sysOrganization.LevelCode + "."));
            await this._defaultRepository.DeleteAsync(sysOrganizations);
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
        var form = await this._defaultRepository.FindByIdAsync(id);
        form = form.NullSafe();

        if (id == 0)
        {
            var maxNum = await this._defaultRepository.Select
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
    public async Task<SysOrganization> SaveFormAsync(SysOrganization form)
    {
        var model = await this._defaultRepository.InsertOrUpdateAsync(form);

        #region 更新级别码

        if (model.ParentId == null || model.ParentId == 0)
        {
            model.LevelCode = model.Id.ToString();
        }
        else
        {
            var parent = await this._defaultRepository.FindByIdAsync(model.ParentId);
            model.LevelCode = parent.LevelCode + "." + model.Id;
        }

        model = await this._defaultRepository.InsertOrUpdateAsync(model);

        #endregion

        return model;
    }

    /// <summary>
    /// 获取组织机构树
    /// </summary>
    /// <param name="expandedRowKeys"></param>
    /// <param name="sysOrganizations"></param>
    /// <param name="sysOrganization"></param>
    /// <returns></returns>
    public async Task<List<SysOrganizationTreeDto>> GetSysOrganizationTreeAsync(List<int> expandedRowKeys, List<SysOrganization> sysOrganizations, SysOrganization sysOrganization)
    {
        var result = new List<SysOrganizationTreeDto>();

        var isFirst = (sysOrganizations == null || sysOrganizations.Count == 0) && sysOrganization == null;
        if (isFirst)
        {
            sysOrganizations = await this._defaultRepository.Select.OrderBy(w => w.OrderNumber).ToListAsync();

            foreach (var item in sysOrganizations.Where(w => w.ParentId == null || w.ParentId == 0))
            {
                var model = item.MapTo<SysOrganization, SysOrganizationTreeDto>();
                model.Children = await this.GetSysOrganizationTreeAsync(expandedRowKeys, sysOrganizations, item);
                result.Add(model);
            }
        }
        else
        {
            if (sysOrganization != null)
            {
                expandedRowKeys.Add(sysOrganization.Id);
                var list = sysOrganizations.Where(w => w.ParentId == sysOrganization.Id).ToList();

                foreach (var item in list)
                {
                    var model = item.MapTo<SysOrganization, SysOrganizationTreeDto>();
                    model.Children = await this.GetSysOrganizationTreeAsync(expandedRowKeys, sysOrganizations, item);
                    result.Add(model);
                }
            }
        }

        return result;
    }

    /// <summary>
    /// 对 组织树 加工树结构
    /// </summary>
    /// <param name="tree"></param>
    /// <returns></returns>
    public async Task<List<Dictionary<string, object>>> GetSysOrganizationTreeAsync(IEnumerable<SysOrganizationTreeDto> tree)
    {
        var res = new List<Dictionary<string, object>>();

        foreach (var item in tree)
        {
            res.Add(new Dictionary<string, object>()
            {
                ["key"] = item.Id,
                ["title"] = item.Name,
                ["children"] = item.Children.Count > 0 ? await this.GetSysOrganizationTreeAsync(item.Children) : null
            });
        }

        return res;
    }


}