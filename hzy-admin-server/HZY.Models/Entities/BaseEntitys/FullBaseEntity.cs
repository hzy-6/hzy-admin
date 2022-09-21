using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Models.Entities.BaseEntitys;


/// <summary>
/// 全量模型 主键为 Guid
/// 包含属性 LastModificationTime=最后更新时间 、LastModifierUserId=最后更新人Id、CreationTime=创建时间 、CreatorUserId=创建人Id、IsDeleted=是否删除、DeleterUserId=删除人、DeletionTime=删除时间
/// </summary>
public class FullBaseEntityGuidKey : DeleteBaseEntity<Guid>, IDeleteBaseEntity, IUpdateBaseEntity, IBaseEntity<Guid>
{

}

/// <summary>
/// 全量模型 主键为 int 自增
/// 包含属性 LastModificationTime=最后更新时间 、LastModifierUserId=最后更新人Id、CreationTime=创建时间 、CreatorUserId=创建人Id、IsDeleted=是否删除、DeleterUserId=删除人、DeletionTime=删除时间
/// </summary>
public class FullBaseEntityIdentityIntKey : DeleteBaseEntity<int>, IDeleteBaseEntity, IUpdateBaseEntity, IBaseEntity<int>
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public override int Id { get; set; }
}

/// <summary>
/// 基础模型 主键为 string
/// 包含属性 LastModificationTime=最后更新时间 、LastModifierUserId=最后更新人Id、CreationTime=创建时间 、CreatorUserId=创建人Id、IsDeleted=是否删除、DeleterUserId=删除人、DeletionTime=删除时间
/// </summary>
public class FullBaseEntityStringKey : DeleteBaseEntity<string>, IDeleteBaseEntity, IUpdateBaseEntity, IBaseEntity<string>
{

}

/// <summary>
/// 全量模型 主键为 自己定义传入
/// 包含属性 LastModificationTime=最后更新时间 、LastModifierUserId=最后更新人Id、CreationTime=创建时间 、CreatorUserId=创建人Id、IsDeleted=是否删除、DeleterUserId=删除人、DeletionTime=删除时间
/// </summary>
/// <typeparam name="TKey"></typeparam>
public class FullBaseEntity<TKey> : DeleteBaseEntity<TKey>, IDeleteBaseEntity, IUpdateBaseEntity, IBaseEntity<TKey>
{

}

