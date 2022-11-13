using HZY.Managers.Accounts;
using HZY.Infrastructure;
using HZY.Infrastructure.Controllers;
using HZY.Infrastructure.Filters;
using HZY.Models.DTO;
using HZY.Models.DTO.Framework;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;

namespace HZY.Web.Host.Controllers
{
    /// <summary>
    /// 账户控制器
    /// </summary>
    [ApiResultFilter]
    [ApiController]
    [Route("api/[controller]")]
    [ApiExplorerSettings(GroupName = nameof(ApiVersions.Public))]
    public class AccountController : ApiBaseController
    {
        private const string tokenType = $"{JwtBearerDefaults.AuthenticationScheme} ";
        private readonly IAccountManager _accountService;

        public AccountController(IAccountManager accountService)
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
            var token = await _accountService
                .CheckAccountAsync(authUserDto.UserName, authUserDto.UserPassword, authUserDto.LoginCode);
            return new { token = tokenType + token, tokenType };
        }
    }
}
