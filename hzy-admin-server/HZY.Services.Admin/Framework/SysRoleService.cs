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

/// <summary>
/// 角色服务
/// </summary>
public class SysRoleService : AdminBaseService<IAdminRepository<SysRole>>
{
    private readonly IAdminRepository<SysUserRole> _sysUserRoleRepository;
    private readonly IAdminRepository<SysDataAuthority> _sysDataAuthorityRepository;
    private readonly IAdminRepository<SysDataAuthorityCustom> _sysDataAuthorityCustomRepository;

    public SysRoleService(IAdminRepository<SysRole> defaultRepository,
        IAdminRepository<SysUserRole> sysUserRoleRepository,
        IAdminRepository<SysDataAuthority> sysDataAuthorityRepository,
        IAdminRepository<SysDataAuthorityCustom> sysDataAuthorityCustomRepository) : base(defaultRepository)
    {
        _sysUserRoleRepository = sysUserRoleRepository;
        _sysDataAuthorityRepository = sysDataAuthorityRepository;
        _sysDataAuthorityCustomRepository = sysDataAuthorityCustomRepository;
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="page"></param>
    /// <param name="size"></param>
    /// <param name="search"></param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(int page, int size, SysRole search)
    {
        var query = (from sysRole in this._defaultRepository.Select
                     from sysDataAuthority in this._sysDataAuthorityRepository.Select
                     .Where(w => w.RoleId == sysRole.Id)
                     .DefaultIfEmpty()
                     select new
                     {
                         t1 = sysRole,
                         t2 = sysDataAuthority
                     })
                    .WhereIf(!string.IsNullOrWhiteSpace(search?.Name), a => a.t1.Name.Contains(search.Name))
                    .OrderBy(w => w.t1.Number)
                    .Select(w => new
                    {
                        w.t1.Id,
                        w.t1.Number,
                        w.t1.Name,
                        w.t1.Remark,
                        w.t1.DeleteLock,
                        PermissionType = w.t2 == null ? 0 : w.t2.PermissionType,
                        LastModificationTime = w.t1.LastModificationTime.ToString("yyyy-MM-dd"),
                        CreationTime = w.t1.CreationTime.ToString("yyyy-MM-dd"),
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
        foreach (var item in ids)
        {
            var role = await this._defaultRepository.FindByIdAsync(item);
            if (role.DeleteLock) MessageBox.Show("该信息已被锁定不能删除！");
            await this._defaultRepository.DeleteAsync(role);
            await this._sysUserRoleRepository.DeleteAsync(w => w.RoleId == item);
            var list = await this._sysDataAuthorityRepository.ToListAsync(w => w.RoleId == item);
            await this._sysDataAuthorityCustomRepository.DeleteAsync(w => list.Select(w => w.Id).Contains(w.SysDataAuthorityId.Value));
            await this._sysDataAuthorityRepository.DeleteAsync(list);
        }
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
            form.Number = maxNum + 1;
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
    public async Task<SysRole> SaveFormAsync(SysRole form)
    {
        return await this._defaultRepository.InsertOrUpdateAsync(form);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(SysRole search)
    {
        var tableViewModel = await this.FindListAsync(-1, 0, search);
        return this.ExportExcelByPagingView(tableViewModel, null, "Id");
    }


}