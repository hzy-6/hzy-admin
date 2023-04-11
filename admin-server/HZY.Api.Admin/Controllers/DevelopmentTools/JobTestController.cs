namespace HZY.Api.Admin.Controllers.DevelopmentTools;

/// <summary>
/// JobTestController
/// </summary>
public class JobTestController : AdminControllerBase
{

    /// <summary>
    /// 调用测试接口
    /// </summary>
    /// <returns></returns>
    [HttpGet]
    public string? Test()
    {
        return "调用测试接口成功!";
    }


}
