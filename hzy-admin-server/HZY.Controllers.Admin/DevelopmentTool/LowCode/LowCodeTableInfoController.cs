using HZY.EntityFramework.PagingViews;
using HZY.Infrastructure;
using HZY.Infrastructure.Controllers;
using HZY.Infrastructure.Filters;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Models.DTO;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Models.Entities.LowCode;
using HZY.Services.Admin;
using HZY.Services.Admin.Framework;
using HZY.Services.Admin.Memebers;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Controllers.Admin
{
    [ControllerDescriptor(MenuId = "请设置菜单Id 系统菜单表中查找", DisplayName = nameof(LowCodeSearchController))]
    public class LowCodeTableInfoController : AdminBaseController<LowCodeTableInfoService>
    {
        public LowCodeTableInfoController(LowCodeTableInfoService defaultService)
            : base(defaultService)
        {

        }

        /// <summary>
        /// 获取列表
        /// </summary>
        /// <param name="pagingSearchInput"></param>
        /// <returns></returns>
        [HttpPost("FindList")]
        public async Task<PagingView> FindListAsync([FromBody] PagingSearchInput<LowCodeTableInfo> pagingSearchInput)
        {
            return await this._defaultService.FindListAsync(pagingSearchInput);
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
        /// 同步表
        /// </summary>
        /// <returns></returns>
        [HttpPost("Synchronization/{tableId}")]
        public Task SynchronizationAsync([FromRoute] Guid tableId)
        {
            return this._defaultService.SynchronizationColumnByTableIdAsync(tableId);
        }

        /// <summary>
        /// 变更数据
        /// </summary>
        /// <param name="lowCodeTableInfos"></param>
        /// <returns></returns>
        [HttpPost("Change")]
        public Task ChangeAsync([FromBody] List<LowCodeTableInfo> lowCodeTableInfos)
        {
            return this._defaultService.ChangeAsync(lowCodeTableInfos);
        }

    }
}