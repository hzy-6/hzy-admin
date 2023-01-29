using HZY.Framework.AutoRegisterIOC;
using HZY.Models.Entities.Quartz;

namespace HZY.Managers.Quartz
{
    public interface IQuartzJobService : ITransientDependency
    {
        /// <summary>
        /// 开始运行一个任务调度器
        /// </summary>
        /// <returns></returns>
        Task<bool> RunAsync(QuartzJobTask tasks);

        /// <summary>
        /// 关闭任务调度
        /// </summary>
        /// <param name="tasks"></param>
        /// <returns></returns>
        Task<bool> CloseAsync(QuartzJobTask tasks);

    }
}
