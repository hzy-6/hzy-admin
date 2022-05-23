using FreeSql;
using FreeSql.DatabaseModel;
using HZY.EFCore.Repositories.DevelopmentTool.LowCode;
using HZY.Infrastructure;
using HZY.Models.DTO.DevelopmentTool;
using HZY.Models.Entities.LowCode;
using HzyScanDiService.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.EFCore.Repositories.DevelopmentTool
{
    /// <summary>
    /// 用于获取表信息仓储
    /// </summary>
    public class DatabaseTablesRepository : IDiScopedSelf
    {
        private readonly LowCodeTableRepository _low_Code_TableRepository;
        private readonly LowCodeTableInfoRepository _low_Code_Table_InfoRepository;
        private readonly IFreeSql _freeSql;

        public DatabaseTablesRepository(LowCodeTableRepository low_Code_TableRepository, LowCodeTableInfoRepository low_Code_Table_InfoRepository, IFreeSql freeSql)
        {
            _low_Code_TableRepository = low_Code_TableRepository;
            _low_Code_Table_InfoRepository = low_Code_Table_InfoRepository;
            _freeSql = freeSql;
        }

        /// <summary>
        /// 获取所有的表 包含表下面的列
        /// </summary>
        /// <returns></returns>
        public List<GenDbTableDto> GetAllTables()
        {
            var tables = _low_Code_TableRepository.ToListAll();
            var tableColumns = _low_Code_Table_InfoRepository.ToListAll();

            var result = new List<GenDbTableDto>();
            foreach (var item in tables)
            {
                var table = item.MapTo<LowCodeTable, GenDbTableDto>();
                table.TableInfos = tableColumns.Where(w => w.Low_Code_TableId == item.Id).ToList();
                result.Add(table);
            }

            return result;
        }

        // /// <summary>
        // /// 获取数据库名称
        // /// </summary>
        // /// <returns></returns>
        // public string GetDataBaseName()
        // {
        //     return this._freeSql.DbFirst.GetDatabases().FirstOrDefault();
        // }

        /// <summary>
        /// 获取连接字符串
        /// </summary>
        /// <returns></returns>
        public string GetConnectionString()
        {
            return this._freeSql.Ado.ConnectionString;
        }

        // /// <summary>
        // /// 获取数据库类型
        // /// </summary>
        // /// <returns></returns>
        // public DataType GetDataType()
        // {
        //     return this._freeSql.Ado.DataType;
        // }

    }
}
