using HZY.EFCore.Extensions;
using HZY.EFCore.Models;
using HZY.Infrastructure;
using HZY.Infrastructure.ApiResultManage;
using HZY.Model.BO;
using HZY.Models.DTO;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Repositories.Framework;
using HZY.Services.Accounts;
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
/// 系统账号服务
/// </summary>
public class SysUserService : AdminBaseService<SysUserRepository>
{
    private readonly SysUserRoleRepository _sysUserRoleRepository;
    private readonly SysRoleRepository _sysRoleRepository;
    private readonly SysUserPostRepository _sysUserPostRepository;
    private readonly SysPostRepository _sysPostRepository;
    private readonly IAccountService _accountService;
    private readonly SysMenuService _sysMenuService;

    public SysUserService(SysUserRepository repository,
        SysUserRoleRepository sysUserRoleRepository,
        SysRoleRepository sysRoleRepository,
        SysUserPostRepository sysUserPostRepository,
        SysPostRepository sysPostRepository,
        IAccountService accountService,
        SysMenuService sysMenuService) : base(repository)
    {
        _sysUserRoleRepository = sysUserRoleRepository;
        _sysRoleRepository = sysRoleRepository;
        _sysUserPostRepository = sysUserPostRepository;
        _sysPostRepository = sysPostRepository;
        _accountService = accountService;
        _sysMenuService = sysMenuService;
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="page"></param>
    /// <param name="size"></param>
    /// <param name="search"></param>
    /// <returns></returns>
    public async Task<PagingViewModel> FindListAsync(int page, int size, SysUser search)
    {
        var accountInfo = _accountService.GetAccountInfo();
        var query = (from sysUser in this.Repository.QueryByDataAuthority(accountInfo, w => w.Id)
                     from sysOrganization in this.Repository.Orm.SysOrganization.Where(w => w.Id == sysUser.OrganizationId).DefaultIfEmpty()
                     select new { t1 = sysUser, t2 = sysOrganization })
                .WhereIf(search.OrganizationId != null, w => w.t1.OrganizationId == search.OrganizationId)
                .WhereIf(!string.IsNullOrWhiteSpace(search?.Name), w => w.t1.Name.Contains(search.Name))
                .WhereIf(!string.IsNullOrWhiteSpace(search?.LoginName), w => w.t1.LoginName.Contains(search.LoginName))
                .OrderByDescending(w => w.t1.CreationTime)
                .Select(w => new
                {
                    w.t1.Id,
                    w.t1.Name,
                    w.t1.LoginName,
                    所属角色 = string.Join(",", from userRole in this.Repository.Orm.SysUserRole
                                            join role in this.Repository.Orm.SysRole on userRole.RoleId equals role.Id
                                            where userRole.UserId == w.t1.Id
                                            select role.Name),
                    OrganizationName = w.t2.Name,
                    w.t1.Phone,
                    w.t1.Email,
                    LastModificationTime = w.t1.LastModificationTime.ToString("yyyy-MM-dd"),
                    CreationTime = w.t1.CreationTime.ToString("yyyy-MM-dd"),
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
            var userModel = await this.Repository.FindByIdAsync(item);
            if (userModel.DeleteLock) MessageBox.Show("该信息不能删除！");
            await this._sysUserRoleRepository.DeleteAsync(w => w.UserId == item);
            await this.Repository.DeleteAsync(userModel);
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

        var form = (await this.Repository.FindByIdAsync(id)).NullSafe();
        //角色信息
        var roleIds = await this._sysUserRoleRepository.Select
            .Where(w => w.UserId == id)
            .Select(w => w.RoleId)
            .ToListAsync();
        var allRoleList = await this._sysRoleRepository.Select.ToListAsync();
        //岗位信息
        var postIds = await this._sysUserPostRepository.Select
                .Where(w => w.UserId == id)
                .Select(w => w.PostId)
                .ToListAsync()
            ;
        var allPostList = await this._sysPostRepository.Select.OrderBy(w => w.Number).ToListAsync();

        res[nameof(id)] = id == Guid.Empty ? "" : id;
        res[nameof(form)] = form;
        res[nameof(roleIds)] = roleIds;
        res[nameof(allRoleList)] = allRoleList;
        //
        res[nameof(postIds)] = postIds;
        res[nameof(allPostList)] = allPostList;
        return res;
    }

    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    public async Task<SysUser> SaveFormAsync(SysUserFormDto form)
    {
        var model = form.Form;

        //if (string.IsNullOrWhiteSpace(model.Password))
        //    MessageBox.Show("密码不能为空！");

        if (model.Id == Guid.Empty)
        {
            model.Password = string.IsNullOrWhiteSpace(model.Password) ? Tools.Md5Encrypt("123qwe") : Tools.Md5Encrypt(model.Password);
        }
        else
        {
            if (string.IsNullOrWhiteSpace(model.Password))
            {
                var user = await this.Repository.FindByIdAsync(model.Id);
                model.Password = user.Password;
            }
            else
            {
                model.Password = Tools.Md5Encrypt(model.Password);
            }
        }

        if (await this.Repository.AnyAsync(w => w.LoginName == model.LoginName && w.Id != model.Id))
        {
            MessageBox.Show("登录账号名称已存在!");
        }

        await this.Repository.InsertOrUpdateAsync(form.Form);

        //变更用户角色
        if (form.RoleIds.Count > 0)
        {
            var sysUserRoles = await this._sysUserRoleRepository.Select
                .Where(w => w.UserId == model.Id)
                .ToListAsync();

            await this._sysUserRoleRepository.DeleteAsync(w => w.UserId == model.Id);
            foreach (var item in form.RoleIds)
            {
                var sysUserRole = sysUserRoles.FirstOrDefault(w => w.RoleId == item).NullSafe();

                sysUserRole.Id = Guid.NewGuid();
                sysUserRole.RoleId = item;
                sysUserRole.UserId = model.Id;
                await this._sysUserRoleRepository.InsertAsync(sysUserRole);
            }
        }

        //处理岗位信息
        if (form.PostIds.Count > 0)
        {
            var sysUserPosts = await this._sysUserPostRepository.Select
                    .Where(w => w.UserId == model.Id)
                    .ToListAsync()
                ;

            await this._sysUserPostRepository.DeleteAsync(w => w.UserId == model.Id);
            foreach (var item in form.PostIds)
            {
                var sysUserPost = sysUserPosts.FirstOrDefault(w => w.PostId == item).NullSafe();

                sysUserPost.Id = Guid.NewGuid();
                sysUserPost.PostId = item;
                sysUserPost.UserId = model.Id;
                await this._sysUserPostRepository.InsertAsync(sysUserPost);
            }
        }

        return model;
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(SysUser search)
    {
        var tableViewModel = await this.FindListAsync(1, 999999, search);
        return this.ExportExcelByPagingViewModel(tableViewModel, null, "Id");
    }

    /// <summary>
    /// 获取当前用户信息
    /// </summary>
    /// <returns></returns>
    public async Task<AccountInfo> GetUserInfoAsync()
    {
        var userInfo = this._accountService.GetAccountInfo();
        var sysMenus = await this._sysMenuService.GetMenusByCurrentRoleAsync();
        //设置菜单 Map
        var sysMenusMap = this._sysMenuService.CreateMenus(0, sysMenus);
        userInfo.Menus = sysMenusMap;
        //设置菜单权限
        userInfo.MenuPowers = await this._sysMenuService.GetPowerByMenusAsync(sysMenus);

        return userInfo;
    }





}