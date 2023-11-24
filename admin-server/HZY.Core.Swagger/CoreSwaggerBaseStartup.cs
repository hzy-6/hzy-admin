namespace HZY.Core.Swagger;

public class CoreSwaggerBaseStartup : StartupModule<CoreSwaggerBaseStartup>
{
    /// <summary>
    /// 服务配置
    /// </summary>
    /// <param name="webApplicationBuilder"></param>
    public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
    {
        var services = webApplicationBuilder.Services;

        var appName = Tools.GetAppName(webApplicationBuilder.Environment.ApplicationName);
        var namespacePrefix = Tools.GetNamespacePrefix(webApplicationBuilder.Environment.ApplicationName);

        // Swagger 注册Swagger生成器，定义一个和多个Swagger 文档
        webApplicationBuilder.Services
            .AddSwaggerGen(options =>
            {
                options.CustomSchemaIds(type => type.FullName);

                options.SwaggerDoc(appName, new OpenApiInfo
                {
                    Title = appName
                });

                //为 Swagger JSON and UI设置xml文档注释路径
                Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory)
                    .Where(w => w.EndsWith(".xml") && w.Contains(namespacePrefix))
                    .Select(w => w)
                    .ToList()
                    .ForEach(w => options.IncludeXmlComments(w, true))
                    ;
            });
    }

    /// <summary>
    /// 使用服务
    /// </summary>
    /// <param name="webApplication"></param>
    public override void Configure(WebApplication webApplication)
    {
        var appName = Tools.GetAppName(webApplication.Environment.ApplicationName);

        // 启用Swagger中间件
        webApplication.UseSwagger();
        // 配置SwaggerUI
        webApplication.UseSwaggerUI(c =>
        {
            c.SwaggerEndpoint($"{appName}/swagger.json", appName);
            c.RoutePrefix = "swagger";
        });
    }
}