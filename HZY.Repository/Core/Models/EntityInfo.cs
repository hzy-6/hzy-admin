using System;

namespace HZY.Repository.Core.Models
{
    public class EntityInfo
    {
        public bool IsKey { get; set; }

        public string Name { get; set; }

        public string Remark { get; set; }

        public Type Type { get; set; }
    }
}