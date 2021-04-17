using System;
using HZY.Repository.Core.Models;

namespace HZY.Repository.Domain.Framework
{
    /// <summary>
    /// 角色菜单功能绑定
    /// </summary>
    public class SysRoleMenuFunction : GuidKeyBaseModel
    {
        public Guid RoleId { get; set; }
        public Guid MenuId { get; set; }
        public Guid FunctionId { get; set; }
    }
}