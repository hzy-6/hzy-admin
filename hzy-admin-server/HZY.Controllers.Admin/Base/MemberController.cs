using HZY.EFCore.PagingViews;
using HZY.Infrastructure;
using HZY.Infrastructure.Controllers;
using HZY.Infrastructure.Filters;
using HZY.Infrastructure.Permission;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Models.Consts;
using HZY.Models.DTO;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Services.Admin.Framework;
using HZY.Services.Admin.Memebers;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Controllers.Admin.Base;

/// <summary>
/// 会员控制器
/// </summary>
[ControllerDescriptor(MenuId = "13", DisplayName = "会员")]
public class MemberController : AdminBaseController<MemberService>
{
    public MemberController(MemberService defaultService) : base(defaultService)
    {

    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="size"></param>
    /// <param name="page"></param>
    /// <param name="search"></param>
    /// <returns></returns>
    [RequestLimitFilter]
    [ApiResourceCacheFilter(1)]
    [ActionDescriptor(AdminFunctionConsts.Function_Display, DisplayName = "查看列表")]
    [HttpPost("FindList/{size}/{page}")]
    public async Task<PagingView> FindListAsync([FromRoute] int size, [FromRoute] int page, [FromBody] Member search)
    {
        return await this._defaultService.FindListAsync(page, size, search);
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    [ActionDescriptor(AdminFunctionConsts.Function_Delete, DisplayName = "删除数据")]
    [HttpPost("DeleteList")]
    public async Task<bool> DeleteListAsync([FromBody] List<Guid> ids)
    {
        await this._defaultService.DeleteListAsync(ids);
        return true;
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    [ActionDescriptor(AdminFunctionConsts.Function_Display, DisplayName = "查看表单")]
    [HttpGet("FindForm/{id?}")]
    public async Task<Dictionary<string, object>> FindFormAsync([FromRoute] Guid id)
    {
        return await this._defaultService.FindFormAsync(id);
    }

    /// <summary>
    /// 保存
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [ActionDescriptor(AdminFunctionConsts.Function_Save, DisplayName = "保存/编辑表单")]
    [ApiCheckModel]
    [HttpPost("SaveForm")]
    public async Task<Member> SaveFormAsync([FromForm] Member form)
    {
        return await this._defaultService.SaveFormAsync(form, Request.Form.Files);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    [ApiResourceCacheFilter(5)]
    [ActionDescriptor(AdminFunctionConsts.Function_Export, DisplayName = "导出数据")]
    [HttpPost("ExportExcel")]
    public async Task ExportExcelAsync([FromBody] Member search)
    {
        var data = await this._defaultService.ExportExcelAsync(search);
        var name = $"{PermissionUtil.GetControllerDisplayName(this.GetType())}列表数据 {DateTime.Now.ToString("yyyy-MM-dd")}.xls";
        base.HttpContext.DownLoadFile(data, Tools.GetFileContentType[".xls"].ToStr(), name);
    }
}