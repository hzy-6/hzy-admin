using System;
using Microsoft.AspNetCore.Mvc.Filters;

namespace HZY.Repository.Attributes
{
    /// <summary>
    /// 自动档 事务 通过标记 自动 事务 适用于 控制器 Action 上标记
    /// </summary>
    [AttributeUsage(AttributeTargets.Method)]
    public class TransactionalAttribute : Attribute, IActionFilter
    {
        public void OnActionExecuting(ActionExecutingContext context)
        {
            // throw new NotImplementedException();
        }

        public void OnActionExecuted(ActionExecutedContext context)
        {
            // throw new NotImplementedException();
        }
    }
}