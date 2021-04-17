using System;
using System.Collections.Generic;
using HZY.Repository.Domain.Framework;

namespace HZY.Admin.Services.Dto
{
    public class SysMenuFormDto
    {
        public SysMenu Form { get; set; }
        public List<Guid> FunctionIds { get; set; }
    }
}