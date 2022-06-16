using HZY.EFCore.DbContexts;
using HZY.EFCore.Repositories.Admin.Core.Impl;
using HZY.Models.Entities.LowCode;
using HzyScanDiService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace HZY.EFCore.Repositories.Admin.DevelopmentTool.LowCode
{
    public class LowCodeTableRepository : AdminRepositoryImpl<LowCodeTable>, ITransientSelfDependency
    {
        public LowCodeTableRepository(AdminDbContext context, Expression<Func<LowCodeTable, bool>> filter = null)
            : base(context, filter)
        {

        }
    }
}
