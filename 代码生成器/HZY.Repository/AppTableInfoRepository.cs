using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using FreeSql;
using HZY.Repository.Core;
using HZY.Repository.Entity;
using System.Linq;

namespace HZY.Repository
{
    /// <summary>
    /// 表信息 仓储
    /// </summary>
    public class AppTableInfoRepository : HzyBaseRepository<AppTableInfo>
    {
        public AppTableInfoRepository(IFreeSql freeSql) : base(freeSql)
        {
        }

        /// <summary>
        /// 查询所有表信息
        /// </summary>
        /// <returns></returns>
        public virtual async Task<List<AppTableInfo>> FindAppTableInfosAsync()
        {
            var tableInfos = new List<AppTableInfo>();
            var dbTableInfos = Orm.DbFirst.GetTablesByDatabase();
            dbTableInfos.ForEach(dt =>
            {
                tableInfos.AddRange(
                dt.Columns.Select(co => new AppTableInfo
                {
                    Id = $"{dt.Name}_{co.Name}",
                    TabName = dt.Name,
                    TabNameRemark = dt.Comment,
                    ColOrder = co.Position,
                    ColType = co.DbTypeText,
                    ColDefaultValue = co.DefaultValue,
                    ColIsIdentity = co.IsIdentity ? 1 : 0,
                    ColIsKey = co.IsPrimary ? 1 : 0,
                    ColIsNull = co.IsNullable ? 1 : 0,
                    ColMaxLength = co.MaxLength,
                    ColName = co.Name,
                    ColRemark = co.Coment,
                    CsType=co.CsType.Name
                }));

            });
            return await Task.FromResult(tableInfos);
        }
    }
}