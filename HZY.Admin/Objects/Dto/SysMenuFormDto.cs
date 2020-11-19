using System;
using System.Collections.Generic;
using HZY.Models.Framework;

namespace HZY.Admin.Objects.Dto
{
    public class SysMenuFormDto
    {
        public SysMenu Model { get; set; }
        public List<Guid> FunctionIds { get; set; }
    }
}