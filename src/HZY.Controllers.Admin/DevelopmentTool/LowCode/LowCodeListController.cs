using HZY.EFCore.PagingViews;
using HZY.Infrastructure;
using HZY.Infrastructure.Controllers;
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
    [ControllerDescriptor(MenuId = "请设置菜单Id 系统菜单表中查找", DisplayName = nameof(LowCodeListController))]
    public class LowCodeListController : AdminBaseController<LowCodeListService>
    {
        public LowCodeListController(LowCodeListService defaultService)
            : base(defaultService)
        {

        }



    }
}