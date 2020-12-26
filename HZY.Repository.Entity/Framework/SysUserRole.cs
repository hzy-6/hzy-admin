using System;
using HZY.Repository.Entity.Core;

namespace HZY.Repository.Entity.Framework
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