using System;
using System.Data;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc.Filters;

namespace HZY.Repository.Attributes
{
    /// <summary>
    /// 通过标记 自动 事务 适用于 控制器 Action 上标记
    /// 自动档 事务
    /// </summary>
    [AttributeUsage(AttributeTargets.Method)]
    public class TransactionalAttribute : Attribute, IActionFilter
    {
        //public Propagation Propagation { get; set; } = Propagation.Required;
        public IsolationLevel? IsolationLevel { get; set; }
        //IUnitOfWork _uow;

        public void OnActionExecuting(ActionExecutingContext context) =>
            OnBefore();

        public void OnActionExecuted(ActionExecutedContext context) =>
            OnAfter(context.Exception);

        Task OnBefore()
        {
            //_uow = uowm.Begin(this.Propagation, this.IsolationLevel);
            //return Task.FromResult(false);
            return Task.CompletedTask;
        }

        Task OnAfter(Exception ex)
        {
            //try
            //{
            //    if (ex == null) _uow.Commit();
            //    else _uow.Rollback();
            //}
            //finally
            //{
            //    _uow.Dispose();
            //}

            return Task.FromResult(false);
        }
    }
}