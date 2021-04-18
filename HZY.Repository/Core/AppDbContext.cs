using HZY.Repository.Domain;
using HZY.Repository.Core.Provider;
using Microsoft.EntityFrameworkCore;
using HZY.Repository.Core.Interface;

namespace HZY.Repository.Core
{
    public class AppDbContext : BaseDbContext<AppDbContext>
    {
        private readonly ICacheEntity _cacheEntity;

        public AppDbContext(DbContextOptions<AppDbContext> options, ICacheEntity cacheEntity) : base(options, cacheEntity)
        {
            _cacheEntity = cacheEntity;
        }

        #region DbSet

        public DbSet<Member> Member { get; set; }

        #endregion

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //这句话不要删除
            base.OnModelCreating(modelBuilder);
        }

    }
}