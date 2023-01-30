using HZY.Infrastructure;
using System.Text;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Text.Encodings.Web;
using System.Text.Unicode;
using HZY.Infrastructure.Filters;
using Swashbuckle.AspNetCore.Filters;
using Newtonsoft.Json.Serialization;
using Microsoft.AspNetCore.Server.Kestrel.Core;
using Microsoft.AspNetCore.Http.Features;
using Zyx.MemoryMQ.Extensions;
using HZY.Web.Host.Filters;
using HZY.Web.Host.Middlewares;
using HZY.Framework.DynamicApiController;
using HZY.Framework.Core.AspNetCore;
using HZY.Web.Host.Configure;
using HZY.Web.Host.Endpoints;

namespace HZY.Web.Host
{
    /// <summary>
    /// 程序启动器
    /// </summary>
    public class WebHostStartup : Startup
    {
        /// <summary>
        /// 获取 Swagger 版本集合
        /// </summary>
        private static readonly IEnumerable<string> _versionList = typeof(ApiVersions).GetEnumNames().OrderBy(w => w);

        public override void ConfigureServices(WebApplicationBuilder webApplicationBuilder)
        {
            //地址
            //webApplicationBuilder.WebHost.UseUrls("http://*:5600", "http://localhost:5600");
            //webApplicationBuilder.WebHost.UseUrls("http://*:5600");

            var services = webApplicationBuilder.Services;
            var configuration = webApplicationBuilder.Configuration;
            var appConfiguration = new AppConfiguration(configuration);
            var prefixString = appConfiguration.Configs.Namespace + ".";

            // 生命周期
            services.AddSingleton<IHostedService, LifetimeEventsHostedService>();

            // Add services to the container.
            webApplicationBuilder.Services.AddControllers(options =>
            {
                options.Filters.Add<ApiExceptionFilter>();
                options.Filters.Add<ApiAuthorizationFilter>();
                options.Filters.Add<ApiPermissionFilter>();
            })
            .AddDynamicApiController(options =>
            {
                options.IsLower = false;
            })
            .AddControllersAsServices()
            .AddNewtonsoftJson(options =>
            {
                options.SerializerSettings.DateFormatString = "yyyy-MM-dd HH:mm:ss";
                //小驼峰命名
                options.SerializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
            })
            ;

            #region razor page 处理
            //代码生成器需要开启 razor page 引擎
            webApplicationBuilder.Services.AddRazorPages();
            //razor 解决中文被编码
            webApplicationBuilder.Services.AddSingleton(HtmlEncoder.Create(UnicodeRanges.All));
            #endregion

            #region HttpContext、IMemoryCache

            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddMemoryCache();

            #endregion

            //添加中间件
            services.AddScoped<TakeUpTimeMiddleware>();

            #region 取消默认验证Api 接收参数模型 的 验证特性 如有 [ApiController]

            services.Configure<ApiBehaviorOptions>(options => { options.SuppressModelStateInvalidFilter = true; });

            #endregion

            #region 跨域配置 配置跨域处理

            services.AddCors(options =>
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
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(appConfiguration.Configs.JwtIssuerSigningKey)), //拿到SecurityKey
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
                //
                options.OperationFilter<FileUploadOperation>();
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

            #region 上传文件最大长度
            services.Configure<KestrelServerOptions>(options =>
            {
                options.Limits.MaxRequestBodySize = appConfiguration.Configs.FileManager.GetMaxRequestBodySize();
            });

            services.Configure<FormOptions>(options =>
            {
                options.MultipartBodyLengthLimit = appConfiguration.Configs.FileManager.GetMaxRequestBodySize();
            });
            #endregion

        }

        public override void Configure(WebApplication webApplication)
        {
            if (webApplication.Environment.IsDevelopment())
            {
                webApplication.UseDeveloperExceptionPage();
            }

            webApplication.UseHttpsRedirection();

            webApplication.UseRouting();

            webApplication.UseStaticFiles();

            #region JWT

            webApplication.UseAuthentication();
            webApplication.UseAuthorization();

            #endregion

            #region Swagger

            //启用中间件服务生成Swagger作为JSON终结点
            webApplication.UseSwagger();
            //启用中间件服务对swagger-ui，指定Swagger JSON终结点
            webApplication.UseSwaggerUI(option =>
            {
                foreach (var item in _versionList) option.SwaggerEndpoint($"{item}/swagger.json", item);
                option.RoutePrefix = "swagger";
            });

            #endregion

            #region 使用跨域 警告: 通过终结点路由，CORS 中间件必须配置为在对UseRouting和UseEndpoints的调用之间执行。 配置不正确将导致中间件停止正常运行。

            webApplication.UseCors();

            #endregion

            #region 使用 Api 耗时计算中间件
            webApplication.UseMiddleware<TakeUpTimeMiddleware>();
            #endregion

            #region 消息队列启动
            webApplication.UseMemoryMQ();
            #endregion

            // map controller
            webApplication.MapControllers();

            // 启动主端点 miniapi
            webApplication.MapMainEndpoints();
        }

    }
}
