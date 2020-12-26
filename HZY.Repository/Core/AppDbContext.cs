using HZY.Repository.Entity;
using HZY.Repository.Core.Interface;
using HZY.Repository.Core.Provider;
using Microsoft.EntityFrameworkCore;

namespace HZY.Repository.Core
{
    public class AppDbContext : BaseDbContext<AppDbContext>
    {
        public AppDbContext(DbContextOptions<AppDbContext> options, IUnitOfWork unitOfWork) : base(options, unitOfWork)
        {
        }

        #region DbSet

        public DbSet<Member> Member { get; set; }

        #endregion
        
    }
}