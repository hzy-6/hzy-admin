using HZY.Controllers.Admin.ControllersAdmin;
using HZY.EFCore.Models;
using HZY.Infrastructure;
using HZY.Infrastructure.Filters;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Models.DTO;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Models.Entities.LowCode;
using HZY.Repositories.Framework;
using HZY.Services.Accounts;
using HZY.Services.Admin;
using HZY.Services.Admin.Framework;
using HZY.Services.Admin.Memebers;
using HZY.Services.Consts;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Controllers.Admin
{
    public class Low_Code_Table_InfoController : AdminBaseController<Low_Code_Table_InfoService>
    {
        public Low_Code_Table_InfoController(Low_Code_Table_InfoService defaultService)
            : base("请设置菜单Id 系统菜单表中查找", defaultService)
        {
            this.SetMenuName("Low_Code_Table_Info");
        }

        /// <summary>
        /// 获取列表
        /// </summary>
        /// <param name="size"></param>
        /// <param name="page"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpPost("FindList/{size}/{page}")]
        public async Task<PagingViewModel> FindListAsync([FromRoute] int size, [FromRoute] int page, [FromBody] Low_Code_Table_Info search)
        {
            return await this.DefaultService.FindListAsync(page, size, search);
        }

        /// <summary>
        /// 根据id数组删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpPost("DeleteList")]
        public async Task<bool> DeleteListAsync([FromBody] List<Guid> ids)
        {
            await this.DefaultService.DeleteListAsync(ids);
            return true;
        }

        /// <summary>
        /// 同步表
        /// </summary>
        /// <returns></returns>
        [HttpPost("Synchronization/{tableId}")]
        public Task SynchronizationAsync([FromRoute] Guid tableId)
        {
            return this.DefaultService.SynchronizationColumnByTableIdAsync(tableId);
        }

        /// <summary>
        /// 变更数据
        /// </summary>
        /// <param name="low_Code_Table_Infos"></param>
        /// <returns></returns>
        [HttpPost("Change")]
        public Task ChangeAsync([FromBody] List<Low_Code_Table_Info> low_Code_Table_Infos)
        {
            return this.DefaultService.ChangeAsync(low_Code_Table_Infos);
        }

    }
}