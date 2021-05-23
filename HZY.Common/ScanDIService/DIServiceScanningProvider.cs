/*
 * *******************************************************
 *
 * 作者：hzy
 *
 * 开源地址：https://gitee.com/hzy6
 *
 * *******************************************************
 */

using HZY.Common.ScanDIService.Attributes;
using HZY.Common.ScanDIService.Enums;
using HZY.Common.ScanDIService.Interface;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;

namespace HZY.Common.ScanDIService
{
    /// <summary>
    /// 扫描服务
    /// </summary>
    public class DIServiceScanningProvider
    {

        /// <summary>
        /// 开始扫描
        /// </summary>
        public void Start(IServiceCollection serviceCollection, string assemblyFilter = "")
        {
            IEnumerable<Assembly> assemblies = default;

            if (string.IsNullOrWhiteSpace(assemblyFilter))
            {
                assemblies = DIServiceScanningExtensions.GetAssemblyList();
            }
            else
            {
                assemblies = DIServiceScanningExtensions.GetAssemblyList(w =>
                {
                    var name = w.GetName().Name;
                    return name != null && name.StartsWith(assemblyFilter);
                });
            }

            if (assemblies == null) return;

            #region Interface 方式 自动注册

            serviceCollection.Scan(w =>
            {
                w.FromAssemblies(assemblies)
                    //接口注册Scoped
                    .AddClasses(classes => classes.AssignableTo(typeof(IDIScoped)))
                        .AsImplementedInterfaces()
                        .WithScopedLifetime()
                    //接口注册Singleton
                    .AddClasses(classes => classes.AssignableTo(typeof(IDISingleton)))
                          .AsImplementedInterfaces()
                          .WithSingletonLifetime()
                    //接口注册Transient
                    .AddClasses(classes => classes.AssignableTo(typeof(IDITransient)))
                          .AsImplementedInterfaces()
                          .WithTransientLifetime()
                    //具体类注册Scoped
                    .AddClasses(classes => classes.AssignableTo(typeof(IDIScopedSelf)))
                          .AsSelf()
                          .WithScopedLifetime()
                    //具体类注册Singleton
                    .AddClasses(classes => classes.AssignableTo(typeof(IDISingletonSelf)))
                          .AsSelf()
                          .WithSingletonLifetime()
                    //具体类注册Transient
                    .AddClasses(classes => classes.AssignableTo(typeof(IDITransientSelf)))
                          .AsSelf()
                          .WithTransientLifetime();
            });

            #endregion

            #region AppService 特性 方式 自动注册

            foreach (var item in assemblies)
            {
                var classList = item.ExportedTypes
                    .Where(w => w.GetCustomAttribute<DIServiceAttribute>() != null || w.BaseType?.GetCustomAttribute<DIServiceAttribute>() != null);

                foreach (var classItem in classList)
                {
                    this.ScanningAppServiceAttribute(serviceCollection, classItem);
                }
            }

            #endregion

        }

        /// <summary>
        /// 扫描特性 class
        /// </summary>
        /// <param name="serviceCollection"></param>
        /// <param name="classType"></param>
        private void ScanningAppServiceAttribute(IServiceCollection serviceCollection, Type classType)
        {

            var appService = classType.GetCustomAttribute<DIServiceAttribute>();
            //判断 父级 类 是否 设置 忽略当前 服务
            if (appService != null && appService.IgnoreCurrent) return;

            if (appService == null && classType.BaseType != null)
            {
                appService = classType.BaseType.GetCustomAttribute<DIServiceAttribute>();
            }

            if (appService == null) return;
            var interfaces = classType.GetInterfaces();
            if (interfaces.Length > 1)
            {
                throw new Exception("实现类继承多个接口无法自动注册！");
            }

            Type interfaceType = null;
            if (classType.BaseType == typeof(object) && interfaces.Length == 1)
            {
                interfaceType = interfaces.FirstOrDefault();
            }

            switch (appService.GetAppServiceType())
            {
                case DIType.Scoped:
                    if (interfaceType == null)
                        serviceCollection.AddScoped(classType);
                    else
                        serviceCollection.AddScoped(interfaceType, classType);
                    break;
                case DIType.Transient:
                    if (interfaceType == null)
                        serviceCollection.AddTransient(classType);
                    else
                        serviceCollection.AddTransient(classType, interfaceType);
                    break;
                case DIType.Singleton:
                    if (interfaceType == null)
                        serviceCollection.AddSingleton(classType);
                    else
                        serviceCollection.AddSingleton(classType, interfaceType);
                    break;
                default:
                    throw new NotSupportedException();
                    //break;
            }


        }





    }
}
