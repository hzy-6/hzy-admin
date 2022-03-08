using HZY.EFCore.Extensions;
using HZY.EFCore.Models;
using HZY.Infrastructure;
using HZY.Infrastructure.ApiResultManage;
using HZY.Models.DTO;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Repositories.Framework;
using HZY.Services.Admin.BaseServicesAdmin;
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
public class SysRoleService : AdminBaseService<SysRoleRepository>
{
    private readonly SysUserRoleRepository _sysUserRoleRepository;
    private readonly SysDataAuthorityRepository _sysDataAuthorityRepository;
    private readonly SysDataAuthorityCustomRepository _sysDataAuthorityCustomRepository;

    public SysRoleService(SysRoleRepository repository, SysUserRoleRepository sysUserRoleRepository, SysDataAuthorityRepository sysDataAuthorityRepository, SysDataAuthorityCustomRepository sysDataAuthorityCustomRepository) : base(
        repository)
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
    public async Task<PagingViewModel> FindListAsync(int page, int size, SysRole search)
    {
        var query = this.Repository.Select
                .WhereIf(!string.IsNullOrWhiteSpace(search?.Name), a => a.Name.Contains(search.Name))
                .OrderBy(w => w.Number)
                .Select(w => new
                {
                    w.Id,
                    w.Number,
                    w.Name,
                    w.Remark,
                    w.DeleteLock,
                    LastModificationTime = w.LastModificationTime.ToString("yyyy-MM-dd"),
                    CreationTime = w.CreationTime.ToString("yyyy-MM-dd"),
                })
            ;

        return await this.Repository.AsPagingViewModelAsync(query, page, size);
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
            var role = await this.Repository.FindByIdAsync(item);
            if (role.DeleteLock) MessageBox.Show("该信息已被锁定不能删除！");
            await this.Repository.DeleteAsync(role);
            await this._sysUserRoleRepository.DeleteAsync(w => w.RoleId == item);
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
        var form = await this.Repository.FindByIdAsync(id);
        form = form.NullSafe();

        if (id == Guid.Empty)
        {
            var maxNum = await this.Repository.Select.MaxAsync(w => w.Number);
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
        return await this.Repository.InsertOrUpdateAsync(form);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(SysRole search)
    {
        var tableViewModel = await this.FindListAsync(1, 999999, search);
        return this.ExportExcelByPagingViewModel(tableViewModel, null, "Id");
    }


}