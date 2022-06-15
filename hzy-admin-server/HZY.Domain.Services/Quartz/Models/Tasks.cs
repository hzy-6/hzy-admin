using System;
using System.Text.Json.Serialization;

namespace HZY.Domain.Services.Quartz.Models
{
    /// <summary>
    /// 定时任务
    /// </summary>
    public class Tasks
    {
        /// <summary>
        /// Id
        /// </summary>
        public Guid? Id { get; set; }

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
        public TasksRequsetModeEnum RequsetMode { get; set; } = TasksRequsetModeEnum.Post;

        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }

        /// <summary>
        /// 运行状态
        /// </summary>
        public TasksStateEnum State { get; set; } = TasksStateEnum.未运行;

        /// <summary>
        /// 执行时间
        /// </summary>
        public DateTime? ExecuteTime { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime? CreateTime { get; set; }

    }

    /// <summary>
    /// 请求方式
    /// </summary>
    public enum TasksRequsetModeEnum
    {
        Post,
        Get,
        Delete
    }

    /// <summary>
    /// 状态情况
    /// </summary>
    public enum TasksStateEnum
    {
        未运行,
        运行中
    }

}
