using HZY.Quartz.Entitys;
using HzyScanDiService.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Infrastructure.Quartz
{
    public interface IApiRequestService : IDiTransient
    {

        Task<(bool IsSuccess, string Message)> RequestAsync(TasksRequsetModeEnum requsetMode, string apiUrl, string headerKeyValue);



    }
}
