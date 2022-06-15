using HZY.Models.Entities.Framework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Models.DTO.Framework;

public class SysMenuTreeDto : SysMenu
{

    /// <summary>
    /// 父级菜单名称
    /// </summary>
    public string ParentName { get; set; }

    /// <summary>
    /// 子级菜单
    /// </summary>
    public List<SysMenuTreeDto> Children { get; set; } = new List<SysMenuTreeDto>();


}

