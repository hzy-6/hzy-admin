using HZY.EntityFramework.DbContexts;
using HZY.Managers.SignalRs.Hubs;
using Microsoft.AspNetCore.Builder;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Managers.SignalRs
{
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
}
