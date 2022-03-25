using FreeSql;
using FreeSql.DatabaseModel;
using HzyScanDiService.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Repositories.DevelopmentTool
{
    /// <summary>
    /// 代码生成仓储
    /// </summary>
    public class CodeGenerationRepository : IDiScopedSelf
    {
        private readonly IFreeSql _freeSql;

        public CodeGenerationRepository(IFreeSql freeSql)
        {
            _freeSql = freeSql;
        }

        /// <summary>
        /// 获取所有的表 包含表下面的列
        /// </summary>
        /// <returns></returns>
        public List<DbTableInfo> GetAllTables()
        {
            return this._freeSql.DbFirst.GetTablesByDatabase();
        }

        /// <summary>
        /// 获取数据库名称
        /// </summary>
        /// <returns></returns>
        public string GetDataBaseName()
        {
            return this._freeSql.DbFirst.GetDatabases().FirstOrDefault();
        }

        /// <summary>
        /// 获取连接字符串
        /// </summary>
        /// <returns></returns>
        public string GetConnectionString()
        {
            return this._freeSql.Ado.ConnectionString;
        }

        /// <summary>
        /// 获取数据库类型
        /// </summary>
        /// <returns></returns>
        public DataType GetDataType()
        {
            return this._freeSql.Ado.DataType;
        }

    }
}
