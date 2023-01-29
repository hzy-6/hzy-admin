using HZY.Models.Entities.BaseEntitys;

namespace HZY.Models.Entities.Quartz
{
    /// <summary>
    /// 作业任务
    /// </summary>
    public class QuartzJobTask : DefaultBaseEntityGuidKey
    {
        /// <summary>
        /// 任务名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 分组名称
        /// </summary>
        public string GroupName { get; set; }

        /// <summary>
        /// 间隔表达式
        /// </summary>
        public string Cron { get; set; }

        /// <summary>
        /// 请求地址
        /// </summary>
        public string ApiUrl { get; set; }

        /// <summary>
        /// 请求 token 密钥
        /// </summary>
        public string HeaderToken { get; set; }

        /// <summary>
        /// 请求方式
        /// </summary>
        public QuartzJobTaskRequsetModeEnum RequsetMode { get; set; } = QuartzJobTaskRequsetModeEnum.Post;

        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }

        /// <summary>
        /// 运行状态
        /// </summary>
        public QuartzJobTaskStateEnum State { get; set; } = QuartzJobTaskStateEnum.未运行;

        /// <summary>
        /// 执行时间
        /// </summary>
        public DateTime? ExecuteTime { get; set; }
    }

    /// <summary>
    /// 请求方式
    /// </summary>
    public enum QuartzJobTaskRequsetModeEnum
    {
        Post,
        Get,
        Delete
    }

    /// <summary>
    /// 状态情况
    /// </summary>
    public enum QuartzJobTaskStateEnum
    {
        未运行,
        运行中
    }
}
