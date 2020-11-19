using System;
using HZY.Models.Core;

namespace HZY.Models.Framework
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