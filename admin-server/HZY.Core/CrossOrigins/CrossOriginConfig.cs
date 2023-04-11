namespace HZY.Core.CrossOrigins;

/// <summary>
/// 跨域配置
/// </summary>
public static class CrossOriginConfig
{
    /// <summary>
    /// 添加跨域
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public static void AddCrossOrigin(this WebApplicationBuilder webApplicationBuilder)
    {
        // 跨域配置 配置跨域处理
        webApplicationBuilder.Services.AddCors(options =>
        {
            options.AddDefaultPolicy(builder =>
            {
                builder
                    .SetIsOriginAllowed(_ => true)
                    .AllowAnyMethod()
                    .AllowAnyHeader()
                    .AllowCredentials();
            });
        });
    }

    /// <summary>
    /// 使用跨域
    /// </summary>
    public static void UseCrossOrigin(this WebApplication webApplication)
    {
        // 使用跨域 警告: 通过终结点路由，CORS 中间件必须配置为在对UseRouting和UseEndpoints的调用之间执行。 配置不正确将导致中间件停止正常运行。
        webApplication.UseCors();
    }

}
