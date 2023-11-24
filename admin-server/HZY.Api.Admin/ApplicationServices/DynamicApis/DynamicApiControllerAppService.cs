namespace HZY.Api.Admin.ApplicationServices.DynamicApis;

/// <summary>
/// 动态 api controller demo
/// </summary>
[Route("/api/[controller]/[action]")]
public class DynamicApiControllerAppService : IDynamicApiController
{

    /// <summary>
    /// 获取名称
    /// </summary>
    /// <param name="name"></param>
    /// <returns></returns>
    [HttpGet("/{name}")]
    public string? GetName([FromRoute] string name)
    {
        return "动态 Api 返回数据信息" + name;
    }

    /// <summary>
    /// 测试定时任务
    /// </summary>
    /// <returns></returns>
    [Scheduled(false)]
    [NonAction]
    public string Run()
    {
        return "运行成功！！！";
    }

}
