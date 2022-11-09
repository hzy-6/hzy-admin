namespace HZY.WebHost.Endpoints
{
    /// <summary>
    /// 主端点 miniapi
    /// </summary>
    public static class MainEndpoints
    {

        public static WebApplication MapMainEndpoints(this WebApplication app)
        {
            // 跳转客户端
            app.MapGet("/", () => Results.Redirect("/client/index.html"));
            // 跳转 swagger
            app.MapGet("/doc", () => Results.Redirect("/swagger"));
            // 跳转客户端
            app.MapGet("/ui", () => Results.Redirect("/client_element_plus/index.html"));

            return app;
        }


    }
}
