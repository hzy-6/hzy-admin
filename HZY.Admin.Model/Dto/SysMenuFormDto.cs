using System;
using System.Collections.Generic;
using HZY.Repository.Entity.Framework;

namespace HZY.Admin.Model.Dto
{
    public class SysMenuFormDto
    {
        public SysMenu Form { get; set; }
        public List<Guid> FunctionIds { get; set; }
    }
}