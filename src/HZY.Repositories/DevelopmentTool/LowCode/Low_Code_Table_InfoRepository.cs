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
    public class Low_Code_Table_InfoRepository : AdminEfCoreBaseRepository<Low_Code_Table_Info>
    {
        public Low_Code_Table_InfoRepository(AdminBaseDbContext context, Expression<Func<Low_Code_Table_Info, bool>> filter = null) : base(context, filter)
        {

        }



    }
}
