using HZY.EntityFramework.PagingViews;
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

namespace HZY.Controllers.Admin.Framework
{
    [ControllerDescriptor(MenuId = "请设置菜单Id 系统菜单表中查找", DisplayName = "自定义数据权限")]
    public class SysDataAuthorityCustomController : AdminBaseController<SysDataAuthorityCustomService>
    {
        public SysDataAuthorityCustomController(SysDataAuthorityCustomService defaultService)
            : base(defaultService)
        {

        }


        /// <summary>
        /// 获取列表
        /// </summary>
        /// <param name="pagingSearchInput"></param>
        /// <returns></returns>
        [ApiResourceCacheFilter(1)]
        [ActionDescriptor(AdminFunctionConsts.Function_Display, DisplayName = "查看列表")]
        [HttpPost("FindList")]
        public async Task<PagingView> FindListAsync([FromBody] PagingSearchInput<SysDataAuthorityCustom> pagingSearchInput)
        {
            return await this._defaultService.FindListAsync(pagingSearchInput);
        }

        /// <summary>
        /// 根据id数组删除
        /// </summary>
        /// <param name="ids">ids</param>
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
        /// <param name="id">id</param>
        /// <returns></returns>
        [ActionDescriptor(AdminFunctionConsts.Function_Display, DisplayName = "查看表单数据")]
        [HttpGet("FindForm/{id?}")]
        public Task<Dictionary<string, object>> FindFormAsync([FromRoute] Guid id)
        {
            return this._defaultService.FindFormAsync(id);
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
        public Task CreateAsync([FromBody] SysDataAuthorityCustom form)
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
        public Task UpdateAsync([FromBody] SysDataAuthorityCustom form)
        {
            return this._defaultService.SaveFormAsync(form);
        }

        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="pagingSearchInput"></param>
        /// <returns></returns>
        [ApiResourceCacheFilter(5)]
        [ActionDescriptor(AdminFunctionConsts.Function_Export, DisplayName = "导出数据")]
        [HttpPost("ExportExcel")]
        public async Task ExportExcelAsync([FromBody] PagingSearchInput<SysDataAuthorityCustom> pagingSearchInput)
        => base.HttpContext.DownLoadFile(await this._defaultService.ExportExcelAsync(pagingSearchInput), Tools.GetFileContentType[".xls"].ToStr(),
            $"{PermissionUtil.GetControllerDisplayName(this.GetType())}列表数据 {DateTime.Now.ToString("yyyy-MM-dd")}.xls");




    }
}