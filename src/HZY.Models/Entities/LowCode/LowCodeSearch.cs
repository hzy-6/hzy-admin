using HZY.Models.Entities.BaseEntitys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Models.Entities.LowCode
{
    /// <summary>
    /// 低代码 检索配置
    /// </summary>
    public class LowCodeSearch : DefaultBaseEntity<Guid>
    {

        /// <summary>
        /// 表id
        /// </summary>
        public Guid Low_Code_TableId { get; set; }

        /// <summary>
        /// 表
        /// </summary>
        public Guid Low_Code_Table_InfoId { get; set; }

    }
}
