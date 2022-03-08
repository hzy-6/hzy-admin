using System.Security.Cryptography.X509Certificates;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.Models.Entities.BaseEntitys;

namespace HZY.Models.Entities.ApprovalFlow
{
    /// <summary>
    /// 流程审批步骤记录表
    /// </summary>
    public class FlowApprovalStep : DefaultBaseEntity<Guid>
    {
        /// <summary>
        /// 流程审批顺序
        /// </summary>
        /// <value></value>
        public int Sort { get; set; }

        /// <summary>
        /// 审批流节点id
        /// </summary>
        /// <value></value>
        public Guid FlowNodeId { get; set; }

        /// <summary>
        /// 节点名称
        /// </summary>
        /// <value></value>
        public string FlowNodeName { get; set; }

        /// <summary>
        /// 多次审批顺序号
        /// </summary>
        /// <value></value>
        public int SortMore { get; set; }

        /// <summary>
        /// 流程审批状态
        /// </summary>
        /// <value></value>
        public EFlowApprovalStepState State { get; set; } = EFlowApprovalStepState.待审批;

        /// <summary>
        /// 审批意见
        /// </summary>
        /// <value></value>
        public string Opinions { get; set; }

        /// <summary>
        /// 审批人id
        /// </summary>
        /// <value></value>
        public Guid UserId { get; set; }

        /// <summary>
        /// 审批人姓名
        /// </summary>
        /// <value></value>
        public string UserName { get; set; }

        /// <summary>
        /// 审批时间
        /// </summary>
        /// <value></value>
        public DateTime ApprovalDate { get; set; } = DateTime.Now;

    }

    /// <summary>
    /// 流程审批步骤状态
    /// </summary>
    public enum EFlowApprovalStepState
    {
        待审批 = 1,
        //同意走下一步
        同意,
        //不同意打回重新走审批流程
        不同意,
        //回退到上一步流程
        回退上级审批
    }

}