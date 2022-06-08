using HzyScanDiService;
using System;
using System.Threading.Tasks;

namespace HZY.Infrastructure.MessageQueue;

/// <summary>
/// 消息队列提供者
/// </summary>
public interface IMessageQueueProvider : ISingletonDependency
{
    /// <summary>
    /// 启动运行
    /// </summary>
    /// <returns></returns>
    Task<bool> RunAsync();

    /// <summary>
    /// 发布消息队列
    /// </summary>
    /// <returns></returns>
    Task<bool> SendMessageQueueAsync(string key, object message, Action<object, IServiceProvider> action);

}