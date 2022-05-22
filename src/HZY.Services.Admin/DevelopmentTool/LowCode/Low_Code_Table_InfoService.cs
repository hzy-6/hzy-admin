using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.EFCore.Models;
using HZY.Infrastructure;
using HZY.Models.Entities;
using HZY.Services.Admin.Framework;
using HZY.Services.Admin.BaseServicesAdmin;
using Microsoft.AspNetCore.Http;
using HZY.Models.Entities.LowCode;
using HzyEFCoreRepositories.Extensions;
using HZY.EFCore.Repositories.DevelopmentTool.LowCode;
using HZY.EFCore.Repositories.DevelopmentTool;

namespace HZY.Services.Admin
{
    /// <summary>
    /// 服务 Low_Code_Table_InfoService
    /// </summary>
    public class Low_Code_Table_InfoService : AdminBaseService<Low_Code_Table_InfoRepository>
    {
        private readonly Low_Code_TableRepository _low_Code_TableRepository;
        private readonly DatabaseTablesRepository _databaseTablesRepository;
        private readonly IFreeSql _freeSql;

        public Low_Code_Table_InfoService(Low_Code_Table_InfoRepository defaultRepository,
            Low_Code_TableRepository low_Code_TableRepository,
            DatabaseTablesRepository databaseTablesRepository,
            IFreeSql freeSql)
            : base(defaultRepository)
        {
            _low_Code_TableRepository = low_Code_TableRepository;
            _databaseTablesRepository = databaseTablesRepository;
            _freeSql = freeSql;
        }

        /// <summary>
        /// 获取列表数据
        /// </summary>
        /// <param name="page"></param>
        /// <param name="size"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        public async Task<PagingViewModel> FindListAsync(int page, int size, Low_Code_Table_Info search)
        {
            var query = this._defaultRepository.Select
                    .WhereIf(search.Low_Code_TableId != Guid.Empty, w => w.Low_Code_TableId == search.Low_Code_TableId)
                    .WhereIf(!string.IsNullOrWhiteSpace(search.ColumnName), w => w.ColumnName.Contains(search.ColumnName))
                    .WhereIf(!string.IsNullOrWhiteSpace(search.Describe), w => w.Describe.Contains(search.Describe))
                    .OrderBy(w => w.Position)
                    .ThenByDescending(w => w.CreationTime)
                    .Select(w => new
                    {
                        w.Id,
                        w.IsPrimary,
                        w.IsIdentity,
                        w.IsNullable,
                        w.Position,
                        w.ColumnName,
                        w.Describe,
                        w.DatabaseColumnType,
                        w.CsType,
                        w.CsField,
                        w.Low_Code_TableId,
                        LastModificationTime = w.LastModificationTime.ToString("yyyy-MM-dd"),
                        CreationTime = w.CreationTime.ToString("yyyy-MM-dd"),
                    })
                ;

            return await this._defaultRepository.AsPagingViewModelAsync(query, page, size);
        }

        /// <summary>
        /// 根据id数组删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public Task DeleteListAsync(List<Guid> ids)
        {
            return this._defaultRepository.DeleteByIdsAsync(ids);
        }

        /// <summary>
        /// 根据表名同步列数据
        /// </summary>
        /// <param name="tableId"></param>
        /// <returns></returns>
        public async Task SynchronizationColumnByTableIdAsync(Guid tableId)
        {
            var allTables = _freeSql.DbFirst.GetTablesByDatabase();
            var table = await this._low_Code_TableRepository.FindAsync(w => w.Id == tableId);
            var tableInfo = allTables.Find(w => w.Name == table.TableName);
            //查询出当前表所有的字段
            // var tableColumns = await this._defaultRepository.ToListAsync(w => w.Low_Code_TableId == table.Id);
            await this._defaultRepository.DeleteAsync(w => w.Low_Code_TableId == table.Id);
            //操作集合
            var list = new List<Low_Code_Table_Info>();
            foreach (var item in tableInfo.Columns)
            {
                // if (tableColumns.Any(w => w.ColumnName == item.Name)) continue;

                var model = new Low_Code_Table_Info();
                model.IsPrimary = item.IsPrimary;
                model.IsIdentity = item.IsIdentity;
                model.IsNullable = item.IsNullable;
                model.Position = item.Position;
                model.Low_Code_TableId = table.Id;
                model.ColumnName = item.Name;
                model.Describe = item.Comment;
                model.DatabaseColumnType = item.DbTypeTextFull;
                model.CsType = item.CsType.Name;
                model.CsField = item.Name;
                model.MaxLength = item.MaxLength;
                list.Add(model);
            }

            await this._defaultRepository.InsertRangeAsync(list);
        }

        /// <summary>
        /// 变更数据
        /// </summary>
        /// <param name="low_Code_Table_Infos"></param>
        /// <returns></returns>
        public Task ChangeAsync(List<Low_Code_Table_Info> low_Code_Table_Infos)
        {
            return this._defaultRepository.UpdateRangeAsync(low_Code_Table_Infos);
        }



    }
}