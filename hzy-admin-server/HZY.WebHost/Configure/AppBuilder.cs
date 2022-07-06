using HZY.Domain.Services.Quartz;
using HZY.EFCore;
using HZY.Infrastructure;
using HZY.Infrastructure.MemoryMQ.Interfaces;
using HZY.Infrastructure.MessageQueue.Models;
using HZY.WebHost.Middlewares;
using HzyScanDiService;
using System.Text;
using HZY.FreeSqlCore;
using HZY.Infrastructure.MemoryMQ;
using HZY.Infrastructure.Redis;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Quartz;
using Quartz.Impl;
using Serilog;
using System.Text.Encodings.Web;
using System.Text.Unicode;
using HZY.Infrastructure.Filters;
using HZY.WebHost.Filters;
using Swashbuckle.AspNetCore.Filters;
using Newtonsoft.Json.Serialization;
using HZY.Infrastructure.SerilogUtil;

namespace HZY.WebHost.Configure;

/// <summary>
/// 程序构建类
/// </summary>
public static class AppBuilder
{
    private static readonly IEnumerable<string> _versionList = typeof(ApiVersions).GetEnumNames().OrderBy(w => w);

    /// <summary>
    /// 获取 Swagger 版本集合
    /// </summary>
    /// <returns></returns>
    public static IEnumerable<string> GetVersionList() => _versionList;

