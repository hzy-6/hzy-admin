using HZY.EFCore.DbContexts;
using HZY.EFCore.Repositories.Base.Impl;
using HZY.Models.Entities.LowCode;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace HZY.EFCore.Repositories.DevelopmentTool.LowCode
{
    public class Low_Code_TableRepository : Repository<Low_Code_Table>
    {
        public Low_Code_TableRepository(AdminBaseDbContext context, Expression<Func<Low_Code_Table, bool>> filter = null) : base(context, filter)
        {

        }
    }
}
