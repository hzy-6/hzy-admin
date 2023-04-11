namespace HZY.Api.Admin.ApplicationServices.Core.Quartz.Jobs;

/// <summary>
/// IJob 对象无法构造注入 需要此类实现 返回 注入后得 Job 实例
/// </summary>
public class WebApiJobFactory : IJobFactory, ISingletonSelfDependency
{
    public WebApiJobFactory()
    {

    }

    public IJob NewJob(TriggerFiredBundle bundle, IScheduler scheduler)
    {
        //Job类型
        Type jobType = bundle.JobDetail.JobType;

        using var scope = App.CreateScope();
        return scope.ServiceProvider.GetService(jobType) as IJob;
    }

    public void ReturnJob(IJob job)
    {
        var disposable = job as IDisposable;
        disposable?.Dispose();
    }
}