    /// <summary>
    /// 配置服务
    /// </summary>
    /// <param name="builder"></param>
    public static WebApplication AppConfigureServicesBuild(this WebApplicationBuilder builder)
    {
        //地址
        //builder.WebHost.UseUrls("http://*:5600", "http://localhost:5600");
        //builder.WebHost.UseUrls("http://*:5600");
        LogUtil.Log.Warning("Web 主机开始启动...");

        var services = builder.Services;
        var configuration = builder.Configuration;

        // log 日志配置
        builder.Host.UseSerilog();

        var appConfiguration = new AppConfiguration(configuration);
        var prefixString = appConfiguration.Configs.Namespace + ".";

        #region 自动扫描服务注册 、 其他服务注册

        //扫描服务自动化注册
        services.AddHzyScanDiService(prefixString);

        services.AddSingleton<IHostedService, LifetimeEventsHostedService>();

        #endregion;

        #region razor page 处理
        //代码生成器需要开启 razor page 引擎
        builder.Services.AddRazorPages();
        //razor 解决中文被编码
        builder.Services.AddSingleton(HtmlEncoder.Create(UnicodeRanges.All));
        #endregion

        // Add services to the container.
        builder.Services.AddControllers(options =>
        {
            options.Filters.Add<ApiExceptionFilter>();
            options.Filters.Add<ApiAuthorizationFilter>();
            options.Filters.Add<ApiPermissionFilter>();
        })
        .AddControllersAsServices()
        //.AddJsonOptions(options =>
        //{
        //    //设置 如果是 Dictionary 那么 在 json 序列化 是 key 的字符 采用 小驼峰 命名
        //    options.JsonSerializerOptions.DictionaryKeyPolicy = JsonNamingPolicy.CamelCase;
        //    options.JsonSerializerOptions.Converters.Add(new DateTimeJsonConverter());
        //    options.JsonSerializerOptions.Converters.Add(new DateTimeNullJsonConverter());
        //    //防止json中带有中文被 unicode 编码
        //    options.JsonSerializerOptions.Encoder = JavaScriptEncoder.Create(UnicodeRanges.All);
        //})
        .AddNewtonsoftJson(options =>
        {
            options.SerializerSettings.DateFormatString = "yyyy-MM-dd HH:mm:ss";
            //小驼峰命名
            options.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
            //忽略循环引用
            //    option.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore
        })
        ;

        #region HttpContext、IMemoryCache

        services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
        services.AddMemoryCache();

        #endregion

        #region Quartz

        //AutoMapper 配置
        services.AddAutoMapper(typeof(AutoMapperConfig));
        //注册ISchedulerFactory的实例。
        services.AddTransient<ISchedulerFactory, StdSchedulerFactory>();

        #endregion

        #region 数据库仓储注册 、 中间件注册

        //配置efcore
        services.AddEfCore(appConfiguration, builder);
        //配置freesql
        FreeSqlCoreModule.RegisterFreeSql(services, appConfiguration, $"{prefixString}Repositories");
        //配置redis
        RedisUtil.AddRedisService(services, appConfiguration.ConnectionStrings.Redis);
        //添加中间件
        services.AddScoped<TakeUpTimeMiddleware>();

        #endregion

        #region 取消默认验证Api 接收参数模型 的 验证特性 如有 [ApiController]

        services.Configure<ApiBehaviorOptions>(options => { options.SuppressModelStateInvalidFilter = true; });

        #endregion

        #region 跨域配置 配置跨域处理

        services.AddCors(options =>
        {
            options.AddPolicy("WebHostCors", builder =>
            {
                builder.WithOrigins("*")
                    .AllowAnyMethod()
                    .AllowAnyHeader();
                //.AllowAnyOrigin()
                //.AllowCredentials();
                //6877
            });
        });

        #endregion

        #region JWT

        #region 此配置可用于自定义 token 的 key name
        services.AddAuthorization(options =>
        {
            options.AddPolicy("WebHostPolicy", policy => policy.Requirements.Add(new CustomPolicyRequirement(appConfiguration.Configs.AuthorizationKeyName)));
        });
        services.AddSingleton<IAuthorizationHandler, CustomAuthorizationHandler>();
        #endregion

        services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
        {
            options.TokenValidationParameters = new TokenValidationParameters
            {
                ValidateIssuer = true, //是否验证Issuer
                ValidateAudience = true, //是否验证Audience
                ValidateLifetime = true, //是否验证失效时间
                ValidateIssuerSigningKey = true, //是否验证SecurityKey
                ValidAudience = appConfiguration.Configs.JwtValidAudience, //Audience
                ValidIssuer = appConfiguration.Configs.JwtValidIssuer, //Issuer，这两项和前面签发jwt的设置一致
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(appConfiguration.Configs.JwtIssuerSigningKey)) //拿到SecurityKey
            };
        });

        #endregion

        #region Swagger 注册Swagger生成器，定义一个和多个Swagger 文档

        services.AddSwaggerGen(options =>
        {
            foreach (var item in _versionList)
            {
                options.SwaggerDoc(item, new OpenApiInfo
                {
                    Title = item
                });
            }

            //为 Swagger JSON and UI设置xml文档注释路径
            Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory)
            .Where(w => w.EndsWith(".xml") && w.Contains(prefixString))
            .Select(w => w)
            .ToList()
            .ForEach(w => options.IncludeXmlComments(w, true))
            ;

            #region Jwt token 配置

            //option.OperationFilter<AppService.SwaggerParameterFilter>(); // 给每个接口配置授权码传入参数文本框
            //
            options.OperationFilter<AddResponseHeadersFilter>();
            options.OperationFilter<AppendAuthorizeToSummaryOperationFilter>();
            //很重要！这里配置安全校验，和之前的版本不一样
            options.OperationFilter<SecurityRequirementsOperationFilter>();
            //开启 oauth2 安全描述
            options.AddSecurityDefinition("oauth2", new OpenApiSecurityScheme
            {
                Description = "JWT授权(数据将在请求头中进行传输) 直接在下框中输入Bearer {token}（注意两者之间是一个空格）\"",
                In = ParameterLocation.Header,
                Name = appConfiguration.Configs.AuthorizationKeyName,
                Type = SecuritySchemeType.ApiKey,
                //Scheme = "basic",
            });

            #endregion
        });

        #endregion

        // 本地消息队列
        services.AddMemoryMQ();

        return builder.Build();
    }

    /// <summary>
    /// 配置构建
    /// </summary>
    /// <param name="app"></param>
    public static WebApplication AppConfigureBuild(this WebApplication app)
    {
        var env = app.Environment;
        var serviceProvider = app.Services;

        var memoryMQ = app.Services.GetRequiredService<IMessageConsumer<MessageQueueContext>>();

        if (app.Environment.IsDevelopment())
        {
            app.UseDeveloperExceptionPage();
            //app.UseSwagger();
            //app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "HZY.WebHost v1"));
        }

        app.UseHttpsRedirection();

        app.UseRouting();

        app.UseStaticFiles();

        var appConfiguration = app.Services.GetRequiredService<AppConfiguration>();

        #region 注册服务提供者

        serviceProvider.UseServiceProvider();

        #endregion

        #region JWT

        app.UseAuthentication();
        app.UseAuthorization();

        #endregion

        #region Swagger

        //启用中间件服务生成Swagger作为JSON终结点
        app.UseSwagger();
        //启用中间件服务对swagger-ui，指定Swagger JSON终结点
        app.UseSwaggerUI(option =>
        {
            foreach (var item in AppBuilder.GetVersionList()) option.SwaggerEndpoint($"{item}/swagger.json", item);
            option.RoutePrefix = "swagger";
        });

        #endregion

        #region 使用跨域 警告: 通过终结点路由，CORS 中间件必须配置为在对UseRouting和UseEndpoints的调用之间执行。 配置不正确将导致中间件停止正常运行。

        app.UseCors("WebHostCors");

        #endregion

        #region 使用 Api 耗时计算中间件
        app.UseMiddleware<TakeUpTimeMiddleware>();
        #endregion

        #region 消息队列启动
        memoryMQ.StartAsync().Wait();
        #endregion

        #region 启动定时任务
        if (appConfiguration.Configs.IsRunQuartzTask)
        {
            var _taskService = app.Services.GetRequiredService<ITaskService>();
            _taskService.RecoveryTaskAsync().Wait();
        }
        #endregion

        #region 使用 DbContext
        app.UseEfCore();
        #endregion

        app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

        return app;
    }

}