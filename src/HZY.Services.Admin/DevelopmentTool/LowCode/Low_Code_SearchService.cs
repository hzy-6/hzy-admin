using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.EFCore.Models;
using HZY.Infrastructure;
using HZY.Models.Entities;
using HZY.Services.Admin.Framework;
using HZY.Services.Admin.BaseServicesAdmin;
using Microsoft.AspNetCore.Http;
using HZY.EFCore.Repositories.DevelopmentTool.LowCode;

namespace HZY.Services.Admin
{
    /// <summary>
    /// 服务 Low_Code_SearchService
    /// </summary>
    public class Low_Code_SearchService : AdminBaseService<Low_Code_SearchRepository>
    {
        public Low_Code_SearchService(Low_Code_SearchRepository defaultRepository) 
            : base(defaultRepository)
        {

        }




    }
}