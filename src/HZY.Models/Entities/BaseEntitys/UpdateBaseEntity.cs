using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Models.Entities.BaseEntitys;

public class UpdateBaseEntity<TKey> : CreateBaseEntity<TKey>, IUpdateBaseEntity, ICreateBaseEntity, IBaseEntity<TKey>
{
    public virtual Guid? LastModifierUserId { get; set; }
    public virtual DateTime? LastModificationTime { get; set; }
}

public interface IUpdateBaseEntity
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