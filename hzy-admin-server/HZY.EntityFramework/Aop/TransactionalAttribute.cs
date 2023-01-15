using HZY.Framework.EntityFrameworkRepositories;
using HZY.Framework.AutoRegisterIOC;
using Microsoft.EntityFrameworkCore;
using HZY.Framework.AutoRegisterIOC.Attributes;

namespace HZY.EntityFramework.Aop
{
    /// <summary>
    /// 事务拦截
    /// </summary>
    [AttributeUsage(AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
    public class TransactionalAttribute : AopBaseAttribute
    {
        /// <summary>
        /// 指定 数据上下文
        /// </summary>
        private readonly Type[] _dbContextTypes;

        public TransactionalAttribute()
        {
            _dbContextTypes = EntityFrameworkRepositoriesUtil.GetAllDbContextType().ToArray();
            ExceptionEvent = OnException;
        }

        /// <summary>
        /// 事务拦截
        /// </summary>
        /// <param name="dbContextTypes">数据上下文</param>
        public TransactionalAttribute(params Type[] dbContextTypes)
        {
            _dbContextTypes = dbContextTypes;
            ExceptionEvent = OnException;
        }

        /// <summary>
        /// 之前
        /// </summary>
        /// <param name="aopContext"></param>
        public override void Before(AopContext aopContext)
        {
            if (_dbContextTypes == null || _dbContextTypes.Length == 0)
            {
                throw new Exception("请在程序启动前注册 程序中所有的 dbcontext 类型。例如： serviceProvider.UseHzyEFCore(typeof(AdminDbContext));");
            }

            foreach (var dbContextType in _dbContextTypes)
            {
                var dbcontext = (DbContext)aopContext.ServiceProvider.GetService(dbContextType);
                dbcontext.Database.OpenConnection();
                dbcontext.Database.BeginTransaction();
            }
        }

        /// <summary>
        /// 之后
        /// </summary>
        /// <param name="aopContext"></param>
        public override void After(AopContext aopContext)
        {
            if (_dbContextTypes == null || _dbContextTypes.Length == 0)
            {
                throw new Exception("请在程序启动前注册 程序中所有的 dbcontext 类型。例如： serviceProvider.UseHzyEFCore(typeof(AdminDbContext));");
            }

            foreach (var dbContextType in _dbContextTypes)
            {
                var dbcontext = (DbContext)aopContext.ServiceProvider.GetService(dbContextType);
                dbcontext.Database.CommitTransaction();
            }
        }

        /// <summary>
        /// 之前
        /// </summary>
        /// <param name="aopContext"></param>
        public override void Before<TResult>(AopContext aopContext)
        {
            Before(aopContext);
        }

        /// <summary>
        /// 之后
        /// </summary>
        /// <typeparam name="TResult"></typeparam>
        /// <param name="aopContext"></param>
        /// <param name="result"></param>
        public override void After<TResult>(AopContext aopContext, TResult result)
        {
            After(aopContext);
        }

        /// <summary>
        /// 异常
        /// </summary>
        /// <param name="aopContext"></param>
        /// <param name="exception"></param>
        private void OnException(AopContext aopContext, Exception exception)
        {
            if (_dbContextTypes == null || _dbContextTypes.Length == 0)
            {
                throw new Exception("请在程序启动前注册 程序中所有的 dbcontext 类型。例如： serviceProvider.UseHzyEFCore(typeof(AdminDbContext));");
            }

            //函数异常触发事件
            foreach (var dbContextType in _dbContextTypes)
            {
                var dbcontext = (DbContext)aopContext.ServiceProvider.GetService(dbContextType);
                if (dbcontext.Database.CurrentTransaction != null)
                {
                    dbcontext.Database.RollbackTransaction();
                }
            }

            throw exception;
        }


    }

}