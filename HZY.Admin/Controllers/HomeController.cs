using System;
using System.Threading.Tasks;
using HZY.Admin.Services.Framework;
using HZY.Framework.Attributes;
using HZY.Framework.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace HZY.Admin.Controllers
{
    [AdminAuthorization]
    public class HomeController : AdminBaseController<SysMenuService>
    {
        private readonly AccountService _accountService;

        public HomeController(SysMenuService defaultService, AccountService accountService) : base(defaultService)
        {
            _accountService = accountService;
        }

        [HttpGet(nameof(Index)), Route(""), Route("/")]
        public async Task<IActionResult> Index()
        {
            var allList = await this.DefaultService.GetMenuByRoleIdAsync();

            ViewData["menuList"] = this.DefaultService.CreateMenus(Guid.Empty, allList);
            ViewData["UserName"] = this._accountService.GetAccountInfo().UserName;

            return View();
        }

        [HttpGet(nameof(Main))]
        public IActionResult Main()
        {
            //Reids 使用例子
            //await this.redisService.AddOrUpdateByKeyAsync("mykey", "123");

            return View();
        }
    }
}