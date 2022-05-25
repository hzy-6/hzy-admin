using FreeSql.DatabaseModel;
using HZY.Models.Entities.BaseEntitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Models.Entities.LowCode
{
    /// <summary>
    /// 低代码表
    /// </summary>
    public class LowCodeTable : DefaultBaseEntity<Guid>
    {

        /// <summary>
        /// 表名称
        /// </summary>
        public string TableName { get; set; }

        /// <summary>
        /// 表空间
        /// </summary>
        /// <value></value>
        public string Schema { get; set; }

        /// <summary>
        /// 表类型
        /// </summary>
        /// <value></value>
        public string Type { get; set; }

        /// <summary>
        /// 显示名称 描述
        /// </summary>
        public string DisplayName { get; set; }

        /// <summary>
        /// 实体名称
        /// </summary>
        public string EntityName { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }

    }
}
