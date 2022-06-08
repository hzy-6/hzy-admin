using HZY.Domain.Services.Quartz.Models;
using HzyScanDiService;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace HZY.Domain.Services.Quartz
{
    /// <summary>
    /// 任务 Job 服务
    /// </summary>
    public interface ITaskService : ITransientDependency
    {

        /// <summary>
        /// 查询列表
        /// </summary>
        /// <returns></returns>
        Task<IEnumerable<Tasks>> FindListAsync(string filter = null);

        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="form"></param>
        /// <returns></returns>
        Task<Tasks> SaveAsync(Tasks form);

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <returns></returns>
        Task<bool> DeleteAsync(List<Guid> ids);

        /// <summary>
        /// 根据Id 查询 任务
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        Task<Tasks> FindByIdAsync(Guid id);

        /// <summary>
        /// 根据任务id 运行任务调度
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        Task<bool> RunByIdAsync(Guid id);

        /// <summary>
        /// 根据任务id 关闭任务调度
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        Task<bool> CloseByIdAsync(Guid id);

        /// <summary>
        /// 更新执行时间
        /// </summary>
        /// <param name="tasksId"></param>
        /// <param name="dateTime"></param>
        /// <returns></returns>
        Task<bool> UpdateExecuteTime(Guid tasksId, DateTime dateTime);

        /// <summary>
        /// 恢复任务
        /// </summary>
        /// <returns></returns>
        Task<bool> RecoveryTaskAsync();

    }
}
