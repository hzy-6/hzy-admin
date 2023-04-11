namespace HZY.Core.Identity.Services;

/// <summary>
/// jwt token 服务
/// </summary>
public class JwtTokenService : ITransientSelfDependency
{
    private readonly HttpContext _httpContext;
    private readonly IConfiguration _configuration;
    private readonly JwtTokenOptions _jwtTokenOptions;

    /// <summary>
    /// jwt token 服务
    /// </summary>
    /// <param name="httpContextAccessor"></param>
    /// <param name="configuration"></param>
    public JwtTokenService(IHttpContextAccessor httpContextAccessor, IConfiguration configuration)
    {
        _httpContext = httpContextAccessor.HttpContext!;
        _configuration = configuration;
        _jwtTokenOptions = _configuration.GetSection(nameof(JwtTokenOptions)).Get<JwtTokenOptions>()!;
    }

    /// <summary>
    /// 根据 id 创建token
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public string? CreateTokenByAccountId(Guid id)
    {
        return JwtTokenUtil.CreateToken(id.ToString(), _jwtTokenOptions);
    }

    /// <summary>
    /// 检查是否有Token字符串
    /// </summary>
    /// <returns></returns>
    public bool HasTokenString()
    {
        var jwtTokenKeyName = _jwtTokenOptions.JwtTokenKeyName;

        if (_httpContext == null)
        {
            return false;
        }

        if (!_httpContext.Request.Headers.ContainsKey(jwtTokenKeyName!))
        {
            return false;
        }

        var token = GetTokenString();
        return !string.IsNullOrWhiteSpace(token) || token.Length > 10;
    }

    /// <summary>
    /// 获取 token 字符串
    /// </summary>
    /// <returns></returns>
    public string? GetTokenString()
    {
        if (_httpContext == null)
        {
            return string.Empty;
        }

        var jwtTokenKeyName = _jwtTokenOptions.JwtTokenKeyName;

        return _httpContext.Request.Headers[jwtTokenKeyName!].ToString();
    }

    /// <summary>
    /// 验证和读取jwt token
    /// </summary>
    /// <returns></returns>
    public IEnumerable<Claim>? ValidateAndReadJWTToken()
    {
        var jwtTokenKeyName = _jwtTokenOptions.JwtTokenKeyName;

        if (!HasTokenString()) return default;

        var token = GetTokenString();
        if (string.IsNullOrWhiteSpace(token)) return default;

        return JwtTokenUtil.ValidateAndReadJWTToken(token, _jwtTokenOptions)?.Claims;
    }

    /// <summary>
    /// 是否验证通过
    /// </summary>
    /// <returns></returns>
    public bool IsValidate()
    {
        var token = GetTokenString();
        if (string.IsNullOrWhiteSpace(token)) return default;

        var claimsPrincipal = JwtTokenUtil.ValidateAndReadJWTToken(token, _jwtTokenOptions);

        if (claimsPrincipal == null) return false;
        if (claimsPrincipal.Identity == null) return false;

        return claimsPrincipal.Identity.IsAuthenticated && !IsExpire();
    }

    /// <summary>
    /// 获取 token 并得到 id
    /// </summary>
    /// <returns></returns>
    public Guid GetAccountIdByToken()
    {
        if (_httpContext == null) return Guid.Empty;

        var jwtTokenKeyName = _jwtTokenOptions.JwtTokenKeyName;

        if (!HasTokenString())
            return default;

        //if (_httpContext.User.Identity == null) return false;
        //var claims = _httpContext.User.Claims;

        var claims = ValidateAndReadJWTToken();

        var id = claims?.FirstOrDefault(w => w.Type == ClaimTypes.Name)?.Value;

        if (string.IsNullOrWhiteSpace(id)) return default;

        return id.ToGuid();

        //一下方式 header 里面 AuthorizationKeyName 必须是 Authorization

        // if (this._httpContext.User.Identity == null)
        // {
        //     return default;
        // }

        // return this._httpContext.User.Identity.Name.ToGuid();
    }

    /// <summary>
    /// 是否刷新token
    /// </summary>
    /// <returns></returns>
    public bool IsRefreshToken()
    {
        if (_httpContext == null)
        {
            return false;
        }

        var jwtTokenKeyName = _jwtTokenOptions.JwtTokenKeyName;

        if (!HasTokenString())
            return default;

        var claims = ValidateAndReadJWTToken();
        var expired = claims?.FirstOrDefault(w => w.Type == ClaimTypes.Expired)?.Value;
        if (string.IsNullOrWhiteSpace(expired)) return true;

        var totalMinutes = (Convert.ToDateTime(expired) - DateTime.Now).TotalMinutes;

        return totalMinutes >= 0 && totalMinutes <= TokenValidationParameters.DefaultClockSkew.TotalMinutes;
    }

    /// <summary>
    /// 是否过期
    /// </summary>
    /// <returns></returns>
    public bool IsExpire()
    {
        if (_httpContext == null)
        {
            return false;
        }

        var jwtTokenKeyName = _jwtTokenOptions.JwtTokenKeyName;

        if (!HasTokenString())
            return default;

        var claims = ValidateAndReadJWTToken();
        var expired = claims?.FirstOrDefault(w => w.Type == ClaimTypes.Expired)?.Value;
        if (string.IsNullOrWhiteSpace(expired)) return true;

        var totalMinutes = (DateTime.Now - Convert.ToDateTime(expired)).TotalMinutes;

        return totalMinutes > 0;
    }

}