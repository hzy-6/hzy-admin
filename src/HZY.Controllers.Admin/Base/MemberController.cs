using HZY.Controllers.Admin.ControllersAdmin;
using HZY.EFCore.Attributes;
using HZY.EFCore.Models;
using HZY.Infrastructure;
using HZY.Infrastructure.Filters;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Models.DTO;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Repositories.Framework;
using HZY.Services.Accounts;
using HZY.Services.Admin.Framework;
using HZY.Services.Admin.Memebers;
using HZY.Services.Consts;
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
public class MemberController : AdminBaseController<MemberService>
{
    public MemberController(MemberService defaultService) : base("13", defaultService)
    {

    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="size"></param>
    /// <param name="page"></param>
    /// <param name="search"></param>
    /// <returns></returns>
    [ApiResourceCacheFilter(1)]
    [ActionDescriptor(AdminFunctionConsts.Function_Display)]
    [HttpPost("FindList/{size}/{page}")]
    public async Task<PagingViewModel> FindListAsync([FromRoute] int size, [FromRoute] int page, [FromBody] Member search)
    {
        return await this.DefaultService.FindListAsync(page, size, search);
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
    [ActionDescriptor(AdminFunctionConsts.Function_Delete)]
    [HttpPost("DeleteList")]
    public async Task<bool> DeleteListAsync([FromBody] List<Guid> ids)
    {
        await this.DefaultService.DeleteListAsync(ids);
        return true;
    }

    /// <summary>
    /// 查询表单数据
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    [ActionDescriptor(AdminFunctionConsts.Function_Display)]
    [HttpGet("FindForm/{id?}")]
    public async Task<Dictionary<string, object>> FindFormAsync([FromRoute] Guid id)
    {
        return await this.DefaultService.FindFormAsync(id);
    }

    /// <summary>
    /// 保存
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [ActionDescriptor(AdminFunctionConsts.Function_Save)]
    [ApiCheckModel]
    [HttpPost("SaveForm")]
    public async Task<Member> SaveFormAsync([FromForm] Member form)
    {
        return await this.DefaultService.SaveFormAsync(form, Request.Form.Files);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    [ApiResourceCacheFilter(5)]
    [ActionDescriptor(AdminFunctionConsts.Function_Export)]
    [HttpPost("ExportExcel")]
    public async Task<FileContentResult> ExportExcelAsync([FromBody] Member search)
        => this.File(await this.DefaultService.ExportExcelAsync(search), Tools.GetFileContentType[".xls"].ToStr(),
            $"{Guid.NewGuid()}.xls");
}