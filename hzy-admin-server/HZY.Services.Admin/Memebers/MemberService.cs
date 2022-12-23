using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.Managers.Accounts;
using HZY.Managers.Upload;
using HZY.EFCore.PagingViews;
using HZY.EFCore.Repositories.Admin.Core;
using HZY.Infrastructure;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Services.Admin.Core;
using HzyEFCoreRepositories.Extensions;
using Microsoft.AspNetCore.Http;

namespace HZY.Services.Admin.Memebers;

/// <summary>
/// 会员服务
/// </summary>
public class MemberService : AdminBaseService<IAdminRepository<Member>>
{
    private readonly IAdminRepository<SysUser> _sysUserRepository;
    private readonly IUploadManager _uploadService;
    private readonly IAccountManager _accountService;

    public MemberService(IAdminRepository<Member> defaultRepository,
        IAdminRepository<SysUser> sysUserRepository,
        IUploadManager uploadService,
        IAccountManager accountService)
        : base(defaultRepository)
    {
        _sysUserRepository = sysUserRepository;
        _uploadService = uploadService;
        _accountService = accountService;
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(PagingSearchInput<Member> pagingSearchInput)
    {
        var accountInfo = _accountService.GetAccountInfo();

        var query = (
                    from member in this._defaultRepository.Select
                    from user in this._sysUserRepository.Select.Where(w => w.Id == member.UserId).DefaultIfEmpty()
                    select new { t1 = member, t2 = user }
                )
                .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search.Name), w => w.t1.Name.Contains(pagingSearchInput.Search.Name))
                .OrderBy(w => w.t1.Number)
                .Select(w => new
                {
                    w.t1.Id,
                    w.t1.Number,
                    w.t1.Photo,
                    w.t1.Name,
                    w.t1.Phone,
                    w.t1.Sex,
                    w.t1.Birthday,
                    OperatorName = w.t2.Name,
                    w.t1.LastModificationTime,
                    w.t1.CreationTime,
                    //别名 前面包含 _ 则表示界面上会隐藏列
                    _UserId = w.t1.UserId,
                    _OrganizationId = w.t2.OrganizationId,
                })
            ;

        var result = await this._defaultRepository
        .AsPagingViewAsync(query, pagingSearchInput, null, accountInfo, w => w._UserId, w => w._OrganizationId);
        result.GetColumn(query, w => w.OperatorName).SetColumn(title: "操作人");

        //覆盖值
        result
            .SetValue(query, w => w.CreationTime, (oldValue) => oldValue.ToString("yyyy-MM-dd"))
            .SetValue(query, w => w.LastModificationTime, (oldValue) => oldValue?.ToString("yyyy-MM-dd"))
            .SetValue(query, w => w.Birthday, (oldValue) => oldValue.ToString("yyyy-MM-dd"))
            ;

        return result;
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    public async Task DeleteListAsync(List<Guid> ids)
    {
        await this._defaultRepository.DeleteByIdsAsync(ids);
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
        var sysUser = await _sysUserRepository.FindByIdAsync(form.UserId.ToGuid());
        sysUser = sysUser.NullSafe();

        res[nameof(id)] = id == Guid.Empty ? "" : id;
        res[nameof(form)] = form;
        res[nameof(sysUser)] = sysUser;
        return res;
    }

    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    public async Task SaveFormAsync(Member form)
    {
        await this._defaultRepository.InsertOrUpdateAsync(form);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(PagingSearchInput<Member> pagingSearchInput)
    {
        pagingSearchInput.Page = -1;
        var tableViewModel = await this.FindListAsync(pagingSearchInput);
        return this.ExportExcelByPagingView(tableViewModel);
    }
}