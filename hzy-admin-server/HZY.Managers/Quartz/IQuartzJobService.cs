using HZY.Managers.Quartz.Models;
using HZY.Framework.AutoRegisterIOC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Managers.Quartz
{
    public interface IQuartzJobService : ITransientDependency
    {
        /// <summary>
        /// 开始运行一个任务调度器
        /// </summary>
        /// <returns></returns>
        Task<bool> RunAsync(Tasks tasks);

        /// <summary>
        /// 关闭任务调度
        /// </summary>
        /// <param name="tasks"></param>
        /// <returns></returns>
        Task<bool> CloseAsync(Tasks tasks);

    }
}
