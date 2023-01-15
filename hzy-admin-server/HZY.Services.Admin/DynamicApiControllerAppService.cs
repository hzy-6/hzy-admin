using HZY.Framework.DynamicApiController;
using HZY.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Services.Admin
{
    /// <summary>
    /// 动态 api controller demo
    /// </summary>
    [ApiExplorerSettings(GroupName = nameof(ApiVersions.DynamicApiController))]
    [Route("/api/[controller]/[action]")]
    public class DynamicApiControllerAppService : IDynamicApiController
    {

        /// <summary>
        /// 获取名称
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public string GetName(string name)
        {
            return "动态 Api 返回数据信息" + name;
        }

    }
}
