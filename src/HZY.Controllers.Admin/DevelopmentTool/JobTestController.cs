using HZY.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Controllers.Admin.DevelopmentTool
{
    /// <summary>
    /// JobTestController
    /// </summary>
    [ApiExplorerSettings(GroupName = nameof(ApiVersions.Job))]
    [Route("api/job/[controller]")]
    [ApiController]
    public class JobTestController : ControllerBase
    {

        /// <summary>
        /// 调用测试接口
        /// </summary>
        /// <returns></returns>
        [HttpGet("Test")]
        public string Test()
        {
            return "调用测试接口成功!";
        }


    }
}
