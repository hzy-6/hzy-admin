namespace HZY.Repository.EntityFramework.Models;

public class Entity<TKey> : IEntity<TKey>
{
    [InSwaggerFormHide]
    [Key]
    public virtual TKey Id { get; set; }
}

public interface IEntity<TKey> : IEntity
{
    TKey Id { get; set; }
}

/// <summary>
/// dbset 自动填充标识
/// </summary>
public interface IEntity
{

}