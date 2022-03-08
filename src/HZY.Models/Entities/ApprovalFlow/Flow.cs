using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.Models.Entities.BaseEntitys;

namespace HZY.Models.Entities.ApprovalFlow
{
    /// <summary>
    /// 工作流主表
    /// </summary>
    public class Flow : DefaultBaseEntity<Guid>
    {
        /// <summary>
        /// 编号 => 备注:Flow_Num 
        /// </summary>
        public int? Number { get; set; }

        /// <summary>
        /// 流程编码
        /// </summary>
        /// <value></value>
        public string Code { get; set; }

        /// <summary>
        /// 流程名称 => 备注:Flow_Name 
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 备注 => 备注:Flow_Remark 
        /// </summary>
        public string Remark { get; set; }
    }
}