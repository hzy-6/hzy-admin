using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.EFCore.PagingViews;
using HZY.Infrastructure;
using HZY.Models.Entities;
using HZY.Services.Admin.Framework;
using HZY.Services.Admin.Core;
using Microsoft.AspNetCore.Http;
using HZY.EFCore.Repositories.Admin.DevelopmentTool.LowCode;

namespace HZY.Services.Admin
{
    /// <summary>
    /// 服务 Low_Code_SearchService
    /// </summary>
    public class LowCodeSearchService : AdminBaseService<LowCodeSearchRepository>
    {
        public LowCodeSearchService(LowCodeSearchRepository defaultRepository)
            : base(defaultRepository)
        {

        }




    }
}