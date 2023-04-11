namespace HZY.Repository.EntityFramework.Models;

public class DeleteEntity<TKey> : UpdateEntity<TKey>, IDeleteEntity, IUpdateEntity, IEntity<TKey>
{
    [InSwaggerFormHide]
    public virtual bool IsDeleted { get; set; } = false;
    [InSwaggerFormHide]
    public virtual Guid? DeleterUserId { get; set; }
    [InSwaggerFormHide]
    public virtual DateTime? DeletionTime { get; set; }
}

public interface IDeleteEntity
{
    /// <summary>
    /// 是否删除
    /// </summary>
    bool IsDeleted { get; set; }
    /// <summary>
    /// 删除用户
    /// </summary>
    Guid? DeleterUserId { get; set; }
    /// <summary>
    /// 删除时间
    /// </summary>
    DateTime? DeletionTime { get; set; }

}