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
    public class LowCodeTableInfoRepository : AdminRepositoryImpl<LowCodeTableInfo>, ITransientSelfDependency
    {
        public LowCodeTableInfoRepository(AdminDbContext context, Expression<Func<LowCodeTableInfo, bool>> filter = null)
            : base(context, filter)
        {

        }



    }
}
