using System.Text.Json;
using HZY.Framework.Middleware;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using HZY.Framework.Filters;
using HZY.Admin.Filters;
using HZY.Repository.AppCore;
using HZY.Common.ScanDIService;
using NLog.Extensions.Logging;

namespace HZY.Admin
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        private IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            var jwtKeyName = Configuration["AppConfiguration:JwtKeyName"];
            var jwtSecurityKey = Configuration["AppConfiguration:JwtSecurityKey"];
            var connectionString = Configuration["AppConfiguration:ConnectionString"];
            var connectionStringRedis = Configuration["AppConfiguration:ConnectionStringRedis"];

            services.AddControllersWithViews(options =>
                {
                    options.Filters.Add<ApiExceptionFilter>();
                    options.Filters.Add<AdminAuthorizationActionFilter>();
                })
                .AddJsonOptions(options =>
                {
                    //设置 如果是 Dictionary 那么 在 json 序列化 是 key 的字符 采用 小驼峰 命名
                    options.JsonSerializerOptions.DictionaryKeyPolicy = JsonNamingPolicy.CamelCase;
                })
                .AddRazorRuntimeCompilation()
                ;

            #region 取消默认验证Api 接收参数模型 的 验证特性 如有 [ApiController]

            services.Configure<ApiBehaviorOptions>(options => { options.SuppressModelStateInvalidFilter = true; });

            #endregion

            #region HttpContext、IMemoryCache

            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddMemoryCache();

            #endregion

            #region 仓储注册 、 自动扫描服务注册 、 中间件注册

            RepositoryModule.RegisterAdminRepository(services, connectionString);
            //RepositoryRedisModule.RegisterRedisRepository(services, connectionStringRedis);
            services.ScanningAppServices("HZY.");
            services.AddScoped<TakeUpTimeMiddleware>();

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

            #region NLog 日志配置 ILogger 对象日志可以自动存入 nlog 文件中

            services.AddLogging(w => w.AddNLog());

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

            #region 使用 Api 耗时计算中间件
            app.UseMiddleware<TakeUpTimeMiddleware>();
            #endregion

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}