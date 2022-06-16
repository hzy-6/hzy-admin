using HZY.EFCore.PagingViews;
using HZY.EFCore.Repositories.Admin.Core;
using HZY.Infrastructure;
using HZY.Infrastructure.ApiResultManage;
using HZY.Models.DTO;
using HZY.Models.DTO.Framework;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Services.Admin.Core;
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
/// 角色 菜单 功能服务
/// </summary>
public class SysRoleMenuFunctionService : AdminBaseService<IAdminRepository<SysRoleMenuFunction>>
{
    private readonly IAdminRepository<SysMenu> _sysMenuRepository;
    private readonly IAdminRepository<SysMenuFunction> _sysMenuFunctionRepository;

    public SysRoleMenuFunctionService(IAdminRepository<SysRoleMenuFunction> defaultRepository,
        IAdminRepository<SysMenu> sysMenuRepository,
        IAdminRepository<SysMenuFunction> sysMenuFunctionRepository) : base(defaultRepository)
    {
        _sysMenuRepository = sysMenuRepository;
        _sysMenuFunctionRepository = sysMenuFunctionRepository;
    }


    /// <summary>
    /// 保存数据
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    public async Task<Guid> SaveFormAsync(List<SysRoleMenuFunctionFormDto> form)
    {
        var sysRoleMenuFunctions = new List<SysRoleMenuFunction>();
        var roleId = form.Count > 0 ? form[0].RoleId : default;

        if (roleId == Guid.Empty) return default;

        //开启事务
        using var tran = await this._defaultRepository.UnitOfWork.BeginTransactionAsync();

        try
        {
            await this._defaultRepository.DeleteAsync(w => w.RoleId == roleId && form.Select(w => w.MenuId).Contains(w.MenuId));

            foreach (var item in form)
            {
                var menuId = item.MenuId;
                var menuFuncionList = item.MenuFunctionIdList;

                var list = menuFuncionList
                    .Select(item => new SysRoleMenuFunction { MenuId = menuId, RoleId = roleId, MenuFunctionId = item })
                    .ToList();

                sysRoleMenuFunctions.AddRange(list);
            }

            await this._defaultRepository.InsertRangeAsync(sysRoleMenuFunctions);

            await tran.CommitAsync();
        }
        catch (Exception)
        {
            await tran.RollbackAsync();
            throw;
        }

        return roleId;
    }

    /// <summary>
    /// 获取 角色 勾选的菜单功能集合 
    /// </summary>
    /// <param name="roleId"></param>
    /// <returns></returns>
    public async Task<List<Dictionary<string, object>>> GetRoleMenuFunctionByRoleIdAsync(Guid roleId)
    {
        var allMenus = await _sysMenuRepository.ToListAllAsync();
        var allMenuFunction = await _sysMenuFunctionRepository.ToListAllAsync();
        var allRoleMenuFunction = await this._defaultRepository.Select.Where(w => w.RoleId == roleId).ToListAsync();

        var result = new List<Dictionary<string, object>>();

        foreach (var item in allMenus)
        {
            //组装菜单
            var menuFunctions = allMenuFunction
                .Where(w => w.MenuId == item.Id)
                .Select(w => new { Id = w.Id, Label = w.FunctionName })
                .ToList();

            //获取当前角色勾选该菜单的按钮数组
            var checkedMenuFunctionIds = allRoleMenuFunction
                .Where(w => w.MenuId == item.Id)
                .Select(w => w.MenuFunctionId)
                .ToList()
                ;

            result.Add(new Dictionary<string, object>
            {
                ["id"] = item.Id,
                ["name"] = item.Name,
                ["number"] = item.Number,
                ["parentId"] = item.ParentId,
                ["levelCode"] = item.LevelCode,
                ["menuFunctions"] = menuFunctions,
                ["checkedMenuFunctionIds"] = checkedMenuFunctionIds,
                ["checkAll"] = menuFunctions.Count == checkedMenuFunctionIds.Count,
                ["indeterminate"] = checkedMenuFunctionIds.Count > 0 && checkedMenuFunctionIds.Count < menuFunctions.Count
            });
        }

        return result;
    }

}