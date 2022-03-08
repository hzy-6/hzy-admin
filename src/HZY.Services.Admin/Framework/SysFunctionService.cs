using HZY.EFCore.Extensions;
using HZY.EFCore.Models;
using HZY.Models.Entities.Framework;
using HZY.Repositories.Framework;
using HZY.Services.Admin.BaseServicesAdmin;
using HZY.Services.Admin.BaseServicesAdmin.Impl;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Services.Admin.Framework;

/// <summary>
/// 功能服务
/// </summary>
public class SysFunctionService : AbsCrudBaseService<SysFunctionRepository, SysFunction, SysFunction, SysFunction, Guid>,
    ICrudBaseService<SysFunctionRepository, SysFunction, SysFunction, SysFunction, Guid>
{
    public SysFunctionService(SysFunctionRepository repository) : base(repository)
    {
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="page"></param>
    /// <param name="size"></param>
    /// <param name="search"></param>
    /// <returns></returns>
    public override async Task<PagingViewModel> FindListAsync(int page, int size, SysFunction search)
    {
        var query = this.Repository.Select
            .WhereIf(!string.IsNullOrWhiteSpace(search?.Name), a => a.Name.Contains(search.Name))
            .OrderBy(w => w.Number)
            .Select(w => new
            {
                w.Id,
                w.Number,
                w.Name,
                w.ByName,
                LastModificationTime = w.LastModificationTime.ToString("yyyy-MM-dd"),
                CreationTime = w.CreationTime.ToString("yyyy-MM-dd"),
            })
        ;

        return await this.Repository.AsPagingViewModelAsync(query, page, size);
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public override async Task<Dictionary<string, object>> FindFormAsync(Guid id)
    {
        var res = await base.FindFormAsync(id);
        var form = (SysFunction)res["form"];
        if (form.Id == Guid.Empty)
        {
            var maxNumber = await this.Repository.Select.MaxAsync(w => w.Number);
            form.Number = (maxNumber ?? 0) + 1;
        }

        res[nameof(form)] = form;
        return res;
    }

}