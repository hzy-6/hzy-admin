using System;
using System.Collections.Generic;
using HZY.Repository.Domain.Framework;

namespace HZY.Admin.Services.Bo
{
    /// <summary>
    /// 账户 业务对象
    /// </summary>
    public class AccountInfo
    {
        /// <summary>
        /// 用户名称
        /// </summary>
        public string UserName { get; set; }

        /// <summary>
        /// 角色ID
        /// </summary>
        public List<Guid> RoleIds { get; set; }

        /// <summary>
        /// 用户ID
        /// </summary>
        public Guid UserId { get; set; }

        /// <summary>
        /// 当前登录人 是否是 超级管理员
        /// </summary>
        public bool IsSuperManage { get; set; } = false;

        /// <summary>
        /// SysUser
        /// </summary>
        public SysUser SysUser { get; set; }
    }
}