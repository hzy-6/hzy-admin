using HZY.Controllers.Admin.ControllersAdmin;
using HZY.EFCore.Models;
using HZY.Infrastructure;
using HZY.Infrastructure.Filters;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Models.DTO;
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
public class SysDictionaryController : AdminBaseController<SysDictionaryService>
{
    public SysDictionaryController(SysDictionaryService defaultService) : base("23", defaultService)
    {
        this.SetMenuName("数据字典");
    }

    /// <summary>
    /// 获取列表
    /// </summary>
    /// <param name="size"></param>
    /// <param name="page"></param>
    /// <param name="search"></param>
    /// <returns></returns>
    [HttpPost("FindList/{size}/{page}")]
    public async Task<PagingViewModel> FindListAsync([FromRoute] int size, [FromRoute] int page, [FromBody] SysDictionary search)
    {
        return await this._defaultService.FindListAsync(page, size, search);
    }

    /// <summary>
    /// 根据id数组删除
    /// </summary>
    /// <param name="ids"></param>
    /// <returns></returns>
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
    [HttpGet("FindForm/{id?}")]
    public async Task<Dictionary<string, object>> FindFormAsync([FromRoute] int id)
    {
        return await this._defaultService.FindFormAsync(id);
    }

    /// <summary>
    /// 保存
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [HttpPost("SaveForm")]
    public async Task<SysDictionary> SaveFormAsync([FromBody] SysDictionary form)
    {
        return await this._defaultService.SaveFormAsync(form);
    }

    /// <summary>
    /// 导出Excel
    /// </summary>
    /// <param name="search"></param>
    /// <returns></returns>
    [ApiResourceCacheFilter(10)]
    [HttpPost("ExportExcel")]
    public async Task ExportExcelAsync([FromBody] SysDictionary search)
        => base.HttpContext.DownLoadFile(await this._defaultService.ExportExcelAsync(search), Tools.GetFileContentType[".xls"].ToStr(),
            $"{this.GetMenuName()}列表数据 {DateTime.Now.ToString("yyyy-MM-dd")}.xls");

    /// <summary>
    /// 获取字典树
    /// </summary>
    /// <returns></returns>
    [HttpGet("GetDictionaryTree")]
    public async Task<List<SysDictionaryDto>> GetDictionaryTreeAsync()
    {
        return await this._defaultService.GetDictionaryTreeAsync();
    }

}