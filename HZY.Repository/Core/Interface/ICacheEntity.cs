using HZY.Repository.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Repository.Core.Interface
{
    /// <summary>
    /// 缓存实体信息服务
    /// </summary>
    public interface ICacheEntity
    {
        Dictionary<string, List<EntityInfo>> Gets();

        List<EntityInfo> GetEntityInfos(string tableName);

        void Set(Type tyoe);

        void Set(IEnumerable<Type> types);

    }
}
