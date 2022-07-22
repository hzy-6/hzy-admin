using HZY.Models.Entities.ApprovalFlow;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Managers.ApprovalFlowCore
{
    /// <summary>
    /// 审批流程核心接口
    /// </summary>
    public interface IApprovalFlowCore
    {
        

        /// <summary>
        /// 当前节点
        /// </summary>
        /// <returns></returns>
        Task<FlowApprovalStepHistory> CurrentNodeAsync();

        /// <summary>
        /// 下一个节点
        /// </summary>
        /// <returns></returns>
        Task<FlowApprovalStepHistory> NextNodeAsync();

        /// <summary>
        /// 上一个节点
        /// </summary>
        /// <returns></returns>
        Task<FlowApprovalStepHistory> PrevNodeAsync();

    }
}
