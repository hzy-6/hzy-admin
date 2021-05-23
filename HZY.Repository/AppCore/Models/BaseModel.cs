using System;

namespace HZY.Repository.AppCore.Models
{
    /// <summary>
    /// 基础模型
    /// 包含属性 Id、UpdateTime、CreateTime
    /// </summary>
    public class BaseModel
    {
        /// <summary>
        /// 更新时间
        /// </summary>
        public DateTime UpdateTime { get; set; }

        /// <summary>
        /// 创建时间
        /// </summary>
        public DateTime CreateTime { get; set; }
    }
}