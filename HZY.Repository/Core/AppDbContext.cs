using HZY.Repository.Domain;
using HZY.Repository.Core.Provider;
using Microsoft.EntityFrameworkCore;

namespace HZY.Repository.Core
{
    public class AppDbContext : BaseDbContext<AppDbContext>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
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