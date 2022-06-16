using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.Domain.Services.Accounts;
using HZY.Domain.Services.Upload;
using HZY.EFCore.PagingViews;
using HZY.EFCore.Repositories.Admin.Core;
using HZY.Infrastructure;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Services.Admin.Core;
using HZY.Services.Admin.Framework;
using HzyEFCoreRepositories.Extensions;
using Microsoft.AspNetCore.Http;

namespace HZY.Services.Admin.Memebers;

/// <summary>
/// 会员服务
/// </summary>
public class MemberService : AdminBaseService<IAdminRepository<Member>>
{
    private readonly IAdminRepository<SysUser> _sysUserRepository;
    private readonly IUploadDomainService _uploadService;
    private readonly IAccountDomainService _accountService;

    public MemberService(IAdminRepository<Member> defaultRepository,
        IAdminRepository<SysUser> sysUserRepository,
        IUploadDomainService uploadService,
        IAccountDomainService accountService)
        : base(defaultRepository)
    {
        _sysUserRepository = sysUserRepository;
        _uploadService = uploadService;
        _accountService = accountService;
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="page"></param>
    /// <param name="size"></param>
    /// <param name="search"></param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(int page, int size, Member search)
    {
        var accountInfo = _accountService.GetAccountInfo();

        var query = (
                    from member in this._defaultRepository.QueryByDataAuthority(accountInfo)
                    from user in this._sysUserRepository.Select.Where(w => w.Id == member.UserId).DefaultIfEmpty()
                    select new { t1 = member, t2 = user }
                )
                .WhereIf(!string.IsNullOrWhiteSpace(search.Name), w => w.t1.Name.Contains(search.Name))
                .OrderBy(w => w.t1.Number)
                .Select(w => new
                {
                    w.t1.Id,
                    w.t1.Number,
                    w.t1.Photo,
                    w.t1.Name,
                    w.t1.Phone,
                    w.t1.Sex,
                    Birthday = w.t1.Birthday.ToString("yyyy-MM-dd"),
                    操作人 = w.t2.Name,
                    LastModificationTime = w.t1.LastModificationTime.ToString("yyyy-MM-dd"),
                    CreationTime = w.t1.CreationTime.ToString("yyyy-MM-dd"),
                    //别名 前面包含 _ 则表示界面上会隐藏列
                    _UserId = w.t1.UserId
                })
            ;

        var result = await this._defaultRepository.AsPagingViewAsync(query, page, size);
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
    /// <param name="formFileCollection"></param>
    /// <returns></returns>
    public async Task<Member> SaveFormAsync(Member form, IFormFileCollection formFileCollection)
    {
        var files = new List<IFormFile>();
        IFormFile photo = null;
        if (formFileCollection.Count > 0)
        {
            files = formFileCollection.Where(w => w.Name.Contains("Files")).ToList();
            photo = formFileCollection.FirstOrDefault(w => w.Name == "Photo");
        }

        if (photo != null)
        {
            form.Photo = this._uploadService.HandleUploadImageFile(photo);
        }

        if (files.Count > 0)
        {
            var path = files.Select(item => this._uploadService.HandleUploadFile(item)).ToList();

            if (path.Count > 0) form.FilePath = string.Join(",", path);
        }

        return await this._defaultRepository.InsertOrUpdateAsync(form);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(Member search)
    {
        var tableViewModel = await this.FindListAsync(-1, 0, search);
        return this.ExportExcelByPagingView(tableViewModel);
    }
}