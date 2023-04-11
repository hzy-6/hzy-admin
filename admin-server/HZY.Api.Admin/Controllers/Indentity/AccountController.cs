namespace HZY.Api.Admin.Controllers.Indentity;

/// <summary>
/// 认证服务
/// </summary>
public class AccountController : IndentityControllerBase
{
    private const string tokenType = $"{JwtBearerDefaults.AuthenticationScheme} ";
    private readonly JwtTokenService _jwtTokenService;
    private readonly IConfiguration _configuration;
    private readonly IAccountService _accountService;

    /// <summary>
    /// 
    /// </summary>
    /// <param name="jwtTokenService"></param>
    /// <param name="configuration"></param>
    /// <param name="accountService"></param>
    public AccountController(JwtTokenService jwtTokenService, IConfiguration configuration, IAccountService accountService)
    {
        _jwtTokenService = jwtTokenService;
        _configuration = configuration;
        _accountService = accountService;
    }

    /// <summary>
    /// 检查账户 登录信息 并返回 token
    /// </summary>
    /// <param name="authUserDto"></param>
    /// <returns></returns>
    [HttpPost]
    public async Task<object> LoginAsync([FromBody] AuthUserFormDto authUserDto)
    {
        var id = await _accountService.LoginAsync(authUserDto);

        var tokenString = _jwtTokenService.CreateTokenByAccountId(id);

        return new
        {
            token = tokenType + tokenString,
            tokenType
        };
    }

    /// <summary>
    /// 
    /// </summary>
    /// <returns></returns>
    [HttpGet("{key}")]
    public object TestConfig([FromRoute] string key)
    {
        return new
        {
            conf = _configuration[key],
            key
        };
    }

}
