using Microsoft.AspNetCore.Mvc;

namespace HZY.Framework.Controllers
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
    [Route("Admin/[controller]")]
    public class AdminBaseController : FrameworkBaseController
    {
    }
}