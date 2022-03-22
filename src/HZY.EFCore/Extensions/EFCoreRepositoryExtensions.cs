using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;

namespace HZY.EFCore.Extensions;

/// <summary>
/// 仓储扩展
/// </summary>
public static class EFCoreRepositoryExtensions
{

    /// <summary>
    /// 获取 PropertyInfo 集合
    /// </summary>
    /// <param name="type"></param>
    /// <param name="bindingFlags"></param>
    /// <returns></returns>
    public static PropertyInfo[] GetPropertyInfos(this Type type, BindingFlags bindingFlags = BindingFlags.Instance | BindingFlags.Public)
        => type.GetProperties(bindingFlags);

    /// <summary>
    /// 创建 对象实例
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <returns></returns>
    public static T CreateInstance<T>()
    {
        var type = typeof(T);
        if (type.IsValueType || typeof(T) == typeof(string))
            return default;
        return (T)Activator.CreateInstance(type);
    }

    /// <summary>
    /// 获取 对象 中 某个属性得 标记
    /// </summary>
    /// <typeparam name="T"></typeparam>
    /// <param name="type"></param>
    /// <param name="name"></param>
    /// <returns></returns>
    public static T GetAttribute<T>(this Type type, string name)
        where T : Attribute
        => GetPropertyInfo(type, name).GetCustomAttribute(typeof(T)) as T;

    /// <summary>
    /// 获取 PropertyInfo 对象
    /// </summary>
    /// <param name="type"></param>
    /// <param name="name"></param>
    /// <returns></returns>
    public static PropertyInfo GetPropertyInfo(this Type type, string name) => type.GetProperty(name);

    /// <summary>
    /// 获取 模型 有 Key 特性得 属性对象
    /// </summary>
    /// <param name="type"></param>
    /// <param name="isCheckKey"></param>
    /// <returns></returns>
    /// <exception cref="InvalidOperationException"></exception>
    public static PropertyInfo GetKeyProperty(this Type type, bool isCheckKey = true)
    {
        if (isCheckKey)
        {
            var keyAttribute = (KeyAttribute)Attribute.GetCustomAttributes(type, true).Where(item => item is KeyAttribute).FirstOrDefault();

            if (keyAttribute == null)
            {
                throw new InvalidOperationException($"实体类型：{type.FullName}未设置主键标记 “[Key]” ");
            }
        }

        var propertyInfo = GetPropertyInfos(type)
            .FirstOrDefault(item => item.GetCustomAttribute(typeof(KeyAttribute)) != null);

        return propertyInfo;
    }

    /// <summary>
    /// 是否有 KeyAttribute 标记
    /// </summary>
    /// <param name="propertyInfo"></param>
    /// <returns></returns>
    public static bool HasKey(PropertyInfo propertyInfo)
        => propertyInfo.GetCustomAttribute(typeof(KeyAttribute)) != null;

    #region LINQ 扩展

    /// <summary>
    /// WhereIf
    /// </summary>
    /// <param name="query"></param>
    /// <param name="if"></param>
    /// <param name="expWhere"></param>
    /// <typeparam name="T"></typeparam>
    /// <returns></returns>
    public static IQueryable<T> WhereIf<T>(this IQueryable<T> query, bool @if, Expression<Func<T, bool>> expWhere)
        => @if ? query.Where(expWhere) : query;

    /// <summary>
    /// WhereIf
    /// </summary>
    /// <param name="query"></param>
    /// <param name="if"></param>
    /// <param name="expWhere"></param>
    /// <typeparam name="T"></typeparam>
    /// <returns></returns>
    public static IEnumerable<T> WhereIf<T>(this IEnumerable<T> query, bool @if, Func<T, bool> expWhere)
        => @if ? query.Where(expWhere) : query;

    /// <summary>
    /// Page 分页简写
    /// </summary>
    /// <param name="query"></param>
    /// <param name="page"></param>
    /// <param name="rows"></param>
    /// <typeparam name="T"></typeparam>
    /// <returns></returns>
    public static IQueryable<T> Page<T>(this IQueryable<T> query, int page, int rows)
        => query.Skip((page - 1) * rows).Take(rows);

    #endregion

}