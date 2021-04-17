using HZY.Toolkit.Attributes;

namespace HZY.Admin.Services
{
    /// <summary>
    /// 服务层 基类
    /// </summary>
    /// <typeparam name="TRepository">默认仓储 类型</typeparam>
    [AppService]
    public class FrameworkBaseService<TRepository> where TRepository : class
    {
        /// <summary>
        /// 默认 仓储
        /// </summary>
        protected readonly TRepository Repository;

        public FrameworkBaseService(TRepository repository)
        {
            Repository = repository;
        }

        
    }
}