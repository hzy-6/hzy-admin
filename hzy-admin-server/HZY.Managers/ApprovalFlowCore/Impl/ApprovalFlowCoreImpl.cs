using HZY.Models.Entities.ApprovalFlow;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Managers.ApprovalFlowCore.Impl
{
    /// <summary>
    /// 审批流程核心实现
    /// </summary>
    public abstract class ApprovalFlowCoreImpl : IApprovalFlowCore
    {

        public virtual Task<FlowApprovalStepHistory> CurrentNodeAsync()
        {
            throw new NotImplementedException();
        }

        public virtual Task<FlowApprovalStepHistory> NextNodeAsync()
        {
            throw new NotImplementedException();
        }

        public virtual Task<FlowApprovalStepHistory> PrevNodeAsync()
        {
            throw new NotImplementedException();
        }
    }
}
