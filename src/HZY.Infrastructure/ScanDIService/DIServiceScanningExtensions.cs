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
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Loader;
using Microsoft.Extensions.DependencyInjection;

namespace HZY.Infrastructure.ScanDIService;

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
        #region 查找手动引用的程序集
        IEnumerable<Assembly> assemblies = new List<Assembly>();
        var entryAssembly = Assembly.GetEntryAssembly();
        if (entryAssembly == null) return assemblies;
        var referencedAssemblies = entryAssembly.GetReferencedAssemblies().Select(Assembly.Load);
        assemblies = new List<Assembly> { entryAssembly }.Union(referencedAssemblies);
        #endregion

        #region 将所有 dll 文件 重新载入 防止有未扫描到的 程序集
        var paths = Directory.GetFiles(AppDomain.CurrentDomain.BaseDirectory)
            .Where(w => w.EndsWith(".dll") && !w.Contains("Microsoft"))
            .Select(w => w)
         ;
        foreach (var item in paths)
        {
            if (File.Exists(item))
            {
                try
                {
                    Assembly.Load(AssemblyLoadContext.GetAssemblyName(item));
                }
                catch (Exception)
                {

                }
            }
        }
        assemblies = AssemblyLoadContext.Default.Assemblies.Union(assemblies);
        #endregion

        return @where == null ? assemblies : assemblies.Where(@where);
    }

}