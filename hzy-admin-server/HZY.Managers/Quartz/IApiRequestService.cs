using HZY.Managers.Quartz.Models;
using HZY.Framework.AutoRegisterIOC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Managers.Quartz
{
    public interface IApiRequestService : ITransientDependency
    {

        Task<(bool IsSuccess, string Message)> RequestAsync(TasksRequsetModeEnum requsetMode, string apiUrl, string headerKeyValue);



    }
}
