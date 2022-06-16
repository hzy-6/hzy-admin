using HZY.EFCore.Repositories.Admin.Core;
using HZY.Infrastructure.Controllers;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Models.Entities.Framework;
using HZY.Services.Admin.Framework;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Controllers.Admin.Framework;

/// <summary>
/// 组织机构控制器
/// </summary>
[ControllerDescriptor(MenuId = "21", DisplayName = "组织机构")]
public class SysOrganizationController : AdminBaseController<SysOrganizationService>
{
    private readonly IAdminRepository<SysOrganization> _sysOrganizationRepository;

    public SysOrganizationController(SysOrganizationService defaultService, IAdminRepository<SysOrganization> sysOrganizationRepository)
        : base(defaultService)
    {
        _sysOrganizationRepository = sysOrganizationRepository;
    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看列表")]
    [HttpPost("FindList")]
    public async Task<List<SysOrganization>> FindListAsync([FromBody] SysOrganization search)
    {
        return await this._defaultService.FindListAsync(search);
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "删除数据")]
    [HttpPost("DeleteList")]
    public async Task<bool> DeleteListAsync([FromBody] List<int> ids)
    {
        await this._defaultService.DeleteListAsync(ids);
        return true;
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <param name="parentId"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看表单")]
    [HttpGet("FindForm/{id?}/{parentId?}")]
    public async Task<Dictionary<string, object>> FindFormAsync([FromRoute] int id, int parentId)
    {
        return await this._defaultService.FindFormAsync(id, parentId);
    }

    /// <summary>
    /// 保存
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "保存/编辑表单")]
    [HttpPost("SaveForm")]
    public async Task<SysOrganization> SaveFormAsync([FromBody] SysOrganization form)
    {
        return await this._defaultService.SaveFormAsync(form);
    }

    /// <summary>
    /// 获取组织架构树
    /// </summary>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看组织架构树")]
    [HttpPost("SysOrganizationTree")]
    public async Task<dynamic> GetSysOrganizationTreeAsync()
    {
        var expandedRowKeys = new List<int>();
        var data = await this._defaultService.GetSysOrganizationTreeAsync(expandedRowKeys, null, null);

        return new
        {
            expandedRowKeys,
            allKeys = await this._sysOrganizationRepository.Select.OrderBy(w => w.OrderNumber).Select(w => w.Id).ToListAsync(),
            rows = await this._defaultService.GetSysOrganizationTreeAsync(data)
        };
    }




}