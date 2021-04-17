using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HZY.Admin.Services.Framework;
using HZY.Framework.Attributes;
using HZY.Framework.Controllers;
using HZY.Framework.Model;
using HZY.Repository.Attributes;
using HZY.Common;
using Microsoft.AspNetCore.Mvc;
using HZY.Repository.Domain.Framework;
using HZY.Admin.Services.Dto;
using HZY.Admin.Services.Bo;

namespace HZY.Admin.Controllers.Framework
{
    [ControllerDescriptor("38d864ff-f6e7-43af-8c5c-8bbcf9fa586d")]
    public class SysMenuController : AdminBaseController<SysMenuService>
    {
        private readonly AccountInfo _accountInfo;

        public SysMenuController(SysMenuService defaultService, AccountService accountService) : base(defaultService)
        {
            this._accountInfo = accountService.GetAccountInfo();
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
        /// <param name="pId"></param>
        /// <returns></returns>
        [HttpGet("Info/{id?}")]
        public IActionResult Info(Guid id, Guid? pId)
        {
            ViewData["pId"] = pId;
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
        public async Task<ApiResult> FindListAsync([FromRoute] int page, [FromRoute] int rows, [FromBody] SysMenu search)
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
        [Transactional]
        [HttpPost("SaveForm")]
        public async Task<ApiResult> SaveFormAsync([FromBody] SysMenuFormDto form)
        {
            return this.ResultOk(await this.DefaultService.SaveFormAsync(form));
        }

        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpPost("ExportExcel")]
        public async Task<FileContentResult> ExportExcelAsync([FromBody] SysMenu search)
            => this.File(await this.DefaultService.ExportExcelAsync(search), Tools.GetFileContentType[".xls"].ToStr(), $"{Guid.NewGuid()}.xls");

        #region 获取 菜单 树

        /// <summary>
        /// 获取菜单列表 以及 页面按钮权限
        /// </summary>
        /// <returns></returns>
        [HttpGet("FindSysMenuTree")]
        public async Task<ApiResult> FindSysMenuTreeAsync()
        {
            var allList = await DefaultService.GetMenuByRoleIdAsync();

            return this.ResultOk(new
            {
                userName = this._accountInfo.UserName,
                list = this.DefaultService.CreateMenus(Guid.Empty, allList),
                allList,
                powerState = await this.DefaultService.GetPowerState(allList)
            });
        }

        /// <summary>
        /// 获取菜单功能树
        /// </summary>
        /// <returns></returns>
        [HttpGet("FindMenuFunctionTree")]
        public async Task<ApiResult> FindMenuFunctionTreeAsync()
        {
            var menuFunctionTree = await this.DefaultService.GetMenuFunctionTreeAsync();

            return this.ResultOk(new
            {
                treeData = menuFunctionTree.Item1,
                defaultExpandedKeys = menuFunctionTree.Item2,
                defaultCheckedKeys = menuFunctionTree.Item3
            });
        }

        #endregion
    }
}