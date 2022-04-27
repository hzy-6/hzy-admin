using HZY.Controllers.Admin.ControllersAdmin;
using HZY.EFCore.Models;
using HZY.Infrastructure;
using HZY.Infrastructure.Filters;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Models.DTO;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
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
    public class Low_Code_ListController : AdminBaseController<Low_Code_ListService>
    {
        public Low_Code_ListController(Low_Code_ListService defaultService)
            : base("请设置菜单Id 系统菜单表中查找", defaultService)
        {
            this.SetMenuName("Low_Code_List");
        }



    }
}