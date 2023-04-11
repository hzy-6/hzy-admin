namespace HZY.Repository.EntityFramework.Models;

public class UpdateEntity<TKey> : CreateEntity<TKey>, IUpdateEntity, ICreateEntity, IEntity<TKey>
{
    [InSwaggerFormHide]
    public virtual Guid? LastModifierUserId { get; set; }
    [InSwaggerFormHide]
    public virtual DateTime? LastModificationTime { get; set; }
}

public interface IUpdateEntity
{
    /// <summary>
    /// 更新用户
    /// </summary>
    Guid? LastModifierUserId { get; set; }
    /// <summary>
    /// 更新时间
    /// </summary>
    DateTime? LastModificationTime { get; set; }
}