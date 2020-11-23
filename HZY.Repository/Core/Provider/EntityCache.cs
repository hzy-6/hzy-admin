using System;
using System.Collections.Generic;
using HZY.Repository.Core.Models;
using HZY.Toolkit;

namespace HZY.Repository.Core.Provider
{
    /// <summary>
    /// 实体 信息缓存
    /// </summary>
    public static class EntityCache
    {
        private static Dictionary<string, List<EntityInfo>> Container { get; set; }

        static EntityCache()
        {
            Container ??= new Dictionary<string, List<EntityInfo>>();
        }

        public static Dictionary<string, List<EntityInfo>> All() => Container;

        public static List<EntityInfo> GetModelInfos(string tableName)
        {
            return Container.ContainsKey(tableName) ? Container[tableName] : default;
        }


        public static void Set(Type t)
        {
            var list = new List<EntityInfo>();

            var propertyInfos = t.GetProperties();

            foreach (var item in propertyInfos)
            {
                var modelInfo = new EntityInfo();
                var remark = ReadXmlSummary.XmlForMember(item)?.InnerText?.Trim()?.Split("=>")?[0];
                modelInfo.Name = item.Name;
                modelInfo.Remark = remark;
                modelInfo.IsKey = HzyRepositoryExtensions.HasKey(item);
                modelInfo.Type = item.PropertyType;
                list.Add(modelInfo);
            }

            Container[t.Name] = list;
        }

        public static void Set(List<Type> types)
        {
            foreach (var item in types) Set(item);
        }
    }
}