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
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using Microsoft.Extensions.DependencyInjection;

namespace HZY.Common.ScanDIService
{
    /// <summary>
    /// 服务扫描扩展
    /// </summary>
    public static class DIServiceScanningExtensions
    {
        /// <summary>
        /// 扫描服务 自动注入服务
        /// </summary>
        /// <param name="serviceCollection"></param>
        /// <param name="assemblyFilter"></param>
        /// <exception cref="NotSupportedException"></exception>
        public static void ScanningAppServices(this IServiceCollection serviceCollection, string assemblyFilter = "")
            => new DIServiceScanningProvider().Start(serviceCollection, assemblyFilter);

        /// <summary>
        /// 获取所有的 程序集
        /// </summary>
        /// <param name="where"></param>
        /// <returns></returns>
        public static IEnumerable<Assembly> GetAssemblyList(Func<Assembly, bool> where = null)
        {
            //查找程序集
            IEnumerable<Assembly> assemblies = new List<Assembly>();
            var entryAssembly = Assembly.GetEntryAssembly();
            if (entryAssembly == null) return assemblies;

            var referencedAssemblies = entryAssembly.GetReferencedAssemblies().Select(Assembly.Load);
            assemblies = new List<Assembly> { entryAssembly }.Concat(referencedAssemblies);

            return @where == null ? assemblies : assemblies.Where(@where);
        }

    }
}