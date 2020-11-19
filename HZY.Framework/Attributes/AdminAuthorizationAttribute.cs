using System;

namespace HZY.Framework.Attributes
{
    /// <summary>
    /// 控制器 接口 描述
    /// </summary>
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
    public class AdminAuthorizationAttribute : Attribute
    {
        /// <summary>
        /// 菜单 Id
        /// </summary>
        public string MenuId;

        /// <summary>
        /// 功能名称
        /// </summary>
        public string FunctionName;

        /// <summary>
        /// 授权检查 默认检查
        /// </summary>
        public bool AuthCheck = true;

        public AdminAuthorizationAttribute()
        {
        }

        public AdminAuthorizationAttribute(string functionName)
        {
            FunctionName = functionName;
        }
    }
}