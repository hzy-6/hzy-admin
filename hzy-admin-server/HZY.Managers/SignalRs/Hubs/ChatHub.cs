using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Managers.SignalRs.Hubs
{
    public class ChatHub : Hub
    {
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="userName"></param>
        /// <returns></returns>
        public async Task Login(string userName)
        {
            await Clients.All.SendAsync("onLogin", userName);
        }

        /// <summary>
        /// 说
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="message"></param>
        /// <returns></returns>
        public async Task Say(string userName, string message)
        {
            await Clients.All.SendAsync("onSay", userName, message, DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
        }

    }
}
