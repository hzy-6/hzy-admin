/*
 * *******************************************************
 *
 * 作者：hzy
 *
 * 开源地址：https://gitee.com/hzy6
 *
 * *******************************************************
 */
using System;

namespace HZY.Toolkit.Attributes
{
    /// <summary>
    /// 服务标记 用于 程序 启动 扫描到后自动 注册服务
    /// </summary>
    [AttributeUsage(AttributeTargets.Class, AllowMultiple = false, Inherited = false)]
    public class AppServiceAttribute : Attribute
    {
        private readonly AppServiceType _serviceType;

        /// <summary>
        /// 忽略当前 对象 服务
        /// </summary>
        public bool IgnoreCurrent { get; set; } = false;

        public AppServiceAttribute(AppServiceType serviceType = AppServiceType.Scoped)
        {
            this._serviceType = serviceType;
        }

        public AppServiceType GetAppServiceType()
        {
            return this._serviceType;
        }
    }

    public enum AppServiceType
    {
        Scoped,
        Transient,
        Singleton
    }
}