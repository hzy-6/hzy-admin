namespace HZY.Api.Admin.ApplicationServices.Core.Quartz.Impl;

/// <summary>
/// Job 运行 日志
/// </summary>
public class JobLoggerService : IJobLoggerService
{
    private readonly IRepository<QuartzJobLog> _quartzJobTaskLogRepository;

    public JobLoggerService(IRepository<QuartzJobLog> quartzJobTaskLogRepository)
    {
        _quartzJobTaskLogRepository = quartzJobTaskLogRepository;
    }

    public List<QuartzJobLog> FindListById(Guid tasksId, int page, int size, out int total)
    {
        page = page < 1 ? 1 : page;

        var query = _quartzJobTaskLogRepository.SelectNoTracking
            .OrderByDescending(w => w.CreationTime)
            .Where(w => w.JobId == tasksId)
            ;

        total = query.Count();

        return query
            .Skip((page - 1) * size)
            .Take(size)
            .ToList()
            ;
    }

    public void Write(QuartzJobLog jobLoggerInfo)
    {
        if (jobLoggerInfo == null) return;

        // 删除1个月前的日志
        _quartzJobTaskLogRepository.Delete(w => w.CreationTime < DateTime.Now.AddMonths(-1));
        // 写入日志
        _quartzJobTaskLogRepository.Insert(jobLoggerInfo);
    }
}
