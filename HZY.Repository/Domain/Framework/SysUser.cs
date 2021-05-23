using HZY.Repository.AppCore.Models;
using System;

namespace HZY.Repository.Domain.Framework
{
    /// <summary>
    /// 系统账号
    /// </summary>
    public class SysUser : GuidKeyBaseModel
    {
        /// <summary>
        /// 账户名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 登录账号
        /// </summary>
        public string LoginName { get; set; }

        /// <summary>
        /// 密码
        /// </summary>
        public string Password { get; set; }

        /// <summary>
        /// 账户邮件地址
        /// </summary>
        public string Email { get; set; }

        /// <summary>
        /// 能否删除
        /// </summary>
        public int IsDelete { get; set; } = 1;
    }
}