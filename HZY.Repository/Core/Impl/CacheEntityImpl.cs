using HZY.Common;
using HZY.Repository.Core.Interface;
using HZY.Repository.Core.Models;
using HZY.Repository.Core.Provider;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Repository.Core.Impl
{
    /// <summary>
    /// 缓存实体信息服务
    /// </summary>
    public class CacheEntityImpl : ICacheEntity
    {
        private readonly Dictionary<string, List<EntityInfo>> _container;

        public CacheEntityImpl()
        {
            _container ??= new Dictionary<string, List<EntityInfo>>();
        }

        public List<EntityInfo> GetEntityInfos(string tableName)
        {
            return _container.ContainsKey(tableName) ? _container[tableName] : default;
        }

        public Dictionary<string, List<EntityInfo>> Gets()
        {
            return _container;
        }

        public void Set(Type type)
        {
            var entityInfos = type.GetProperties().Select(w => new EntityInfo
            {
                Name = w.Name,
                Remark = ReadXmlSummary.XmlForMember(w)?.InnerText?.Trim()?.Split("=>")?[0],
                IsKey = HzyRepositoryExtensions.HasKey(w),
                Type = w.PropertyType
            });

            _container[type.Name] = entityInfos.ToList();
        }

        public void Set(IEnumerable<Type> types)
        {
            types.ToList().ForEach(w => this.Set(w));
        }
    }
}
