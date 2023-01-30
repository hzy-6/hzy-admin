using HZY.EntityFramework.PagingViews;
using HZY.EntityFramework.Repositories.Admin.Core;
using HZY.Infrastructure;
using HZY.Models.Entities.Framework;
using HZY.Services.Admin.Core;
using HZY.Framework.EntityFrameworkRepositories.Extensions;
using Microsoft.EntityFrameworkCore;
using HZY.Framework.DynamicApiController;
using Microsoft.AspNetCore.Mvc;
using HZY.Infrastructure.Filters;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Models.Consts;
using HZY.Framework.Core.Utils;

namespace HZY.Services.Admin.Framework;

[ApiExplorerSettings(GroupName = nameof(ApiVersions.DynamicApiController))]
[Route("/api/[controller]/[action]")]
public class SysPostService : AdminBaseService<IAdminRepository<SysPost>>, IDynamicApiController
{
    public SysPostService(IAdminRepository<SysPost> defaultRepository) : base(defaultRepository)
    {
    }

    /// <summary>
    /// pagingSearchInput
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(PagingSearchInput<SysPost> pagingSearchInput)
    {
        var query = this._defaultRepository.Select
                .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search?.Name), a => a.Name.Contains(pagingSearchInput.Search.Name))
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
                    LastModificationTime = w.LastModificationTime == null ? "" : w.LastModificationTime.Value.ToString("yyyy-MM-dd"),
                    CreationTime = w.CreationTime.ToString("yyyy-MM-dd"),
                })
            ;

        return await this._defaultRepository.AsPagingViewAsync(query, pagingSearchInput);
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
    public async Task SaveFormAsync(SysPost form)
    {
        await this._defaultRepository.InsertOrUpdateAsync(form);
    }

    /// <summary>
    /// 添加
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [RequestLimitFilter]
    [ActionDescriptor(AdminFunctionConsts.Function_Insert, DisplayName = "创建表单")]
    [ApiCheckModel]
    public Task CreateAsync(SysPost form)
    {
        return this.SaveFormAsync(form);
    }

    /// <summary>
    /// 编辑
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [RequestLimitFilter]
    [ActionDescriptor(AdminFunctionConsts.Function_Update, DisplayName = "编辑表单")]
    [ApiCheckModel]
    public Task UpdateAsync(SysPost form)
    {
        return this.SaveFormAsync(form);
    }


    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(PagingSearchInput<SysPost> pagingSearchInput)
    {
        pagingSearchInput.Page = -1;
        var tableViewModel = await this.FindListAsync(pagingSearchInput);
        return this.ExportExcelByPagingView(tableViewModel);
    }


}