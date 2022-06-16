using FreeSql;
using FreeSql.DatabaseModel;
using HZY.EFCore.Repositories.Admin.DevelopmentTool.LowCode;
using HZY.Infrastructure;
using HZY.Models.DTO.DevelopmentTool;
using HZY.Models.Entities.LowCode;
using HzyScanDiService;
using Microsoft.Extensions.Caching.Memory;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.EFCore.Repositories.Admin.DevelopmentTool
{
    /// <summary>
    /// 用于获取表信息仓储
    /// </summary>
    public class DatabaseTablesRepository : ITransientSelfDependency
    {
        private readonly LowCodeTableRepository _lowCodeTableRepository;
        private readonly LowCodeTableInfoRepository _lowCodeTableInfoRepository;
        private readonly IFreeSql _freeSql;
        private readonly IMemoryCache _memoryCache;

        private readonly string TableInfoKey = "TableInfo:GenDbTableDto";
        private readonly int CacheTime = 12;

        public DatabaseTablesRepository(LowCodeTableRepository lowCodeTableRepository,
        LowCodeTableInfoRepository lowCodeTableInfoRepository,
        IFreeSql freeSql,
        IMemoryCache memoryCache)
        {
            _lowCodeTableRepository = lowCodeTableRepository;
            _lowCodeTableInfoRepository = lowCodeTableInfoRepository;
            _freeSql = freeSql;
            _memoryCache = memoryCache;
        }

        /// <summary>
        /// 获取所有的表 包含表下面的列
        /// </summary>
        /// <returns></returns>
        public List<GenDbTableDto> GetAllTables()
        {
            var tables = _lowCodeTableRepository.ToListAll();
            var tableColumns = _lowCodeTableInfoRepository.ToListAll();

            var result = new List<GenDbTableDto>();
            foreach (var item in tables)
            {
                var table = item.MapTo<LowCodeTable, GenDbTableDto>();
                table.TableInfos = tableColumns.Where(w => w.Low_Code_TableId == item.Id).ToList();
                result.Add(table);
            }

            _memoryCache.Set(TableInfoKey, result, DateTime.Now.AddHours(CacheTime));

            return result;
        }

        /// <summary>
        /// 获取表信息根据缓存
        /// </summary>
        /// <returns></returns>
        public List<GenDbTableDto> GetAllTablesByCache()
        {
            return _memoryCache.Get<List<GenDbTableDto>>(TableInfoKey) ?? GetAllTables();
        }

        /// <summary>
        /// 清空所有表缓存信息
        /// </summary>
        /// <returns></returns>
        public bool ClearAllTablesByCache()
        {
            _memoryCache.Remove(TableInfoKey);

            return true;
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
            return _freeSql.Ado.ConnectionString;
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
