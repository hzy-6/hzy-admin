using System.Text.Encodings.Web;
using System.Text.Json;
using System.Text.Unicode;
using HZY.Admin.Core;
using HZY.Framework.Filter;
using HZY.Framework.Middleware;
using HZY.Repository.Core.Provider;
using HZY.Toolkit;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using UEditor.Core;

namespace HZY.Admin
{
    public class Startup
    {
        private readonly IWebHostEnvironment _webHostEnvironment;

        public Startup(IConfiguration configuration, IWebHostEnvironment webHostEnvironment)
        {
            Configuration = configuration;
            _webHostEnvironment = webHostEnvironment;
        }

        private IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews(options =>
                {
                    options.Filters.Add<ExceptionFilter>();
                    options.Filters.Add<AdminAuthorizationActionFilter>();
                })
                .AddJsonOptions(options =>
                {
                    //设置 如果是 Dictionary 那么 在 json 序列化 是 key 的字符 采用 小驼峰 命名
                    options.JsonSerializerOptions.DictionaryKeyPolicy = JsonNamingPolicy.CamelCase;
                })
                .AddRazorRuntimeCompilation()
                ;

            //razor 解决中文被编码
            services.AddSingleton(HtmlEncoder.Create(UnicodeRanges.All));

            #region 取消默认验证Api 接收参数模型 的 验证特性 如有 [ApiController]
            services.Configure<ApiBehaviorOptions>(options => { options.SuppressModelStateInvalidFilter = true; });
            #endregion
            
            #region HttpContext

            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();

            #endregion

            #region 仓储注册 、 自动扫描服务注册 、 中间件注册

            services.RegisterRepository(Configuration["AppConfiguration:ConnectionString"]);
            services.ScanAppServices();
            services.AddTransient<TakeUpTimeMiddleware>();

            #endregion

            #region UEditor

            //UEditor  编辑器 服务端 注入  configFileRelativePath: "wwwroot/admin/libs/nUeditor/net/config.json", isCacheConfig: false, basePath: "C:/basepath"
            services.AddUEditorService(
                configFileRelativePath: _webHostEnvironment.WebRootPath + "/admin/libs/neditor/net/config.json",
                isCacheConfig: false,
                basePath: _webHostEnvironment.WebRootPath + "/admin/libs/neditor/net/"
            );

            #endregion

            #region 自定义视图

            //自定义 视图 
            services.Configure<Microsoft.AspNetCore.Mvc.Razor.RazorViewEngineOptions>(item =>
            {
                //系统管理
                item.ViewLocationFormats.Add("/Views/Sys/{1}/{0}.cshtml");
                //基础管理
                item.ViewLocationFormats.Add("/Views/Framework/{1}/{0}.cshtml");
            });

            #endregion

            #region Swagger 注册Swagger生成器，定义一个和多个Swagger 文档

            /*
                     services.AddSwaggerGen(options =>
                     {
                         options.SwaggerDoc("hzyAdmin", new OpenApiInfo {Title = "hzyAdmin"});
         
                         //为 Swagger JSON and UI设置xml文档注释路径
                         var xmlPath = Path.Combine(System.AppContext.BaseDirectory, "HZY.Admin.xml");
                         var xmlPath1 = Path.Combine(System.AppContext.BaseDirectory, "HZY.Models.xml");
                         options.IncludeXmlComments(xmlPath, true);
                         options.IncludeXmlComments(xmlPath1, true);
         
                         #region Jwt token 配置
         
                         //option.OperationFilter<AppService.SwaggerParameterFilter>(); // 给每个接口配置授权码传入参数文本框
                         //
                         // options.OperationFilter<AddResponseHeadersFilter>();
                         // options.OperationFilter<AppendAuthorizeToSummaryOperationFilter>();
                         // //很重要！这里配置安全校验，和之前的版本不一样
                         // options.OperationFilter<SecurityRequirementsOperationFilter>();
                         // //开启 oauth2 安全描述
                         // options.AddSecurityDefinition("oauth2", new OpenApiSecurityScheme
                         // {
                         //     Description = "JWT授权(数据将在请求头中进行传输) 直接在下框中输入Bearer {token}（注意两者之间是一个空格）\"",
                         //     In = ParameterLocation.Header,
                         //     Name = "Authorization",
                         //     Type = SecuritySchemeType.ApiKey,
                         //     //Scheme = "basic",
                         // });
         
                         #endregion
                     });
          */

            #endregion
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();

            app.UseStaticFiles();

            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });

            #region Swagger

/*
            //启用中间件服务生成Swagger作为JSON终结点
            app.UseSwagger();
            //启用中间件服务对swagger-ui，指定Swagger JSON终结点
            app.UseSwaggerUI(option =>
            {
                option.SwaggerEndpoint($"hzyAdmin/swagger.json", "hzyAdmin");
                option.RoutePrefix = "swagger";
            });
*/

            #endregion

            // #region 中间件 TakeUpTimeMiddleware
            //
            // app.UseMiddleware<TakeUpTimeMiddleware>();
            //
            // #endregion
        }
    }
}