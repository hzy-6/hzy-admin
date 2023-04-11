namespace HZY.Repository.EntityFramework.Models;

public class CreateEntity<TKey> : Entity<TKey>, ICreateEntity, IEntity<TKey>
{
    [InSwaggerFormHide]
    public virtual Guid? CreatorUserId { get; set; }

    [InSwaggerFormHide]
    public virtual DateTime CreationTime { get; set; } = DateTime.Now;
}

public interface ICreateEntity
{
    /// <summary>
    /// 创建用户
    /// </summary>

    Guid? CreatorUserId { get; set; }

    /// <summary>
    /// 创建时间
    /// </summary>
    DateTime CreationTime { get; set; }
}