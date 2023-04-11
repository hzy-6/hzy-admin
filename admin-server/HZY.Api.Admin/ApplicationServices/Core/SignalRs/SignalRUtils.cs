namespace HZY.Api.Admin.ApplicationServices.Core.SignalRs;

/// <summary>
/// 
/// </summary>
public static class SignalRUtils
{
    public static void UseSignalRHubs(this WebApplication app)
    {
        app.MapHub<ChatHub>("/hub");
    }





}
