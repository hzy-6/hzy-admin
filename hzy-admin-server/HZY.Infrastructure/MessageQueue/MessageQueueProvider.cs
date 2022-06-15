using HZY.Infrastructure.MessageQueue.Models;
using HZY.Infrastructure.SerilogUtil;
using NPOI.SS.Formula.Functions;
using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Infrastructure.MessageQueue;

/// <summary>
/// 消息队列提供者
/// </summary>
public class MessageQueueProvider : IMessageQueueProvider
{

    private readonly BlockingCollection<MessageQueueContext> blockingCollection;
    private readonly IServiceProvider _services;

    public MessageQueueProvider(IServiceProvider services)
    {
        blockingCollection = new BlockingCollection<MessageQueueContext>();
        _services = services;
    }

    private bool IsComleted() => blockingCollection.IsCompleted;

    public virtual Task<bool> RunAsync()
    {
        Task.Factory.StartNew(async () =>
        {
            //从队列中取元素。
            while (true)
            {
                if (!IsComleted() && blockingCollection.Count > 0)
                {
                    await Task.Factory.StartNew(() =>
                    {
                        try
                        {
                            var messageQueueModel = blockingCollection.Take();
                            messageQueueModel.Call?.Invoke(messageQueueModel.Message, _services);
                        }
                        catch (Exception ex)
                        {
                            LogUtil.Log.Error(ex.Message, ex);
                            Console.WriteLine("队列消费异常：" + ex.Message);
                        }
                    });
                }
                await Task.Delay(1);
            }
        });

        return Task.FromResult(true);
    }

    public virtual Task<bool> SendMessageQueueAsync(string key, object message, Action<object, IServiceProvider> action)
    {
        blockingCollection.Add(new MessageQueueContext(key, message, action));
        return Task.FromResult(true);
    }




}