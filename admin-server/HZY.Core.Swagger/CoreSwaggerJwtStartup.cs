namespace HZY.Core.Swagger;

public class CoreSwaggerJwtStartup : StartupModule<CoreSwaggerJwtStartup>
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
        services.AddSwaggerGen(options =>
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

            var jwtTokenOptions = webApplicationBuilder.Configuration
                .GetSection(nameof(JwtTokenOptions))
                .Get<JwtTokenOptions>();

            #region Jwt token 配置

            //添加Jwt验证设置,添加请求头信息
            options.AddSecurityRequirement(new OpenApiSecurityRequirement
            {
                {
                    new OpenApiSecurityScheme
                    {
                        Reference = new OpenApiReference
                        {
                            Id = "Bearer",
                            Type = ReferenceType.SecurityScheme
                        }
                    },
                    new List<string>()
                }
            });

            options.OperationFilter<AddResponseHeadersFilter>();
            options.OperationFilter<AppendAuthorizeToSummaryOperationFilter>();
            //很重要！这里配置安全校验，和之前的版本不一样
            options.OperationFilter<SecurityRequirementsOperationFilter>();
            //
            //options.OperationFilter<FileUploadOperation>();
            //开启 oauth2 安全描述
            options.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
            {
                Description = "JWT授权(数据将在请求头中进行传输) 直接在下框中输入Bearer {token}（注意两者之间是一个空格）\"",
                In = ParameterLocation.Header,
                Name = jwtTokenOptions.JwtTokenKeyName,
                Type = SecuritySchemeType.ApiKey,
                //Scheme = "basic",
            });

            #endregion
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