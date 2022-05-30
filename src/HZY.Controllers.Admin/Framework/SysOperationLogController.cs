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
/// 操作日志控制器
/// </summary>
[ControllerDescriptor(MenuId = "24", DisplayName = "操作日志")]
public class SysOperationLogController : AdminBaseController<SysOperationLogService>
{
    public SysOperationLogController(SysOperationLogService defaultService) : base(defaultService)
    {

    }

    /// <summary>
    /// 获取表单数据
    /// </summary>
    /// <param name="size"></param>
    /// <param name="page"></param>
    /// <param name="search"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看列表")]
    [HttpPost("FindList/{size}/{page}")]
    public async Task<PagingView> FindListAsync([FromRoute] int size, [FromRoute] int page, [FromBody] SysOperationLogSearchDto search)
    {
        return await _defaultService.FindListAsync(page, size, search);
    }

    /// <summary>
    /// 删除所有数据
    /// </summary>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "删除数据")]
    [HttpGet("DeleteAllData")]
    public async Task<bool> DeleteAllDataAsync()
    {
        return await _defaultService.DeletedAllData();
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看表单")]
    [HttpGet("FindForm/{id?}")]
    public async Task<Dictionary<string, object>> FindFormAsync([FromRoute] Guid id)
    {
        return await this._defaultService.FindFormAsync(id);
    }

}