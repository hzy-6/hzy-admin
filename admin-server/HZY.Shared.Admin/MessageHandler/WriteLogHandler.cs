namespace HZY.Shared.Admin.MessageHandler;

/// <summary>
/// 消费日志
/// </summary>
public class WriteLogHandler : IBus<SysOperationLog>
{
    public string topic => "WriteInLog";

    private readonly IRepository<SysOperationLog> _sysOperationLogRepository;

    public WriteLogHandler(IRepository<SysOperationLog> sysOperationLogRepository)
    {
        _sysOperationLogRepository = sysOperationLogRepository;
    }

    public async Task HandlerAsync(SysOperationLog data)
    {
        await _sysOperationLogRepository.InsertAsync(data);
    }
}