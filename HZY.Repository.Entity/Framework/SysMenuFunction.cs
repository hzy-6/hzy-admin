using System;
using HZY.Repository.Entity.Core;

namespace HZY.Repository.Entity.Framework
{
    /// <summary>
    /// 菜单与功能绑定
    /// </summary>
    public class SysMenuFunction : GuidKeyBaseModel
    {
        public Guid MenuId { get; set; }
        public Guid FunctionId { get; set; }
    }
}