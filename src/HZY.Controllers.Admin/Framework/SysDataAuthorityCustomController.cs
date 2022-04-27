using HZY.Controllers.Admin.ControllersAdmin;
using HZY.EFCore.Models;
using HZY.Infrastructure;
using HZY.Infrastructure.Filters;
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

namespace HZY.Controllers.Admin.Framework
{
    public class SysDataAuthorityCustomController : AdminBaseController<SysDataAuthorityCustomService>
    {
        public SysDataAuthorityCustomController(SysDataAuthorityCustomService defaultService)
            : base("", defaultService)
        {
            this.SetMenuName("自定义数据权限");
        }


        /// <summary>
        /// 获取列表
        /// </summary>
        /// <param name="size">size</param>
        /// <param name="page">page</param>
        /// <param name="search">search</param>
        /// <returns></returns>
        [ApiResourceCacheFilter(1)]
        [ActionDescriptor(AdminFunctionConsts.Function_Display)]
        [HttpPost("FindList/{size}/{page}")]
        public async Task<PagingViewModel> FindListAsync([FromRoute] int size, [FromRoute] int page, [FromBody] SysDataAuthorityCustom search)
        {
            return await this._defaultService.FindListAsync(page, size, search);
        }

        /// <summary>
        /// 根据id数组删除
        /// </summary>
        /// <param name="ids">ids</param>
        /// <returns></returns>
        [ActionDescriptor(AdminFunctionConsts.Function_Delete)]
        [HttpPost("DeleteList")]
        public async Task<bool> DeleteListAsync([FromBody] List<Guid> ids)
        {
            await this._defaultService.DeleteListAsync(ids);
            return true;
        }

        /// <summary>
        /// 查询表单数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        [ActionDescriptor(AdminFunctionConsts.Function_Display)]
        [HttpGet("FindForm/{id?}")]
        public Task<Dictionary<string, object>> FindFormAsync([FromRoute] Guid id)
        {
            return this._defaultService.FindFormAsync(id);
        }

        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="form">form</param>
        /// <returns></returns>
        [ActionDescriptor(AdminFunctionConsts.Function_Save)]
        [ApiCheckModel]
        [HttpPost("SaveForm")]
        public Task<SysDataAuthorityCustom> SaveFormAsync([FromBody] SysDataAuthorityCustom form)
        {
            return this._defaultService.SaveFormAsync(form);
        }

        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [ApiResourceCacheFilter(5)]
        [ActionDescriptor(AdminFunctionConsts.Function_Export)]
        [HttpPost("ExportExcel")]
        public async Task ExportExcelAsync([FromBody] SysDataAuthorityCustom search)
        => base.HttpContext.DownLoadFile(await this._defaultService.ExportExcelAsync(search), Tools.GetFileContentType[".xls"].ToStr(),
            $"{this.GetMenuName()}列表数据 {DateTime.Now.ToString("yyyy-MM-dd")}.xls");




    }
}