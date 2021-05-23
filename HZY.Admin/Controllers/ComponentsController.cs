using HZY.Admin.Services.Framework;
using HZY.Framework.Permission.Attributes;
using Microsoft.AspNetCore.Mvc;

namespace HZY.Admin.Controllers
{
    [ControllerDescriptor]
    public class ComponentsController : AdminBaseController<SysMenuService>
    {
        public ComponentsController(SysMenuService defaultService) : base(defaultService)
        {
        }

        [HttpGet(nameof(Index))]
        public IActionResult Index()
        {
            return View();
        }

    }
}