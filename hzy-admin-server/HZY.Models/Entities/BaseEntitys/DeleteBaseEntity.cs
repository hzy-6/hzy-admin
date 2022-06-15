using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Models.Entities.BaseEntitys;

public class DeleteBaseEntity<TKey> : UpdateBaseEntity<TKey>, IDeleteBaseEntity, IUpdateBaseEntity, IBaseEntity<TKey>
{
    public virtual bool IsDeleted { get; set; } = false;
    public virtual Guid? DeleterUserId { get; set; }
    public virtual DateTime? DeletionTime { get; set; }
}

public interface IDeleteBaseEntity
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