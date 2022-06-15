using System;
using System.Collections.Generic;
using System.Text;
using AutoMapper;

namespace HZY.Infrastructure;

/// <summary>
/// 对象映射类
/// </summary>
public static class ObjectMapper
{
    /// <summary>
    /// copy object
    /// </summary>
    /// <typeparam name="TOld">旧对象类型</typeparam>
    /// <typeparam name="TNew">新复制对象类型</typeparam>
    /// <param name="source"></param>
    /// <returns></returns>
    public static TNew MapTo<TOld, TNew>(this TOld source)
    {
        if (source == null) return default;

        var config = new MapperConfiguration(cfg => cfg.CreateMap<TOld, TNew>());
        var mapper = config.CreateMapper();

        return mapper.Map<TNew>(source);
    }

    /// <summary>
    /// copy list
    /// </summary>
    /// <typeparam name="TOld">旧对象类型</typeparam>
    /// <typeparam name="TNew">新复制对象类型</typeparam>
    /// <param name="source"></param>
    /// <returns></returns>
    public static List<TNew> MapToList<TOld, TNew>(this IEnumerable<TOld> source)
    {
        if (source == null) return default;

        var config = new MapperConfiguration(cfg => cfg.CreateMap<TOld, TNew>());
        var mapper = config.CreateMapper();

        return mapper.Map<List<TNew>>(source);
    }
}