using HZY.Infrastructure.Controllers;
using HZY.Infrastructure.Filters;
using HZY.Models.DTO;
using HZY.Services.Accounts;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace HZY.WebHost.Controllers;

/// <summary>
/// 账户控制器
/// </summary>
[ApiResultFilter]
[ApiController]
[Route("api/[controller]")]
public class AccountController : ApiBaseController
{
    private const string tokenType = "Bearer ";
    private readonly IAccountService _accountService;

    public AccountController(IAccountService accountService)
    {
        _accountService = accountService;
    }

    /// <summary>
    /// 检查帐户并获取 token
    /// </summary>
    /// <param name="authUserDto">Dto</param>
    /// <returns></returns>
    [HttpPost("Check")]
    public async Task<dynamic> CheckAsync([FromBody] AuthUserFormDto authUserDto)
    {
        var token = await this._accountService
            .CheckAccountAsync(authUserDto.UserName, authUserDto.UserPassword, authUserDto.LoginCode);
        return new { token = token, tokenType };
    }
}