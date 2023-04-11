namespace HZY.Api.Admin.ApplicationServices.Core.Quartz;

public interface IApiRequestService : ITransientDependency
{

    Task<(bool IsSuccess, string Message)> RequestAsync(QuartzJobTaskRequsetModeEnum requsetMode, string apiUrl, string headerKeyValue = null);



}
