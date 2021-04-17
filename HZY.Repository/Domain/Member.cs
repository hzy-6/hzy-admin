using System;
using System.ComponentModel.DataAnnotations;
using HZY.Repository.Core.Models;

namespace HZY.Repository.Domain
{
    /// <summary>
    /// member
    /// </summary>
    public class Member : GuidKeyBaseModel
    {
        /// <summary>
        /// 编号
        /// </summary>
        public string Number { get; set; }

        /// <summary>
        /// 用户名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 电话号码
        /// </summary>
        public string Phone { get; set; }

        /// <summary>
        /// 性别
        /// </summary>
        public string Sex { get; set; }

        /// <summary>
        /// 生日
        /// </summary>
        public DateTime Birthday { get; set; } = DateTime.Now;

        /// <summary>
        /// 头像
        /// </summary>
        public string Photo { get; set; }

        /// <summary>
        /// 简介
        /// </summary>
        public string Introduce { get; set; }

        /// <summary>
        /// 文件
        /// </summary>
        public string FilePath { get; set; }

        /// <summary>
        /// 账户Id
        /// </summary>
        [Required(ErrorMessage = "请选择账户信息!")]
        public Guid? UserId { get; set; }
    }
}