using HZY.EFCore.DbContexts;
using HZY.Models.Entities.LowCode;
using HZY.Repositories.BaseRepositories.Impl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Repositories.DevelopmentTool.LowCode
{
    public class Low_Code_TableRepository : AdminEfCoreBaseRepository<Low_Code_Table>
    {
        public Low_Code_TableRepository(AdminBaseDbContext context, Expression<Func<Low_Code_Table, bool>> filter = null) : base(context, filter)
        {

        }
    }
}
