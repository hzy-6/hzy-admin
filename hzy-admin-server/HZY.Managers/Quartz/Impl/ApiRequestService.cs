using Flurl.Http;
using HZY.Models.Entities.Quartz;
using Microsoft.Extensions.Logging;

namespace HZY.Managers.Quartz.Impl
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
        public async Task<(bool IsSuccess, string Message)> RequestAsync(QuartzJobTaskRequsetModeEnum requsetMode, string apiUrl, string headerKeyValue = null)
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

                if (requsetMode == QuartzJobTaskRequsetModeEnum.Delete)
                {
                    flurResponse = await flurlRequest.DeleteAsync();
                }

                if (requsetMode == QuartzJobTaskRequsetModeEnum.Post)
                {
                    flurResponse = await flurlRequest.PostAsync();
                }

                if (requsetMode == QuartzJobTaskRequsetModeEnum.Get)
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
