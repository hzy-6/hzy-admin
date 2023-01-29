using HZY.Models.Entities.BaseEntitys;

namespace HZY.Models.Entities.Quartz
{
    /// <summary>
    /// 作业任务 日志
    /// </summary>
    public class QuartzJobTaskLog : DefaultBaseEntityGuidKey
    {
        /// <summary>
        /// 任务id
        /// </summary>
        public Guid JobTaskId { get; set; }

        /// <summary>
        /// 任务日志
        /// </summary>
        public string Text { get; set; }


    }
}
