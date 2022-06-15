using System;
using HZY.Infrastructure.Filters;
using HZY.Infrastructure.MessageQueue;
using HZY.Infrastructure.SerilogUtil;
using HZY.Infrastructure.TextJson;
using HZY.WebHost.Configure;
using HZY.WebHost.Filters;
using Serilog;
using System.Text.Encodings.Web;
using System.Text.Json;
using System.Text.Unicode;

try
{
    LogUtil.Build();

    #region 创建主机

    var builder = WebApplication.CreateBuilder(args);

    //地址
    //builder.WebHost.UseUrls("http://*:5600", "http://localhost:5600");
    //builder.WebHost.UseUrls("http://*:5600");

    LogUtil.Log.Warning("Web 主机开始启动...");

    // log 日志配置
    builder.Host.UseSerilog();

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
    .AddJsonOptions(options =>
    {
        //设置 如果是 Dictionary 那么 在 json 序列化 是 key 的字符 采用 小驼峰 命名
        options.JsonSerializerOptions.DictionaryKeyPolicy = JsonNamingPolicy.CamelCase;
        options.JsonSerializerOptions.Converters.Add(new DateTimeJsonConverter());
        options.JsonSerializerOptions.Converters.Add(new DateTimeNullJsonConverter());
        //防止json中带有中文被 unicode 编码
        options.JsonSerializerOptions.Encoder = JavaScriptEncoder.Create(UnicodeRanges.All);
    })
    ;

    //服务构建
    AppConfigureServices.Build(builder.Services, builder.Configuration);

    #endregion

    #region 应用服务

    var app = builder.Build();

    var messageQueueProvider = app.Services.GetRequiredService<IMessageQueueProvider>();

    if (app.Environment.IsDevelopment())
    {
        app.UseDeveloperExceptionPage();
        //app.UseSwagger();
        //app.UseSwaggerUI(c => c.SwaggerEndpoint("/swagger/v1/swagger.json", "HZY.WebHost v1"));
    }

    app.UseHttpsRedirection();

    app.UseRouting();

    //配置构建
    AppConfigure.Build(app, app.Environment, app.Services, messageQueueProvider);

    app.UseEndpoints(endpoints =>
    {
        endpoints.MapControllers();
    });

    app.Run();

    #endregion

}
catch (Exception ex)
{
    LogUtil.Log.Fatal(ex, "主机意外终止...");
    throw;
}
finally
{
    Log.CloseAndFlush();
}
