using HZY.EFCore.PagingViews;
using HZY.EFCore.Repositories.Admin.Core;
using HZY.Infrastructure;
using HZY.Infrastructure.ApiResultManage;
using HZY.Models.DTO;
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

public class SysPostService : AdminBaseService<IAdminRepository<SysPost>>
{
    public SysPostService(IAdminRepository<SysPost> defaultRepository) : base(defaultRepository)
    {
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="page"></param>
    /// <param name="size"></param>
    /// <param name="search"></param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(int page, int size, SysPost search)
    {
        var query = this._defaultRepository.Select
                .WhereIf(!string.IsNullOrWhiteSpace(search?.Name), a => a.Name.Contains(search.Name))
                .OrderBy(w => w.Number)
                .Select(w => new
                {
                    w.Id,
                    w.Number,
                    w.Code,
                    w.Name,
                    //State = w.State == StateEnum.正常 ? "正常" : "停用",
                    w.State,
                    //State=w.State.ToString(),
                    LastModificationTime = w.LastModificationTime.ToString("yyyy-MM-dd"),
                    CreationTime = w.CreationTime.ToString("yyyy-MM-dd"),
                })
            ;

        return await this._defaultRepository.AsPagingViewAsync(query, page, size);
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    public async Task DeleteListAsync(List<Guid> ids)
    {
        await this._defaultRepository.DeleteAsync(w => ids.Contains(w.Id));
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public async Task<Dictionary<string, object>> FindFormAsync(Guid id)
    {
        var res = new Dictionary<string, object>();
        var form = await this._defaultRepository.FindByIdAsync(id);
        form = form.NullSafe();

        if (id == Guid.Empty)
        {
            var maxNum = await this._defaultRepository.Select.MaxAsync(w => w.Number);
            form.Number = (maxNum ?? 0) + 1;
        }

        res[nameof(id)] = id == Guid.Empty ? "" : id;
        res[nameof(form)] = form;
        return res;
    }

    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    public async Task<SysPost> SaveFormAsync(SysPost form)
    {
        return await this._defaultRepository.InsertOrUpdateAsync(form);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(SysPost search)
    {
        var tableViewModel = await this.FindListAsync(-1, 0, search);
        return this.ExportExcelByPagingView(tableViewModel);
    }


}