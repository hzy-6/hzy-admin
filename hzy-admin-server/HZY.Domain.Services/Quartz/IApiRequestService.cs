using HZY.Domain.Services.Quartz.Models;
using HzyScanDiService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Domain.Services.Quartz
{
    public interface IApiRequestService : ITransientDependency
    {

        Task<(bool IsSuccess, string Message)> RequestAsync(TasksRequsetModeEnum requsetMode, string apiUrl, string headerKeyValue);



    }
}
