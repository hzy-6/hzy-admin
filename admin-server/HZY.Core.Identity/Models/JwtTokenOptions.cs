namespace HZY.Core.Identity.Models;

/// <summary>
/// jwt token 配置
/// </summary>
public class JwtTokenOptions
{

    /// <summary>
    /// 
    /// </summary>
    public string? JwtTokenKeyName { get; set; }

    /// <summary>
    /// 
    /// </summary>
    public string? JwtIssuerSigningKey { get; set; }

    /// <summary>
    /// 
    /// </summary>
    public string? JwtValidIssuer { get; set; }

    /// <summary>
    /// 
    /// </summary>
    public string? JwtValidAudience { get; set; }


}

