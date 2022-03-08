using Microsoft.AspNetCore.Mvc;

namespace HZY.WebHost.Controllers;

/// <summary>
/// 跳转客户端
/// </summary>
[ApiExplorerSettings(IgnoreApi = true)]
public class JumpClientController : Controller
{
    [Route("")]
    public IActionResult Index()
    {
        return Redirect("/client/index.html");
    }
}