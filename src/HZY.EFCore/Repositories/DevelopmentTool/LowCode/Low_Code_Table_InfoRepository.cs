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
    public class Low_Code_Table_InfoRepository : Repository<Low_Code_Table_Info>
    {
        public Low_Code_Table_InfoRepository(AdminBaseDbContext context, Expression<Func<Low_Code_Table_Info, bool>> filter = null) : base(context, filter)
        {

        }



    }
}
