using HZY.Repository.AppCore.Impl;
using HZY.Repository.AppCore.Interface;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using System.Threading;
using System.Threading.Tasks;

namespace HZY.Repository.AppCore.DbContexts
{
    /// <summary>
    /// 基础上下文
    /// </summary>
    /// <typeparam name="TDbContext"></typeparam>
    public class BaseDbContext<TDbContext> : DbContext where TDbContext : DbContext
    {
        private readonly IUnitOfWork _unitOfWork;

        public BaseDbContext(DbContextOptions<TDbContext> options) : base(options)
        {
            _unitOfWork = new UnitOfWorkImpl();
        }

        /// <summary>
        /// 事务
        /// </summary>
        /// <returns></returns>
        public virtual IDbContextTransaction BeginTransaction() => this.Database.BeginTransaction();

        /// <summary>
        /// 事务
        /// </summary>
        /// <returns></returns>
        public virtual Task<IDbContextTransaction> BeginTransactionAsync() => this.Database.BeginTransactionAsync();

        #region IUnitOfWork

        /// <summary>
        /// 工作单元
        /// </summary>
        /// <returns></returns>
        public virtual IUnitOfWork UnitOfWork => this._unitOfWork;

        /// <summary>
        /// 开启 提交
        /// </summary>
        public virtual void CommitOpen() => this._unitOfWork.CommitOpen();

        /// <summary>
        /// 提交
        /// </summary>
        /// <returns></returns>
        public virtual int Commit()
        {
            this._unitOfWork.SetSaveState(true);
            return this.SaveChanges();
        }

        /// <summary>
        /// 提交
        /// </summary>
        /// <returns></returns>
        public virtual Task<int> CommitAsync()
        {
            this._unitOfWork.SetSaveState(true);
            return this.SaveChangesAsync();
        }

        #endregion

        #region 重写 保存

        public override int SaveChanges()
        {
            return this._unitOfWork.GetSaveState() ? base.SaveChanges() : 1;
        }

        public override int SaveChanges(bool acceptAllChangesOnSuccess)
        {
            return this._unitOfWork.GetSaveState() ? base.SaveChanges(acceptAllChangesOnSuccess) : 1;
        }

        public override Task<int> SaveChangesAsync(bool acceptAllChangesOnSuccess,
            CancellationToken cancellationToken = new CancellationToken())
        {
            return this._unitOfWork.GetSaveState()
                ? base.SaveChangesAsync(acceptAllChangesOnSuccess, cancellationToken)
                : Task.FromResult(1);
        }

        public override Task<int> SaveChangesAsync(CancellationToken cancellationToken = new CancellationToken())
        {
            return this._unitOfWork.GetSaveState() ? base.SaveChangesAsync(cancellationToken) : Task.FromResult(1);
        }

        #endregion

    }
}
