using HZY.Repository.AppCore.Models;
using System;

namespace HZY.Repository.Domain.Framework
{
    /// <summary>
    /// 菜单
    /// </summary>
    public class SysMenu : GuidKeyBaseModel
    {
        /// <summary>
        /// 编号
        /// </summary>
        public int? Number { get; set; }

        /// <summary>
        /// 菜单名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 菜单地址
        /// </summary>
        public string Url { get; set; }

        /// <summary>
        /// 菜单图标
        /// </summary>
        public string Icon { get; set; }

        /// <summary>
        /// 父级Id
        /// </summary>
        public Guid? ParentId { get; set; }

        /// <summary>
        /// 是否显示菜单
        /// </summary>
        public int IsShow { get; set; } = 1;

        /// <summary>
        /// 是否可关闭
        /// </summary>
        public int IsClose { get; set; } = 1;
    }
}