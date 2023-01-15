using HZY.EntityFramework.PagingViews;
using HZY.Infrastructure;
using HZY.Infrastructure.Controllers;
using HZY.Infrastructure.Filters;
using HZY.Infrastructure.Permission;
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
/// 数据字典控制器
/// </summary>
[ControllerDescriptor(MenuId = "23", DisplayName = "数据字典")]
public class SysDictionaryController : AdminBaseController<SysDictionaryService>
{
    public SysDictionaryController(SysDictionaryService defaultService) : base(defaultService)
    {

    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看列表")]
    [HttpPost("FindList")]
    public async Task<List<SysDictionaryDto>> FindListAsync([FromBody] SysDictionary search)
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
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "查看表单")]
    [HttpGet("FindForm/{id?}")]
    public async Task<Dictionary<string, object>> FindFormAsync([FromRoute] int id)
    {
        return await this._defaultService.FindFormAsync(id);
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
    public Task CreateAsync([FromBody] SysDictionary form)
    {
        return this._defaultService.SaveFormAsync(form);
    }

    /// <summary>
    /// 编辑
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [RequestLimitFilter]
    [ActionDescriptor(AdminFunctionConsts.Function_Update, DisplayName = "编辑表单")]
    [HttpPost("Update")]
    [ApiCheckModel]
    public Task UpdateAsync([FromBody] SysDictionary form)
    {
        return this._defaultService.SaveFormAsync(form);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    //[ActionDescriptor(DisplayName = "导出数据")]
    //[ApiResourceCacheFilter(10)]
    //[HttpPost("ExportExcel")]
    //public async Task ExportExcelAsync([FromBody] SysDictionary search)
    //    => base.HttpContext.DownLoadFile(await this._defaultService.ExportExcelAsync(search), Tools.GetFileContentType[".xls"].ToStr(),
    //        $"{PermissionUtil.GetControllerDisplayName(this.GetType())}列表数据 {DateTime.Now.ToString("yyyy-MM-dd")}.xls");

    /// <summary>
    /// 获取字典树
    /// </summary>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "获取字典树")]
    [HttpGet("GetDictionaryTree")]
    public async Task<List<SysDictionaryDto>> GetDictionaryTreeAsync()
    {
        return await this._defaultService.GetDictionaryTreeAsync();
    }

}