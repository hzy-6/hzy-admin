using System;

namespace HZY.Framework.Permission.Attributes
{
    /// <summary>
    /// 控制器 接口 描述
    /// </summary>
    [AttributeUsage(AttributeTargets.Class, AllowMultiple = true, Inherited = true)]
    public class ControllerDescriptorAttribute : Attribute
    {
        /// <summary>
        /// 菜单 Id
        /// </summary>
        private readonly string _menuId;

        /// <summary>
        /// 授权检查 默认检查
        /// </summary>
        public bool AuthCheck = true;

        public ControllerDescriptorAttribute()
        {

        }

        public ControllerDescriptorAttribute(string menuId)
        {
            _menuId = menuId;
        }

        /// <summary>
        /// 获取菜单 Id
        /// </summary>
        /// <returns></returns>
        public string GetMenuId() => this._menuId;

    }
}