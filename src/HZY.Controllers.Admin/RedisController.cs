using HZY.Controllers.Admin.ControllersAdmin;
using HZY.Controllers.Admin.Framework;
using HZY.Infrastructure.Filters;
using HZY.Repositories.Redis;
using Microsoft.AspNetCore.Mvc;

namespace HZY.Controllers.Admin;

[ApiResultFilter]
[Route("api/[controller]")]
public class RedisController : AdminBaseController
{
    public RedisController() : base("")
    {
    }

    //private readonly BaseRedisRepository _redisRepository;

    //public RedisController(RedisRepository redisRepository)
    //{
    //    _redisRepository = redisRepository;
    //}

    ///// <summary>
    ///// 测试 消息订阅
    ///// </summary>
    ///// <param name="key"></param>
    ///// <returns></returns>
    //[HttpGet("{key}")]
    //public string Test(string key)
    //{
    //    _redisRepository.Listener(key);
    //    return "调用成功!";
    //}

}