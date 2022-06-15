using HZY.Infrastructure;
using HzyScanDiService;
using Quartz;
using Quartz.Spi;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Domain.Services.Quartz.Jobs
{
    /// <summary>
    /// IJob 对象无法构造注入 需要此类实现 返回 注入后得 Job 实例
    /// </summary>
    public class ResultfulApiJobFactory : IJobFactory, ISingletonSelfDependency
    {
        public ResultfulApiJobFactory()
        {

        }

        public IJob NewJob(TriggerFiredBundle bundle, IScheduler scheduler)
        {
            //Job类型
            Type jobType = bundle.JobDetail.JobType;

            using var scope = IOCUtil.CreateScope();
            return scope.ServiceProvider.GetService(jobType) as IJob;
        }

        public void ReturnJob(IJob job)
        {
            var disposable = job as IDisposable;
            disposable?.Dispose();
        }
    }
}
