using Flurl.Http;
using HZY.Domain.Services.Quartz.Models;
using Microsoft.Extensions.Logging;
using System;
using System.Threading.Tasks;

namespace HZY.Domain.Services.Quartz.Impl
{
    /// <summary>
    /// WebApi 请求服务
    /// </summary>
    public class ApiRequestService : IApiRequestService
    {
        private readonly ILogger<IApiRequestService> _logger;

        public ApiRequestService(ILogger<IApiRequestService> logger)
        {
            _logger = logger;
        }

        /// <summary>
        /// 请求数据
        /// </summary>
        /// <param name="requsetMode"></param>
        /// <param name="apiUrl"></param>
        /// <param name="headerKeyValue"></param>
        /// <returns></returns>
        public async Task<(bool IsSuccess, string Message)> RequestAsync(TasksRequsetModeEnum requsetMode, string apiUrl, string headerKeyValue = null)
        {
            try
            {
                var headerKey = "HZY.Quartz.Job.Request";
                var headerValue = "Success";

                if (!string.IsNullOrWhiteSpace(headerKeyValue) && headerKeyValue.Contains("="))
                {
                    headerKey = headerKeyValue.Split('=')[0];
                    headerValue = headerKeyValue.Split('=')[1];
                }

                IFlurlRequest flurlRequest = apiUrl.WithHeader(headerKey, headerValue);
                if (flurlRequest == null)
                {
                    return (false, "flurlRequest 空指针！");
                }

                IFlurlResponse flurResponse = default;

                if (requsetMode == TasksRequsetModeEnum.Delete)
                {
                    flurResponse = await flurlRequest.DeleteAsync();
                }

                if (requsetMode == TasksRequsetModeEnum.Post)
                {
                    flurResponse = await flurlRequest.PostAsync();
                }

                if (requsetMode == TasksRequsetModeEnum.Get)
                {
                    flurResponse = await flurlRequest.GetAsync();
                }

                if (flurResponse == null)
                {
                    return (false, "flurResponse 空指针！");
                }

                var result = await flurResponse.GetStringAsync();

                if (string.IsNullOrWhiteSpace(result))
                {
                    return (false, "result 空指针！");
                }

                return (true, result);
            }
            catch (Exception ex)
            {
                _logger.LogError(ex, $"接口请求异常【ApiRequestService 》RequestAsync】：{ex.Message}");
                return (false, ex.Message);
            }

        }
    }
}
