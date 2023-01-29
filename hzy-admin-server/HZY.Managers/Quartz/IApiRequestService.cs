using HZY.Framework.AutoRegisterIOC;
using HZY.Models.Entities.Quartz;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Managers.Quartz
{
    public interface IApiRequestService : ITransientDependency
    {

        Task<(bool IsSuccess, string Message)> RequestAsync(QuartzJobTaskRequsetModeEnum requsetMode, string apiUrl, string headerKeyValue);



    }
}
