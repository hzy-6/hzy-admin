namespace HZY.Repository.EntityFramework.Models;

/// <summary>
/// 基础模型 主键为 Guid
/// 包含属性 Id=主键、
/// LastModificationTime=最后更新时间 、
/// LastModifierUserId=最后更新人Id、
/// CreationTime=创建时间 、
/// CreatorUserId=创建人Id
/// </summary>
public class DefaultEntity : UpdateEntity<Guid>
{

}

/// <summary>
/// 基础模型 主键为 int 自增
/// 包含属性 Id=主键、
/// LastModificationTime=最后更新时间 、
/// LastModifierUserId=最后更新人Id、
/// CreationTime=创建时间 、
/// CreatorUserId=创建人Id
/// </summary>
public class DefaultEntityIdentityIntKey : UpdateEntity<int>
{
    [Key]
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
    public override int Id { get; set; }
}

/// <summary>
/// 基础模型 主键为 string
/// 包含属性 Id=主键、
/// LastModificationTime=最后更新时间 、
/// LastModifierUserId=最后更新人Id、
/// CreationTime=创建时间 、
/// CreatorUserId=创建人Id
/// </summary>
public class DefaultEntityStringKey : UpdateEntity<string>
{

}

/// <summary>
/// 基础模型 主键为 自己定义传入
/// 包含属性 Id=主键、
/// LastModificationTime=最后更新时间 、
/// LastModifierUserId=最后更新人Id、
/// CreationTime=创建时间 、
/// CreatorUserId=创建人Id
/// </summary>
/// <typeparam name="TKey"></typeparam>
public class DefaultEntity<TKey> : UpdateEntity<TKey>
{

}