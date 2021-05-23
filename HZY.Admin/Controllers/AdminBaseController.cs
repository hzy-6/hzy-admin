using HZY.Framework;
using HZY.Framework.Controllers;
using HZY.Framework.Filters;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace HZY.Admin.Controllers
{
    /// <summary>
    /// 控制器服务
    /// </summary>
    /// <typeparam name="TDefaultService">默认服务类型</typeparam>
    public class AdminBaseController<TDefaultService> : AdminBaseController where TDefaultService : class
    {
        /// <summary>
        /// 默认服务
        /// </summary>
        protected readonly TDefaultService DefaultService;

        public AdminBaseController(TDefaultService defaultService)
        {
            this.DefaultService = defaultService;
        }
    }

    /// <summary>
    /// 控制器服务
    /// </summary>
    [ApiResultFilter]
    [Route("Admin/[controller]")]
    public class AdminBaseController : FrameworkBaseController
    {
    }
}