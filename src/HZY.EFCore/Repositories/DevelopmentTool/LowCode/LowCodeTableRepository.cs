using HZY.EFCore.DbContexts;
using HZY.EFCore.Repositories.Core.Impl;
using HZY.Models.Entities.LowCode;
using HzyScanDiService.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace HZY.EFCore.Repositories.DevelopmentTool.LowCode
{
    public class LowCodeTableRepository : RepositoryImpl<LowCodeTable>, IDiScopedSelf
    {
        public LowCodeTableRepository(AdminBaseDbContext context, Expression<Func<LowCodeTable, bool>> filter = null) : base(context, filter)
        {

        }
    }
}
