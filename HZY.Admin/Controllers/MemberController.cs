using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HZY.Admin.Core;
using HZY.Admin.Services;
using HZY.Framework.Attributes;
using HZY.Framework.Controllers;
using HZY.Framework.Model;
using HZY.Repository.Entity;
using HZY.Repository.Attributes;
using HZY.Toolkit;
using Microsoft.AspNetCore.Mvc;

namespace HZY.Admin.Controllers
{
    [AdminAuthorization(MenuId = "38d864ff-f6e7-43af-8c5c-8bbcf9fa586d")]
    public class MemberController : AdminBaseController<MemberService>
    {
        public MemberController(MemberService defaultService) : base(defaultService)
        {
        }

        /// <summary>
        /// 列表页
        /// </summary>
        /// <returns></returns>
        [HttpGet(nameof(Index))]
        public IActionResult Index()
        {
            return View();
        }

        /// <summary>
        /// 编辑页
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("Info/{id?}")]
        public IActionResult Info(Guid id)
        {
            return View(id);
        }

        /// <summary>
        /// 获取列表
        /// </summary>
        /// <param name="page"></param>
        /// <param name="rows"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpPost("FindList/{page}/{rows}")]
        public async Task<ApiResult> FindListAsync([FromRoute] int page, [FromRoute] int rows, [FromBody] Member search)
        {
            return this.ResultOk(await this.DefaultService.FindListAsync(page, rows, search));
        }

        /// <summary>
        /// 根据id数组删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [Transactional]
        [HttpPost("DeleteList")]
        public async Task<ApiResult> DeleteListAsync([FromBody] List<Guid> ids)
        {
            await this.DefaultService.DeleteListAsync(ids);
            return this.ResultOk("ok");
        }

        /// <summary>
        /// 查询表单数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("FindForm/{id?}")]
        public async Task<ApiResult> FindFormAsync([FromRoute] Guid id)
        {
            return this.ResultOk(await this.DefaultService.FindFormAsync(id));
        }

        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="form"></param>
        /// <returns></returns>
        [AdminCheckModel]
        [Transactional]
        [HttpPost("SaveForm")]
        public async Task<ApiResult> SaveFormAsync([FromForm] Member form)
        {
            return this.ResultOk(await this.DefaultService.SaveFormAsync(form, Request.Form.Files));
        }

        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpPost("ExportExcel")]
        public async Task<FileContentResult> ExportExcelAsync([FromBody] Member search)
            => this.File(await this.DefaultService.ExportExcelAsync(search), Tools.GetFileContentType[".xls"].ToStr(),
                $"{Guid.NewGuid()}.xls");
    }
}