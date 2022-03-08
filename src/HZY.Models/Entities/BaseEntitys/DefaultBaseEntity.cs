using System;
using System.ComponentModel.DataAnnotations;

namespace HZY.Models.Entities.BaseEntitys;

/// <summary>
/// 基础模型
/// 包含属性 LastModificationTime、CreationTime
/// </summary>
public class DefaultBaseEntity
{
    /// <summary>
    /// 更新时间
    /// </summary>
    public virtual DateTime LastModificationTime { get; set; }

    /// <summary>
    /// 创建时间
    /// </summary>
    public virtual DateTime CreationTime { get; set; }
}

/// <summary>
/// 基础模型
/// 包含属性 Id、UpdateTime、CreateTime
/// </summary>
/// <typeparam name="TKey"></typeparam>
public class DefaultBaseEntity<TKey> : DefaultBaseEntity, IBaseEntity<TKey>
{
    [Key]
    public virtual TKey Id { get; set; } = default;
}
