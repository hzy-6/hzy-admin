using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HZY.Admin.Services.Framework;
using HZY.Repository.Domain.Framework;
using HZY.Common;
using Microsoft.AspNetCore.Mvc;
using HZY.Framework.Permission.Attributes;
using HZY.Repository.AppCore.Attributes;
using HZY.Admin.Services.Dto;
using HZY.Repository.AppCore.Models;

namespace HZY.Admin.Controllers.Framework
{
    [ControllerDescriptor("38d864ff-f6e7-43af-8c5c-8bbcf9fa586d")]
    public class SysRoleMenuFunctionController : AdminBaseController<SysRoleMenuFunctionService>
    {
        private readonly SysRoleService _sysRoleService;

        public SysRoleMenuFunctionController(SysRoleMenuFunctionService defaultService,
            SysRoleService sysRoleService) : base(defaultService)
        {
            _sysRoleService = sysRoleService;
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
        /// 获取列表
        /// </summary>
        /// <param name="page"></param>
        /// <param name="rows"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpPost("FindList/{page}/{rows}")]
        public async Task<PagingViewModel> FindListAsync([FromRoute] int page, [FromRoute] int rows, [FromBody] SysRole search)
        {
            return await this._sysRoleService.FindListAsync(page, rows, search);
        }


        /// <summary>
        /// 保存
        /// </summary>
        /// <param name="form"></param>
        /// <returns></returns>
        [Transactional]
        [HttpPost("SaveForm")]
        public async Task<Guid> SaveFormAsync([FromBody] SysRoleMenuFunctionDto form)
        {
            return await this.DefaultService.SaveFormAsync(form);
        }

        #region 角色菜单功能 Tree

        /// <summary>
        /// 获取菜单功能树
        /// </summary>
        /// <returns></returns>
        [HttpGet("FindRoleMenuFunctionTree/{RoleId}")]
        public async Task<dynamic> FindRoleMenuFunctionTreeAsync(Guid roleId)
        {
            var (guids, objects) = await this.DefaultService.GetRoleMenuFunctionTreeAsync(roleId);

            return new { expandedRowKeys = guids, list = objects };
        }

        #endregion
    }
}