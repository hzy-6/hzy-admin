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
using HZY.Toolkit.Attributes;
using Microsoft.Extensions.DependencyInjection;

namespace HZY.Toolkit
{
    /// <summary>
    /// 服务扫描扩展
    /// </summary>
    public static class ServiceScanningExtensions
    {
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

        /// <summary>
        /// 扫描服务 AppService 标记 自动注入服务
        /// </summary>
        /// <param name="serviceCollection"></param>
        /// <param name="assemblyFilter"></param>
        /// <exception cref="NotSupportedException"></exception>
        public static void ScanAppServices(this IServiceCollection serviceCollection, string assemblyFilter = "HZY.")
        {
            var assemblies = ServiceScanningExtensions.GetAssemblyList(w =>
            {
                var name = w.GetName().Name;
                return name != null && name.StartsWith(assemblyFilter);
            });

            foreach (var item in assemblies)
            {
                var classList = item.ExportedTypes
                    .Where(w => w.GetCustomAttribute<AppServiceAttribute>() != null ||
                                w.BaseType?.GetCustomAttribute<AppServiceAttribute>() != null)
                    .ToList();

                foreach (var classItem in classList)
                {
                    var appService = classItem.GetCustomAttribute<AppServiceAttribute>();
                    //判断 父级 类 是否 设置 忽略当前 服务
                    if (appService != null && appService.IgnoreCurrent) continue;

                    if (appService == null && classItem.BaseType != null)
                    {
                        appService = classItem.BaseType.GetCustomAttribute<AppServiceAttribute>();
                    }

                    if (appService == null) continue;
                    var interfaces = classItem.GetInterfaces();
                    if (interfaces.Length > 1)
                    {
                        throw new Exception("实现类继承多个接口无法自动注册！");
                    }

                    Type interfaceType = null;
                    if (classItem.BaseType == typeof(object) && interfaces.Length == 1)
                    {
                        interfaceType = interfaces.FirstOrDefault();
                    }

                    switch (appService.GetAppServiceType())
                    {
                        case AppServiceType.Scoped:
                            if (interfaceType == null)
                                serviceCollection.AddScoped(classItem);
                            else
                                serviceCollection.AddScoped(interfaceType, classItem);
                            break;
                        case AppServiceType.Transient:
                            if (interfaceType == null)
                                serviceCollection.AddTransient(classItem);
                            else
                                serviceCollection.AddTransient(classItem, interfaceType);
                            break;
                        case AppServiceType.Singleton:
                            if (interfaceType == null)
                                serviceCollection.AddSingleton(classItem);
                            else
                                serviceCollection.AddSingleton(classItem, interfaceType);
                            break;
                        default:
                            throw new NotSupportedException();
                            //break;
                    }
                }
            }
        }
    }
}