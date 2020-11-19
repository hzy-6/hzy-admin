using System;
using HZY.Models.Core;

namespace HZY.Models.Framework
{
    /// <summary>
    /// 用户与角色绑定
    /// </summary>
    public class SysUserRole : GuidKeyBaseModel
    {
        public Guid UserId { get; set; }
        public Guid RoleId { get; set; }
    }
}