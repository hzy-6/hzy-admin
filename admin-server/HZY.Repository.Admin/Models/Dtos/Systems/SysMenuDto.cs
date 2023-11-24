namespace HZY.Repository.Admin.Models.Dtos.Systems;

public class SysMenuDto : SysMenu
{

    /// <summary>
    /// 父级菜单名称
    /// </summary>
    public string? ParentName { get; set; }

}

