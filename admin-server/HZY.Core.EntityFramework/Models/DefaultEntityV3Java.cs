namespace HZY.Core.EntityFramework.Models;

/// <summary>
/// 基础模型 主键为 Guid
/// 包含属性 Id=主键、
/// UpdateTime=最后更新时间 、
/// UpdateBy=最后更新人Id、
/// CreateTime=创建时间 、
/// CreateBy=创建人Id、
/// DelFlag=是否删除
/// </summary>
public class DefaultEntityV3Java : DefaultEntityV2
{
    /// <summary>
    /// 删除标识
    /// </summary>
    public virtual bool? DelFlag { get; set; }


}

/// <summary>
/// 基础模型 主键为 int 自增
/// 包含属性 Id=主键、
/// UpdateTime=最后更新时间 、
/// UpdateBy=最后更新人Id、
/// CreateTime=创建时间 、
/// CreateBy=创建人Id、
/// DelFlag=是否删除
/// </summary>
public class DefaultEntityIdentityIntKeyV3Java : DefaultEntityIdentityIntKeyV2
{
    /// <summary>
    /// 删除标识
    /// </summary>
    public virtual bool? DelFlag { get; set; }
}

/// <summary>
/// 基础模型 主键为 int 自增
/// 包含属性 Id=主键、
/// UpdateTime=最后更新时间 、
/// UpdateBy=最后更新人Id、
/// CreateTime=创建时间 、
/// CreateBy=创建人Id、
/// DelFlag=是否删除
/// </summary>
public class DefaultEntityIdentityLongKeyV3Java : DefaultEntityIdentityLongKeyV2
{
    /// <summary>
    /// 删除标识
    /// </summary>
    public virtual bool? DelFlag { get; set; }
}

/// <summary>
/// 基础模型 主键为 string
/// 包含属性 Id=主键、
/// UpdateTime=最后更新时间 、
/// UpdateBy=最后更新人Id、
/// CreateTime=创建时间 、
/// CreateBy=创建人Id、
/// DelFlag=是否删除
/// </summary>
public class DefaultEntityStringKeyV3Java : DefaultEntityStringKeyV2
{
    /// <summary>
    /// 删除标识
    /// </summary>
    public virtual bool? DelFlag { get; set; }
}

/// <summary>
/// 基础模型 主键为 自己定义传入
/// 包含属性 Id=主键、
/// UpdateTime=最后更新时间 、
/// UpdateBy=最后更新人Id、
/// CreateTime=创建时间 、
/// CreateBy=创建人Id、
/// DelFlag=是否删除
/// </summary>
/// <typeparam name="TKey"></typeparam>
public class DefaultEntityV3Java<TKey> : DefaultEntityV2<TKey>
{
    /// <summary>
    /// 删除标识
    /// </summary>
    public virtual bool? DelFlag { get; set; }
}