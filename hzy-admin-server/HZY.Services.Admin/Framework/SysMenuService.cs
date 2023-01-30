using HZY.Managers.Accounts;
using HZY.EntityFramework.PagingViews;
using HZY.EntityFramework.Repositories.Admin.Core;
using HZY.Infrastructure.ApiResultManage;
using HZY.Models.BO;
using HZY.Models.Consts;
using HZY.Models.DTO;
using HZY.Models.DTO.Framework;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Services.Admin.Core;
using HZY.Framework.EntityFrameworkRepositories.Extensions;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HZY.Infrastructure.Mappers;
using HZY.Framework.Core.Utils;

namespace HZY.Services.Admin.Framework;

/// <summary>
/// 菜单服务
/// </summary>
public class SysMenuService : AdminBaseService<IAdminRepository<SysMenu>>
{
    private readonly IAdminRepository<SysFunction> _sysFunctionRepository;
    private readonly IAdminRepository<SysMenuFunction> _sysMenuFunctionRepository;
    private readonly IAdminRepository<SysRoleMenuFunction> _sysRoleMenuFunctionRepository;
    private readonly AccountInfo _accountInfo;

    public SysMenuService(IAdminRepository<SysMenu> defaultRepository,
        IAdminRepository<SysFunction> sysFunctionRepository,
        IAdminRepository<SysMenuFunction> sysMenuFunctionRepository,
        IAdminRepository<SysRoleMenuFunction> sysRoleMenuFunctionRepository,
        IAccountManager accountService) : base(defaultRepository)
    {
        _sysFunctionRepository = sysFunctionRepository;
        _sysMenuFunctionRepository = sysMenuFunctionRepository;
        _sysRoleMenuFunctionRepository = sysRoleMenuFunctionRepository;
        this._accountInfo = accountService.GetAccountInfo();
    }

