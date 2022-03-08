using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Infrastructure.Permission
{
    /// <summary>
    /// 用于获取权限所需要的菜单等一些信息，约束控制器
    /// </summary>
    public interface IApiPermissionController
    {
        string GetCurrentMenuId();


    }
}