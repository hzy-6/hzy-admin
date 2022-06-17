using HZY.EFCore.PagingViews;
using HZY.Infrastructure;
using HZY.Infrastructure.Controllers;
using HZY.Infrastructure.Filters;
using HZY.Infrastructure.Permission;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Models.BO;
using HZY.Models.Consts;
using HZY.Models.DTO.Framework;
using HZY.Models.Entities.Framework;
using HZY.Services.Admin.Framework;
using Microsoft.AspNetCore.Mvc;

namespace HZY.Controllers.Admin.Framework;

/// <summary>
/// 系统账号管理
/// </summary>
[ControllerDescriptor(MenuId = "15", DisplayName = "系统账号")]
public class SysUserController : AdminBaseController<SysUserService>
{

    public SysUserController(SysUserService defaultService)
        : base(defaultService)
    {

    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="size"></param>
    /// <param name="page"></param>
    /// <param name="search"></param>
    /// <returns></returns>
    [ActionDescriptor(AdminFunctionConsts.Function_Display, DisplayName = "查看数据")]
    [HttpPost("FindList/{size}/{page}")]
    public async Task<PagingView> FindListAsync([FromRoute] int size, [FromRoute] int page, [FromBody] SysUser search)
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
    [ActionDescriptor(DisplayName = "查询数据")]
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
    [RequestLimitFilter(Duration = 1, LimitCount = 1)]
    [ActionDescriptor(DisplayName = "保存/编辑数据")]
    [HttpPost("SaveForm")]
    [ApiCheckModel]
    public async Task<SysUser> SaveFormAsync([FromBody] SysUserFormDto form)
    {
        return await this._defaultService.SaveFormAsync(form);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    [ActionDescriptor(AdminFunctionConsts.Function_Export, DisplayName = "导出数据")]
    [ApiResourceCacheFilter(10)]
    [HttpPost("ExportExcel")]
    public async Task ExportExcelAsync([FromBody] SysUser search)
    {
        var data = await this._defaultService.ExportExcelAsync(search);
        var name = $"{PermissionUtil.GetControllerDisplayName(this.GetType())}列表数据 {DateTime.Now.ToString("yyyy-MM-dd")}.xls";
        base.HttpContext.DownLoadFile(data, Tools.GetFileContentType[".xls"].ToStr(), name);
    }

    /// <summary>
    /// 获取用户信息
    /// </summary>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "获取用户信息")]
    [ApiResourceCacheFilter(10)]
    [HttpGet("info")]
    public Task<AccountInfo> GetUserInfoAsync()
    {
        return this._defaultService.GetUserInfoAsync();
    }

}