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

namespace HZY.Controllers.Admin.Framework
{
    public class SysDataAuthorityCustomController : AdminBaseController<SysDataAuthorityCustomService>
    {
        public SysDataAuthorityCustomController(SysDataAuthorityCustomService defaultService)
            : base("", defaultService)
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
        [ActionDescriptor(AdminFunctionConsts.Function_Display)]
        [HttpPost("FindList/{size}/{page}")]
        public async Task<PagingViewModel> FindListAsync([FromRoute] int size, [FromRoute] int page, [FromBody] SysDataAuthorityCustom search)
        {
            return await this.DefaultService.FindListAsync(page, size, search);
        }

        /// <summary>
        /// 根据id数组删除
        /// </summary>
        /// <param name="ids">ids</param>
        /// <returns></returns>
        [ActionDescriptor(AdminFunctionConsts.Function_Delete)]
        [Transactional]
        [HttpPost("DeleteList")]
        public async Task<bool> DeleteListAsync([FromBody] List<Guid> ids)
        {
            await this.DefaultService.DeleteListAsync(ids);
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
            return this.DefaultService.FindFormAsync(id);
        }

        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="form">form</param>
        /// <returns></returns>
        [ActionDescriptor(AdminFunctionConsts.Function_Save)]
        [ApiCheckModel]
        [Transactional]
        [HttpPost("SaveForm")]
        public Task<SysDataAuthorityCustom> SaveFormAsync([FromBody] SysDataAuthorityCustom form)
        {
            return this.DefaultService.SaveFormAsync(form);
        }

        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [ApiResourceCacheFilter(5)]
        [ActionDescriptor(AdminFunctionConsts.Function_Export)]
        [HttpPost("ExportExcel")]
        public async Task<FileContentResult> ExportExcelAsync([FromBody] SysDataAuthorityCustom search)
            => this.File(await this.DefaultService.ExportExcelAsync(search), Tools.GetFileContentType[".xls"].ToStr(),
                $"{Guid.NewGuid()}.xls");




    }
}