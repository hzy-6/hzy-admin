﻿namespace HZY.Repository.EntityFramework.Models;

/// <summary>
/// 全量模型 主键为 Guid
/// 包含属性 
/// Id=主键、
/// LastModificationTime=最后更新时间 、
/// LastModifierUserId=最后更新人Id、
/// CreationTime=创建时间 、
/// CreatorUserId=创建人Id、
/// IsDeleted=是否删除、
/// DeleterUserId=删除人、
/// DeletionTime=删除时间
/// </summary>
public class FullEntity : DeleteEntity<Guid>, IDeleteEntity, IUpdateEntity, IEntity<Guid>
{

}

/// <summary>
/// 全量模型 主键为 int 自增
/// 包含属性 
/// Id=主键、
/// LastModificationTime=最后更新时间 、
/// LastModifierUserId=最后更新人Id、
/// CreationTime=创建时间 、
/// CreatorUserId=创建人Id、
/// IsDeleted=是否删除、
/// DeleterUserId=删除人、
/// DeletionTime=删除时间
/// </summary>
public class FullEntityIdentityIntKey : DeleteEntity<int>, IDeleteEntity, IUpdateEntity, IEntity<int>
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public override int Id { get; set; }
}

/// <summary>
/// 基础模型 主键为 string
/// 包含属性 
/// Id=主键、
/// LastModificationTime=最后更新时间 、
/// LastModifierUserId=最后更新人Id、
/// CreationTime=创建时间 、
/// CreatorUserId=创建人Id、
/// IsDeleted=是否删除、
/// DeleterUserId=删除人、
/// DeletionTime=删除时间
/// </summary>
public class FullEntityStringKey : DeleteEntity<string>, IDeleteEntity, IUpdateEntity, IEntity<string>
{

}

/// <summary>
/// 全量模型 主键为 自己定义传入
/// 包含属性 
/// Id=主键、
/// LastModificationTime=最后更新时间 、
/// LastModifierUserId=最后更新人Id、
/// CreationTime=创建时间 、
/// CreatorUserId=创建人Id、
/// IsDeleted=是否删除、
/// DeleterUserId=删除人、
/// DeletionTime=删除时间
/// </summary>
/// <typeparam name="TKey"></typeparam>
public class FullEntity<TKey> : DeleteEntity<TKey>, IDeleteEntity, IUpdateEntity, IEntity<TKey>
{

}

