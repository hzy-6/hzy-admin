using HZY.Controllers.Admin.ControllersAdmin;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Infrastructure.Quartz;
using HZY.Quartz.Entitys;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Controllers.Admin.DevelopmentTool
{
    /// <summary>
    /// 系统账号管理
    /// </summary>
    public class QuartzTasksController : AdminBaseController<ITaskService>
    {
        private readonly IJobLoggerService _jobLoggerService;

        public QuartzTasksController(ITaskService defaultService, IJobLoggerService jobLoggerService) : base("30", defaultService)
        {
            _jobLoggerService = jobLoggerService;
        }

        /// <summary>
        /// 获取列表
        /// </summary>
        /// <param name="filter"></param>
        /// <returns></returns>
        [HttpPost("FindList/{filter?}")]
        public async Task<List<Tasks>> FindListAsync([FromRoute] string filter) => (await DefaultService.FindListAsync(filter))?.ToList();

        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="form"></param>
        /// <returns></returns>
        [HttpPost("SaveForm")]
        public async Task<Tasks> SaveFormAsync([FromBody] Tasks form) => await DefaultService.SaveAsync(form);

        /// <summary>
        /// 删除数据
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpPost("DeleteList")]
        public async Task<bool> DeleteListAsync([FromBody] List<Guid> ids) => await DefaultService.DeleteAsync(ids);

        /// <summary>
        /// 根据Id 查询表单数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        [HttpGet("FindForm/{id?}")]
        public async Task<Tasks> FindFormAsync([FromRoute] Guid id) => await DefaultService.FindByIdAsync(id);

        /// <summary>
        /// 根据任务id 运行任务调度
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpPost("Run")]
        public async Task<bool> RunAsync([FromBody] List<Guid> ids)
        {
            foreach (var item in ids)
            {
                await DefaultService.RunByIdAsync(item);
            }
            return true;
        }

        /// <summary>
        /// 根据任务id 关闭任务调度
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        [HttpPost("Close")]
        public async Task<bool> CloseAsync([FromBody] List<Guid> ids)
        {
            foreach (var item in ids)
            {
                await DefaultService.CloseByIdAsync(item);
            }
            return true;
        }

        /// <summary>
        /// 获取运行日志
        /// </summary>
        /// <param name="taskId"></param>
        /// <param name="page"></param>
        /// <param name="size"></param>
        /// <returns></returns>
        [HttpGet("GetJobLoggers/{taskId}/{page}/{size}")]
        public List<JobLoggerInfo> GetJobLoggers([FromRoute] Guid taskId, [FromRoute] int page, [FromRoute] int size)
        {
            return _jobLoggerService.FindListById(taskId)
                .OrderByDescending(w => w.CreateTime)
                .Skip((page - 1) * size)
                .Take(size)
                .ToList()
                ;
        }



    }
}
