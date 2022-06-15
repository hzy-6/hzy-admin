using HZY.Models.Entities.Framework;
using System;
using System.Collections.Generic;

namespace HZY.Models.DTO.Framework;

public class SysMenuFormDto
{
    public SysMenu Form { get; set; }
    public List<SysMenuFunction> MenuFunctionList { get; set; }
}