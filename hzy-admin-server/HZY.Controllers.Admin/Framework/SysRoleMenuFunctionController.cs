using HZY.EntityFramework.PagingViews;
using HZY.Infrastructure;
using HZY.Infrastructure.Controllers;
using HZY.Infrastructure.Filters;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Models.Consts;
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
//[ControllerDescriptor(MenuId = "16", DisplayName = "")]
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
    /// <param name="pagingSearchInput"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查询数据")]
    [HttpPost("FindList/{size}/{page}")]
    public Task<PagingView> FindListAsync([FromBody] PagingSearchInput<SysRole> pagingSearchInput)
    {
        return this._sysRoleService.FindListAsync(pagingSearchInput);
    }

    /// <summary>
    /// 添加
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [RequestLimitFilter]
    [ActionDescriptor(AdminFunctionConsts.Function_Insert, DisplayName = "创建表单")]
    [HttpPost("Create")]
    [ApiCheckModel]
    public Task CreateAsync([FromBody] List<SysRoleMenuFunctionFormDto> form)
    {
        return this._defaultService.SaveFormAsync(form);
    }

    #region 角色菜单功能 Tree

    /// <summary>
    /// 获取菜单功能树
    /// </summary>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看菜单树")]
    [HttpGet("GetRoleMenuFunctionByRoleId/{RoleId}")]
    public Task<List<Dictionary<string, object>>> GetRoleMenuFunctionByRoleId(Guid roleId)
    {
        return this._defaultService.GetRoleMenuFunctionByRoleIdAsync(roleId);
    }

    #endregion
}