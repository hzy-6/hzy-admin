using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HZY.Common;
using Microsoft.AspNetCore.Mvc;
using HZY.Framework.Permission.Attributes;
using HZY.Admin.Services;
using HZY.Repository.AppCore.Attributes;
using HZY.Repository.Domain;
using HZY.Repository.AppCore.Models;
using HZY.Admin.Filters;

namespace HZY.Admin.Controllers
{
    [ControllerDescriptor("38d864ff-f6e7-43af-8c5c-8bbcf9fa586d")]
    public class MemberController : AdminBaseController<MemberService>
    {
        public MemberController(MemberService defaultService) : base(defaultService)
        {
        }

        /// <summary>
        /// 列表页
        /// </summary>
        /// <returns></returns>
        [ActionDescriptor("Have")]
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
        [ActionDescriptor("Have")]
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
        [ActionDescriptor("Have")]
        [HttpPost("FindList/{page}/{rows}")]
        public async Task<PagingViewModel> FindListAsync([FromRoute] int page, [FromRoute] int rows, [FromBody] Member search)
        {
            return await this.DefaultService.FindListAsync(page, rows, search);
        }

        /// <summary>
        /// 根据id数组删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [ActionDescriptor("Delete")]
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
        /// <param name="id"></param>
        /// <returns></returns>
        [ActionDescriptor("Have")]
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
        [ActionDescriptor("Save")]
        [AdminCheckModel]
        [Transactional]
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
        [ActionDescriptor("GetExcel")]
        [HttpPost("ExportExcel")]
        public async Task<FileContentResult> ExportExcelAsync([FromBody] Member search)
            => this.File(await this.DefaultService.ExportExcelAsync(search), Tools.GetFileContentType[".xls"].ToStr(),
                $"{Guid.NewGuid()}.xls");
    }
}