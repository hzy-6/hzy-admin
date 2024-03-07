namespace HZY.Core.EntityFramework.Aop;

/// <summary>
/// 事务拦截
/// </summary>
[AttributeUsage(AttributeTargets.Method, AllowMultiple = true, Inherited = true)]
public class TransactionalAttribute : AopMoAttribute
{
    /// <summary>
    /// 指定 数据上下文
    /// </summary>
    private readonly Type[] _dbContextTypes;

    /// <summary>
    /// 是否延迟提交
    /// </summary>
    public bool IsCommitDelay { get; set; } = false;

    public TransactionalAttribute()
    {
        _dbContextTypes = RepositoryEntityFrameworkExtensions.GetDbContextTypeAll().ToArray();

        if (_dbContextTypes == null || _dbContextTypes.Length == 0)
        {
            throw new Exception(
                "请在程序启动前注册 程序中所有的 dbContext 类型。例如：        services.AddEntityFrameworkRepositories(typeof(AdminDbContext));");
        }
    }

    /// <summary>
    /// 事务拦截
    /// </summary>
    /// <param name="dbContextTypes">数据上下文</param>
    public TransactionalAttribute(params Type[] dbContextTypes)
    {
        _dbContextTypes = dbContextTypes;

        if (_dbContextTypes == null || _dbContextTypes.Length == 0)
        {
            throw new Exception(
                "请在程序启动前注册 程序中所有的 dbContext 类型。例如：        services.AddEntityFrameworkRepositories(typeof(AdminDbContext));");
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="context"></param>
    public override void OnEntry(MethodContext context)
    {
        foreach (var dbContextType in _dbContextTypes)
        {
            if (IsCommitDelay)
            {
                // 延迟提交
                var baseDbContext = GetService(context, dbContextType) as IBaseDbContext;
                baseDbContext?.UnitOfWork?.CommitDelayStart();
            }
            else
            {
                var dbContext = GetService(context, dbContextType) as DbContext;
                dbContext?.Database.OpenConnection();
                dbContext?.Database.BeginTransaction();
            }
        }
    }

    public override void OnException(MethodContext context)
    {
        if (!IsCommitDelay)
        {
            //函数异常触发事件
            foreach (var dbContextType in _dbContextTypes)
            {
                var dbContext = GetService(context, dbContextType) as DbContext;
                if (dbContext?.Database.CurrentTransaction != null)
                {
                    dbContext.Database.RollbackTransaction();
                }
            }
        }

        // 获取日志对象
        var logger = GetLogger<TransactionalAttribute>(context);
        logger?.LogError(context.Exception, "事务异常");
    }

    public override void OnSuccess(MethodContext context)
    {
        foreach (var dbContextType in _dbContextTypes)
        {
            if (IsCommitDelay)
            {
                // 延迟提交
                var baseDbContext = GetService(context, dbContextType) as IBaseDbContext;
                baseDbContext?.UnitOfWork?.CommitDelayEnd();
            }
            else
            {
                var dbContext = GetService(context, dbContextType) as DbContext;
                dbContext?.Database.CommitTransaction();
            }
        }
    }

    public override void OnExit(MethodContext context)
    {
        base.OnExit(context);
    }
}