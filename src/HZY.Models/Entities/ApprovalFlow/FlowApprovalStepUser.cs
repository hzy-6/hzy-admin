using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.Models.Entities.BaseEntitys;

namespace HZY.Models.Entities.ApprovalFlow
{
    /// <summary>
    /// 流程步骤可审批人记录表
    /// </summary>
    public class FlowApprovalStepUser : DefaultBaseEntity<Guid>
    {
        /// <summary>
        /// 审批步骤id
        /// </summary>
        /// <value></value>
        public Guid FlowApprovalStepId { get; set; }

        /// <summary>
        /// 流程节点Id
        /// </summary>
        /// <value></value>
        public Guid FlowNodeId { get; set; }

        /// <summary>
        /// 审批节点名称
        /// </summary>
        /// <value></value>
        public string FlowNodeName { get; set; }

        /// <summary>
        /// 审批人Id
        /// </summary>
        /// <value></value>
        public Guid UserId { get; set; }

        /// <summary>
        /// 审批人名称
        /// </summary>
        /// <value></value>
        public string UserName { get; set; }
    }
}