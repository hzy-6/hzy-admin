try
{
    await HzyApplication.RunAsync<ApiAdminStartup>(args);
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
