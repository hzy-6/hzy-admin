using HZY.EntityFramework.PagingViews;
using HZY.EntityFramework.Repositories.Admin.Core;
using HZY.Models.Entities.Framework;
using HZY.Services.Admin.Core;
using HZY.Services.Admin.Core.Impl;
using HZY.Framework.EntityFrameworkRepositories.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Services.Admin.Framework;

/// <summary>
/// 功能服务
/// </summary>
public class SysFunctionService : AbsCrudBaseService<IAdminRepository<SysFunction>, SysFunction, SysFunction, SysFunction, Guid>,
    ICrudBaseService<IAdminRepository<SysFunction>, SysFunction, SysFunction, SysFunction, Guid>
{
    public SysFunctionService(IAdminRepository<SysFunction> defaultRepository) : base(defaultRepository)
    {
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public override async Task<PagingView> FindListAsync(PagingSearchInput<SysFunction> pagingSearchInput)
    {
        var query = this._repository.Select
            .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search?.Name), a => a.Name.Contains(pagingSearchInput.Search.Name))
            .OrderBy(w => w.Number)
            .Select(w => new
            {
                w.Id,
                w.Number,
                w.Name,
                w.ByName,
                LastModificationTime = w.LastModificationTime == null ? "" : w.LastModificationTime.Value.ToString("yyyy-MM-dd"),
                CreationTime = w.CreationTime.ToString("yyyy-MM-dd"),
            })
        ;

        return await this._repository.AsPagingViewAsync(query, pagingSearchInput);
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
            var maxNumber = await this._repository.Select.MaxAsync(w => w.Number);
            form.Number = (maxNumber ?? 0) + 1;
        }

        res[nameof(form)] = form;
        return res;
    }

}