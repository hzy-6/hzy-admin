using HZY.EFCore.PagingViews;
using HZY.Infrastructure;
using HZY.Infrastructure.Controllers;
using HZY.Infrastructure.Filters;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Models.DTO;
using HZY.Models.DTO.Framework;
using HZY.Models.Entities.Framework;
using HZY.Services.Admin.Framework;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Controllers.Admin.Framework;

/// <summary>
/// 角色菜单功能控制器
/// </summary>
[ControllerDescriptor(MenuId = "18", DisplayName = "")]
public class SysRoleMenuFunctionController : AdminBaseController<SysRoleMenuFunctionService>
{
    private readonly SysRoleService _sysRoleService;

    public SysRoleMenuFunctionController(SysRoleMenuFunctionService defaultService, SysRoleService sysRoleService)
        : base(defaultService)
    {
        _sysRoleService = sysRoleService;
    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="size"></param>
    /// <param name="page"></param>
    /// <param name="search"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查询数据")]
    [HttpPost("FindList/{size}/{page}")]
    public async Task<PagingView> FindListAsync([FromRoute] int size, [FromRoute] int page, [FromBody] SysRole search)
    {
        return await this._sysRoleService.FindListAsync(page, size, search);
    }


    /// <summary>
    /// 保存
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "保存/编辑数据")]
    [HttpPost("SaveForm")]
    public async Task<Guid> SaveFormAsync([FromBody] List<SysRoleMenuFunctionFormDto> form)
    {
        return await this._defaultService.SaveFormAsync(form);
    }

    #region 角色菜单功能 Tree

    /// <summary>
    /// 获取菜单功能树
    /// </summary>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看菜单树")]
    [HttpGet("GetRoleMenuFunctionByRoleId/{RoleId}")]
    public async Task<List<Dictionary<string, object>>> GetRoleMenuFunctionByRoleId(Guid roleId)
    {
        return await this._defaultService.GetRoleMenuFunctionByRoleIdAsync(roleId);
    }

    #endregion
}