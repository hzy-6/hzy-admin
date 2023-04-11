namespace HZY.Core.Identity.Configs;

/// <summary>
/// 共享身份认证配置
/// </summary>
public static class CoreIdentityConfig
{
    /// <summary>
    /// 添加身份认证
    /// </summary>
    public static void AddIdentity(this WebApplicationBuilder webApplicationBuilder)
    {
        // 注册身份认证
        var jwtTokenOptions = webApplicationBuilder.Configuration
            .GetSection(nameof(JwtTokenOptions))
            .Get<JwtTokenOptions>()
            ;

        webApplicationBuilder.Services
            .AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true, //是否验证Issuer
                    ValidateAudience = true, //是否验证Audience
                    ValidateLifetime = true, //是否验证失效时间
                    ValidateIssuerSigningKey = true, //是否验证SecurityKey
                    ValidAudience = jwtTokenOptions!.JwtValidAudience, //Audience
                    ValidIssuer = jwtTokenOptions.JwtValidIssuer, //Issuer，这两项和前面签发jwt的设置一致
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtTokenOptions!.JwtIssuerSigningKey!)), //拿到SecurityKey
                    RequireExpirationTime = true,
                };
                options.Events = new JwtBearerEvents
                {
                    OnAuthenticationFailed = context =>
                    {
                        //Token expired
                        if (context.Exception.GetType() == typeof(SecurityTokenExpiredException))
                        {
                            context.Response.Headers.Add("Token-Expired", "true");
                        }
                        return Task.CompletedTask;
                    }
                };
            });
    }

    /// <summary>
    /// 使用身份认证
    /// </summary>
    /// <param name="webApplication"></param>
    public static void UseIdentity(this WebApplication webApplication)
    {
        webApplication.UseAuthentication();

        webApplication.UseAuthorization();
    }


}
