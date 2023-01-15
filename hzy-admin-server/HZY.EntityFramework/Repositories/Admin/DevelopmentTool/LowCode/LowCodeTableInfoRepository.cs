using HZY.EntityFramework.DbContexts;
using HZY.EntityFramework.Repositories.Admin.Core.Impl;
using HZY.Models.Entities.LowCode;
using HZY.Framework.AutoRegisterIOC;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace HZY.EntityFramework.Repositories.Admin.DevelopmentTool.LowCode
{
    public class LowCodeTableInfoRepository : AdminRepositoryImpl<LowCodeTableInfo>, ITransientSelfDependency
    {
        public LowCodeTableInfoRepository(AdminDbContext context, Expression<Func<LowCodeTableInfo, bool>> filter = null)
            : base(context, filter)
        {

        }



    }
}
