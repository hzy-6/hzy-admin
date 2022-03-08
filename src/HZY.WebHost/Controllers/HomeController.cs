using HZY.Infrastructure.Controllers;
using Microsoft.AspNetCore.Mvc;

namespace HZY.WebHost.Controllers;

[ApiExplorerSettings(IgnoreApi = true)]
public class HomeController : ApiBaseController
{
    [HttpGet("/Home/Error")]
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        //return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        return Content("程序异常，请查看错误日志!");
    }
}