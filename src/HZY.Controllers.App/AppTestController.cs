using Microsoft.AspNetCore.Mvc;

namespace HZY.Controllers.App;

/// <summary>
/// App 接口测试
/// </summary>
public class AppTestController : AppBaseController
{
    [HttpGet]
    public string Get()
    {
        return "App 接口 测试通过!";
    }

}