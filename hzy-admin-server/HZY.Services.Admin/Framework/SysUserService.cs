using HZY.Managers.Accounts;
using HZY.EFCore.Aop;
using HZY.EFCore.DbContexts;
using HZY.EFCore.PagingViews;
using HZY.EFCore.Repositories.Admin.Core;
using HZY.Infrastructure;
using HZY.Infrastructure.Aop;
using HZY.Infrastructure.ApiResultManage;
using HZY.Models.BO;
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
using HZY.Infrastructure.Aop.Cache;
using NPOI.SS.Formula.Functions;
using System.Linq.Expressions;

namespace HZY.Services.Admin.Framework;

/// <summary>
/// 系统账号服务
/// </summary>
public class SysUserService : AdminBaseService<IAdminRepository<SysUser>>
{
    private readonly IAdminRepository<SysUserRole> _sysUserRoleRepository;
    private readonly IAdminRepository<SysRole> _sysRoleRepository;
    private readonly IAdminRepository<SysUserPost> _sysUserPostRepository;
    private readonly IAdminRepository<SysPost> _sysPostRepository;
    private readonly IAccountManager _accountService;
    private readonly SysMenuService _sysMenuService;
    private readonly IAdminRepository<SysOrganization> _sysOrganizationRepository;

    public SysUserService(IAdminRepository<SysUser> defaultRepository,
        IAdminRepository<SysUserRole> sysUserRoleRepository,
        IAdminRepository<SysRole> sysRoleRepository,
        IAdminRepository<SysUserPost> sysUserPostRepository,
        IAdminRepository<SysPost> sysPostRepository,
        IAccountManager accountService,
        SysMenuService sysMenuService,
        IAdminRepository<SysOrganization> sysOrganizationRepository) : base(defaultRepository)
    {
        _sysUserRoleRepository = sysUserRoleRepository;
        _sysRoleRepository = sysRoleRepository;
        _sysUserPostRepository = sysUserPostRepository;
        _sysPostRepository = sysPostRepository;
        _accountService = accountService;
        _sysMenuService = sysMenuService;
        _sysOrganizationRepository = sysOrganizationRepository;
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(PagingSearchInput<SysUser> pagingSearchInput)
    {
        var accountInfo = _accountService.GetAccountInfo();

        //被数据权限处理的 query 对象
        var querySysUser = this._defaultRepository
        .DataPermission(this._defaultRepository.Select, accountInfo, w => w.Id, w => w.OrganizationId)
        ;

        var query = (from sysUser in querySysUser
                     from sysOrganization in this._sysOrganizationRepository.Select.Where(w => w.Id == sysUser.OrganizationId).DefaultIfEmpty()
                     select new
                     {
                         t1 = sysUser,
                         t2 = sysOrganization,
                         所属角色 = string.Join(",", from userRole in this._sysUserRoleRepository.Select
                                                 join role in this._sysRoleRepository.Select on userRole.RoleId equals role.Id
                                                 where userRole.UserId == sysUser.Id
                                                 select role.Name)
                     })
                .WhereIf(pagingSearchInput.Search.OrganizationId != null, w => w.t1.OrganizationId == pagingSearchInput.Search.OrganizationId)
                .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search?.Name), w => w.t1.Name.Contains(pagingSearchInput.Search.Name))
                .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search?.LoginName), w => w.t1.LoginName.Contains(pagingSearchInput.Search.LoginName))
                .OrderBy(w => w.t1.OrganizationId)
                .ThenByDescending(w => w.t1.CreationTime)
                .Select(w => new
                {
                    w.t1.Id,
                    w.t1.Name,
                    w.t1.LoginName,
                    w.所属角色,
                    OrganizationName = w.t2.Name,
                    w.t1.Phone,
                    _Email = w.t1.Email,
                    w.t1.LastModificationTime,
                    w.t1.CreationTime,
                })
            ;

        var result = await this._defaultRepository.AsPagingViewAsync(query, pagingSearchInput);
        result.GetColumn(query, w => w.OrganizationName).SetColumn<SysOrganization>(w => w.Name);
        result.GetColumn(query, w => w.所属角色).SetColumn(sort: false);
        //覆盖值
        result
            .SetValue(query, w => w.CreationTime, (oldValue) => oldValue.ToString("yyyy-MM-dd"))
            .SetValue(query, w => w.LastModificationTime, (oldValue) => oldValue?.ToString("yyyy-MM-dd"))
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
        foreach (var item in ids)
        {
            var userModel = await this._defaultRepository.FindByIdAsync(item);
            if (userModel.DeleteLock) MessageBox.Show("该信息已被锁定不能删除！");
            await this._sysUserRoleRepository.DeleteAsync(w => w.UserId == item);
            await this._defaultRepository.DeleteAsync(userModel);
            //清除缓存
            _accountService.DeleteCacheAccountInfoById(item.ToString());
        }
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public virtual async Task<Dictionary<string, object>> FindFormAsync(Guid id)
    {
        var res = new Dictionary<string, object>();

        var form = (await this._defaultRepository.FindByIdAsync(id)).NullSafe();
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
    [Transactional]
    public virtual async Task SaveFormAsync(SysUserFormDto form)
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
                var user = await this._defaultRepository.FindByIdAsync(model.Id);
                model.Password = user.Password;
            }
            else
            {
                model.Password = Tools.Md5Encrypt(model.Password);
            }
        }

        if (await this._defaultRepository.AnyAsync(w => w.LoginName == model.LoginName && w.Id != model.Id))
        {
            MessageBox.Show("登录账号名称已存在!");
        }

        await this._defaultRepository.InsertOrUpdateAsync(form.Form);

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

        //清除缓存
        _accountService.DeleteCacheAccountInfoById(model.Id.ToString());
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(PagingSearchInput<SysUser> pagingSearchInput)
    {
        pagingSearchInput.Page = -1;
        var tableViewModel = await this.FindListAsync(pagingSearchInput);
        return this.ExportExcelByPagingView(tableViewModel, null, "Id");
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
        var sysMenusMap = this._sysMenuService.CreateMenus(sysMenus);
        userInfo.Menus = sysMenusMap;
        //设置菜单权限
        userInfo.MenuPowers = await this._sysMenuService.GetPowerByMenusAsync(sysMenus);

        return userInfo;
    }





}