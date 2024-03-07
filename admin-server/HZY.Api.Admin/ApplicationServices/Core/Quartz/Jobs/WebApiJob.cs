namespace HZY.Api.Admin.ApplicationServices.Core.Quartz.Jobs;

/// <summary>
/// Resultful 风格 Api Job
/// </summary>
[DisallowConcurrentExecution]
public class WebApiJob : WebApiJobAsync, ITransientSelfDependency
{
    public WebApiJob(ILogger<WebApiJob> logger) : base(logger)
    {

    }

}