    /// <summary>
    /// 获取列表数据
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<PagingView> FindListAsync(PagingSearchInput<SysMenu> pagingSearchInput)
    {
        var query = (from sysMenu in this._defaultRepository.Select
                     from sysMenuParent in this._defaultRepository.Select.Where(w => w.Id == sysMenu.ParentId).DefaultIfEmpty()
                     select new { t1 = sysMenu, t2 = sysMenuParent })
              .WhereIf(pagingSearchInput.Search?.ParentId == 0 || pagingSearchInput.Search?.ParentId == null, w => w.t1.ParentId == null || w.t1.ParentId == 0)
              .WhereIf(pagingSearchInput.Search?.ParentId != 0 && pagingSearchInput.Search?.ParentId != null, w => w.t1.ParentId == pagingSearchInput.Search.ParentId)
              .WhereIf(!string.IsNullOrWhiteSpace(pagingSearchInput.Search?.Name), a => a.t1.Name.Contains(pagingSearchInput.Search.Name))
              .OrderBy(w => w.t1.Number)
              .Select(w => new
              {
                  w.t1.Id,
                  w.t1.Number,
                  w.t1.Name,
                  w.t1.Url,
                  父级菜单 = w.t2.Name,
                  w.t1.ComponentName,
                  w.t1.Router,
                  w.t1.Icon,
                  w.t1.Close,
                  w.t1.Show,
                  LastModificationTime = w.t1.LastModificationTime == null ? "" : w.t1.LastModificationTime.Value.ToString("yyyy-MM-dd"),
                  CreationTime = w.t1.CreationTime.ToString("yyyy-MM-dd"),
              })
          ;

        return await this._defaultRepository.AsPagingViewAsync(query, pagingSearchInput);
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    public async Task DeleteListAsync(List<int> ids)
    {
        foreach (var item in ids)
        {
            //删除当前菜单及一下的子集菜单
            var menu = await this._defaultRepository.FindByIdAsync(item);
            var menus = await this._defaultRepository.ToListAsync(w => w.LevelCode == menu.LevelCode || w.LevelCode.StartsWith(menu.LevelCode + "."));
            await this._defaultRepository.DeleteAsync(menus);
            //删除菜单关联表
            await this._sysRoleMenuFunctionRepository.DeleteAsync(w => menus.Select(w => w.Id).Contains(w.MenuId));
            await this._sysMenuFunctionRepository.DeleteAsync(w => menus.Select(w => w.Id).Contains(w.MenuId));
        }
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public async Task<Dictionary<string, object>> FindFormAsync(int id)
    {
        var res = new Dictionary<string, object>();

        var form = await this._defaultRepository.FindByIdAsync(id);
        var allFunctions = await this._sysFunctionRepository.Select
            .OrderBy(w => w.Number)
            .ToListAsync();
        var menuFunctionList = await this._sysMenuFunctionRepository.Select
            .Where(w => w.MenuId == id)
            .OrderBy(w => w.Number)
            .ToListAsync();

        res[nameof(id)] = id == 0 ? "" : id;
        res[nameof(form)] = form.NullSafe();
        res[nameof(allFunctions)] = allFunctions;
        res[nameof(menuFunctionList)] = menuFunctionList;
        return res;
    }

    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    public async Task SaveFormAsync(SysMenuFormDto form)
    {
        var model = form.Form;
        var menuFunctionList = form.MenuFunctionList;

        model = await this._defaultRepository.InsertOrUpdateAsync(model);

        #region 更新级别码

        if (model.ParentId == null || model.ParentId == 0)
        {
            model.LevelCode = model.Id.ToString();
        }
        else
        {
            var parent = await this._defaultRepository.FindByIdAsync(model.ParentId);
            model.LevelCode = parent.LevelCode + "." + model.Id;
        }

        model = await this._defaultRepository.InsertOrUpdateAsync(model);

        #endregion

        #region 处理菜单功能绑定表

        await this._sysMenuFunctionRepository.DeleteAsync(w => w.MenuId == model.Id);
        if (menuFunctionList.Count <= 0) return;

        foreach (var item in menuFunctionList)
        {
            item.Id = item.Id == Guid.Empty ? Guid.Empty : item.Id;
            item.MenuId = model.Id;
        }
        await this._sysMenuFunctionRepository.InsertRangeAsync(menuFunctionList);

        #endregion

    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    public async Task<byte[]> ExportExcelAsync(PagingSearchInput<SysMenu> pagingSearchInput)
    {
        pagingSearchInput.Page = -1;
        var tableViewModel = await this.FindListAsync(pagingSearchInput);
        return this.ExportExcelByPagingView(tableViewModel, null, "Id");
    }

    /// <summary>
    /// 获取所有的菜单
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    public async Task<List<SysMenuTreeDto>> GetAllAsync(SysMenu search)
    {
        var query = (from sysMenu in this._defaultRepository.Select
                     from sysMenuParent in this._defaultRepository.Select.Where(w => w.Id == sysMenu.ParentId).DefaultIfEmpty()
                     select new { t1 = sysMenu, t2 = sysMenuParent })
             .WhereIf(!string.IsNullOrWhiteSpace(search?.Name), a => a.t1.Name.Contains(search.Name))
             .OrderBy(w => w.t1.Number)
             .Select(w => new SysMenuTreeDto
             {
                 Id = w.t1.Id,
                 Number = w.t1.Number,
                 Name = w.t1.Name,
                 Url = w.t1.Url,
                 ParentName = w.t2.Name,
                 ParentId = w.t1.ParentId,
                 JumpUrl = w.t1.JumpUrl,
                 ComponentName = w.t1.ComponentName,
                 Router = w.t1.Router,
                 Icon = w.t1.Icon,
                 Close = w.t1.Close,
                 Show = w.t1.Show,
                 KeepAlive = w.t1.KeepAlive,
                 State = w.t1.State,
                 LevelCode = w.t1.LevelCode,
                 LastModificationTime = w.t1.LastModificationTime,
                 CreationTime = w.t1.CreationTime,
             })
        ;

        return await query.ToListAsync();
    }

    #region 创建系统左侧菜单

    /// <summary>
    /// 根据角色ID 获取菜单
    /// </summary>
    /// <returns></returns>
    public async Task<List<SysMenu>> GetMenusByCurrentRoleAsync()
    {
        var sysMenuAllList = await this._defaultRepository.Select
            .Where(w => w.State)
            .OrderBy(w => w.Number)
            .ToListAsync();

        if (this._accountInfo.IsAdministrator) return sysMenuAllList;

        var sysMenuList = await (
            from t1 in this._sysRoleMenuFunctionRepository.Select.Where(w => this._accountInfo.SysRoles.Select(s => s.Id).Contains(w.RoleId))
            from t2 in this._defaultRepository.Select.Where(w => w.Id == t1.MenuId && w.State)
                //.DefaultIfEmpty()
            from t3 in this._sysMenuFunctionRepository.Select
                .Where(w => w.Id == t1.MenuFunctionId && w.FunctionCode == AdminFunctionConsts.Function_Display && t2.Id == w.MenuId)
                //.DefaultIfEmpty()
            select t2
            )
            .ToListAsync()
            ;

        var newSysMenuList = new List<SysMenu>();

        foreach (var item in sysMenuList)
        {
            //检查 item 是否已经存在于新集合中
            if (!newSysMenuList.Any(w => w.Id == item.Id))
                newSysMenuList.Add(item);

            this.CheckUpperLevel(sysMenuAllList, sysMenuList, newSysMenuList, item);
        }

        return newSysMenuList.OrderBy(w => w.Number).ToList();
    }

    private void CheckUpperLevel(List<SysMenu> sysMenuAllList, List<SysMenu> oldSysMenuList, List<SysMenu> newSysMenuList, SysMenu menu)
    {
        if (oldSysMenuList.Any(w => w.Id == menu.ParentId)) return;

        var item = sysMenuAllList.Find(w => w.Id == menu.ParentId);
        if (item == null) return;

        //检查 item 是否已经存在于新集合中
        if (!newSysMenuList.Any(w => w.Id == item.Id))
            newSysMenuList.Add(item);

        this.CheckUpperLevel(sysMenuAllList, oldSysMenuList, newSysMenuList, item);
    }

    /// <summary>
    /// 创建菜单
    /// </summary>
    /// <param name="sysMenuList"></param>
    public List<SysMenuTreeDto> CreateMenus(List<SysMenu> sysMenuList)
    {
        var result = new List<SysMenuTreeDto>();

        foreach (var item in sysMenuList)
        {
            var menu = item.MapTo<SysMenu, SysMenuTreeDto>();
            menu.JumpUrl = string.IsNullOrWhiteSpace(item.JumpUrl) ? item.Router : item.JumpUrl;
            result.Add(menu);
        }

        return result;
    }

    /// <summary>
    /// 获取拥有的菜单对象的权限
    /// </summary>
    /// <param name="sysMenuList"></param>
    /// <returns></returns>
    public async Task<List<Dictionary<string, object>>> GetPowerByMenusAsync(List<SysMenu> sysMenuList)
    {
        var sysMenuFunctionList = await this._sysMenuFunctionRepository.Select
        .Where(w => sysMenuList.Select(w => w.Id).Contains(w.MenuId))
        .ToListAsync();
        var sysRoleMenuFunctionList = await this._sysRoleMenuFunctionRepository.Select
            .Where(w => this._accountInfo.SysRoles.Select(w => w.Id).Contains(w.RoleId))
            .ToListAsync();

        var res = new List<Dictionary<string, object>>();

        foreach (var item in sysMenuList)
        {
            var power = new Dictionary<string, object>
            {
                ["MenuId"] = item.Id
            };

            foreach (var sysMenuFunction in sysMenuFunctionList.Where(w => w.MenuId == item.Id))
            {
                // 管理员角色特殊处理
                if (this._accountInfo.IsAdministrator)
                {
                    power[sysMenuFunction.FunctionCode] = true;
                    continue;
                }

                //其他角色处理
                if (_accountInfo.SysRoles.Count() > 0)
                {
                    var isPower = sysRoleMenuFunctionList
                        .Where(w => this._accountInfo.SysRoles.Select(w => w.Id).Contains(w.RoleId))
                        .Where(w => w.MenuId == item.Id && w.MenuFunctionId == sysMenuFunction.Id)
                        .Any();

                    power[sysMenuFunction.FunctionCode] = isPower;
                }
                else
                {
                    power[sysMenuFunction.FunctionCode] = false;
                }
            }

            res.Add(power);
        }

        return res;
    }

    /// <summary>
    /// 根据菜单获取权限
    /// </summary>
    /// <param name="menuId"></param>
    /// <returns></returns>
    public async Task<Dictionary<string, object>> GetPowerStateByMenuIdAsync(int menuId)
    {
        if (!this._defaultRepository.Select.Any(w => w.Id == menuId))
        {
            MessageBox.Show("菜单 id 不存在! 请检查控制器 菜单 id 是否设置正确。");
        }

        var sysMenus = await this._defaultRepository.Select.Where(w => w.Id == menuId).ToListAsync();
        return (await this.GetPowerByMenusAsync(sysMenus)).FirstOrDefault();
    }

    #endregion 左侧菜单

}