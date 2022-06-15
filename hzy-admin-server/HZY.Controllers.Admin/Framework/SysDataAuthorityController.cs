using HZY.EFCore.PagingViews;
using HZY.Infrastructure;
using HZY.Infrastructure.Controllers;
using HZY.Infrastructure.Filters;
using HZY.Infrastructure.Permission;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Models.Consts;
using HZY.Models.DTO;
using HZY.Models.DTO.Framework;
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
    [ControllerDescriptor(MenuId = "请设置菜单Id 系统菜单表中查找", DisplayName = "数据权限")]
    public class SysDataAuthorityController : AdminBaseController<SysDataAuthorityService>
    {
        public SysDataAuthorityController(SysDataAuthorityService defaultService)
            : base(defaultService)
        {

        }


        /// <summary>
        /// 获取列表
        /// </summary>
        /// <param name="size">size</param>
        /// <param name="page">page</param>
        /// <param name="search">search</param>
        /// <returns></returns>
        [ApiResourceCacheFilter(1)]
        [ActionDescriptor(AdminFunctionConsts.Function_Display, DisplayName = "查看列表")]
        [HttpPost("FindList/{size}/{page}")]
        public async Task<PagingView> FindListAsync([FromRoute] int size, [FromRoute] int page, [FromBody] SysDataAuthority search)
        {
            return await this._defaultService.FindListAsync(page, size, search);
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
        [ActionDescriptor(AdminFunctionConsts.Function_Display, DisplayName = "查看表单")]
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
        [ActionDescriptor(AdminFunctionConsts.Function_Save, DisplayName = "保存/编辑表单")]
        [ApiCheckModel]
        [HttpPost("SaveForm")]
        public Task<SysDataAuthority> SaveFormAsync([FromBody] SysDataAuthorityFormDto form)
        {
            return this._defaultService.SaveFormAsync(form);
        }

        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [ApiResourceCacheFilter(5)]
        [ActionDescriptor(AdminFunctionConsts.Function_Export, DisplayName = "导出数据")]
        [HttpPost("ExportExcel")]
        public async Task ExportExcelAsync([FromBody] SysDataAuthority search)
        => base.HttpContext.DownLoadFile(await this._defaultService.ExportExcelAsync(search), Tools.GetFileContentType[".xls"].ToStr(),
            $"{PermissionUtil.GetControllerDisplayName(this.GetType())}列表数据 {DateTime.Now.ToString("yyyy-MM-dd")}.xls");

        /// <summary>
        /// 根据角色id获取数据权限信息
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        [ActionDescriptor(DisplayName = "获取数据权限信息")]
        [ApiResourceCacheFilter(10)]
        [HttpGet("GetDataAuthorityByRoleId/{roleId?}")]
        public Task<Dictionary<string, object>> GetDataAuthorityByRoleIdAsync([FromRoute] Guid roleId)
        {
            return this._defaultService.GetDataAuthorityByRoleIdAsync(roleId);
        }


    }
}