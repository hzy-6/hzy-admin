using HZY.Models.Entities.BaseEntitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Models.Entities.LowCode
{
    /// <summary>
    /// 低代码 列表配置
    /// </summary>
    public class LowCodeList : DefaultBaseEntity<Guid>
    {
        /// <summary>
        /// 表id
        /// </summary>
        public Guid Low_Code_TableId { get; set; }

        /// <summary>
        /// 表字段信息id
        /// </summary>
        public Guid Low_Code_Table_InfoId { get; set; }

        /// <summary>
        /// 外键表 Low_Code_TableId
        /// </summary>
        public Guid ForeignKeyTableId { get; set; }

        /// <summary>
        /// 外键表 字段 名称
        /// </summary>
        public string ForeignKeyTableFieldName { get; set; }

    }
}
