using System;
using HZY.Repository.Core.Models;

namespace HZY.Repository.Domain.Framework
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