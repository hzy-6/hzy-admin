using HZY.Models.Entities.BaseEntitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Models.Entities.AllPeopleGoGoGo
{
    /// <summary>
    /// 任务库
    /// </summary>
    public class TaskLibrary : DefaultBaseEntity<Guid>
    {

        /// <summary>
        /// 编号
        /// </summary>
        public string Number { get; set; }

        /// <summary>
        /// 任务标题
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 摘要描述
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// 封面图
        /// </summary>
        public string CoverPicture { get; set; }

        /// <summary>
        /// 图片
        /// </summary>
        public string Picture { get; set; }

        /// <summary>
        /// 答案
        /// </summary>
        public string Answer { get; set; }

        /// <summary>
        /// 分值
        /// </summary>
        public int Score { get; set; }

        /// <summary>
        /// 难度等级
        /// </summary>
        public int DifficultyLevel { get; set; }

        /// <summary>
        /// 任务类型 => 数据字典获取值
        /// </summary>
        public string Type { get; set; }

        /// <summary>
        /// 任务分类 => 数据字典获取值
        /// </summary>
        public string Classify { get; set; }

    }
}
