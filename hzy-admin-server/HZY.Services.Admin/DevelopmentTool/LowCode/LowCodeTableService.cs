using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.EFCore.PagingViews;
using HZY.Services.Admin.Core;
using HZY.Models.Entities.LowCode;
using HzyEFCoreRepositories.Extensions;
using HZY.EFCore.Repositories.Admin.DevelopmentTool;
using HZY.EFCore.Repositories.Admin.DevelopmentTool.LowCode;

namespace HZY.Services.Admin
{
    /// <summary>
    /// 服务 Low_Code_TableService
    /// </summary>
    public class LowCodeTableService : AdminBaseService<LowCodeTableRepository>
    {
        private readonly IFreeSql _freeSql;
        private readonly LowCodeTableInfoService _lowCodeTableInfoService;
        private readonly DatabaseTablesRepository _databaseTablesRepository;

        public LowCodeTableService(LowCodeTableRepository defaultRepository,
        IFreeSql freeSql,
        LowCodeTableInfoService lowCodeTableInfoService,
        DatabaseTablesRepository databaseTablesRepository)
            : base(defaultRepository)
        {
            _freeSql = freeSql;
            _lowCodeTableInfoService = lowCodeTableInfoService;
            _databaseTablesRepository = databaseTablesRepository;
        }

        /// <summary>
        /// 获取列表数据
        /// </summary>
        /// <param name="page"></param>
        /// <param name="size"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        public async Task<PagingView> FindListAsync(int page, int size, LowCodeTable search)
        {
            var query = this._defaultRepository.Select
                    .WhereIf(!string.IsNullOrWhiteSpace(search.TableName), w => w.TableName.Contains(search.TableName))
                    .WhereIf(!string.IsNullOrWhiteSpace(search.EntityName), w => w.EntityName.Contains(search.EntityName))
                    .WhereIf(!string.IsNullOrWhiteSpace(search.DisplayName), w => w.DisplayName.Contains(search.DisplayName))
                    .OrderByDescending(w => w.TableName)
                    .ThenByDescending(w => w.CreationTime)
                    .Select(w => new
                    {
                        w.Id,
                        w.TableName,
                        w.DisplayName,
                        w.EntityName,
                        w.Remark,
                        LastModificationTime = w.LastModificationTime.ToString("yyyy-MM-dd"),
                        CreationTime = w.CreationTime.ToString("yyyy-MM-dd"),
                    })
                ;

            //获取一下数据用于缓存
            _databaseTablesRepository.GetAllTables();

            return await this._defaultRepository.AsPagingViewAsync(query, page, size);
        }

        /// <summary>
        /// 根据id数组删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public Task DeleteListAsync(List<Guid> ids)
        {
            _databaseTablesRepository.ClearAllTablesByCache();
            return this._defaultRepository.DeleteByIdsAsync(ids);
        }

        /// <summary>
        /// 同步表
        /// </summary>
        public async Task SynchronizationAsync()
        {
            var allTables = _freeSql.DbFirst.GetTablesByDatabase();
            var oldAllTables = await this._defaultRepository.ToListAllAsync();

            #region 同步表

            var insertList = new List<LowCodeTable>();
            var updateList = new List<LowCodeTable>();
            var ids = new List<Guid>();
            foreach (var item in allTables)
            {
                var table = oldAllTables.Find(w => w.TableName == item.Name);
                var id = Guid.NewGuid();
                if (table == null)
                {
                    insertList.Add(new LowCodeTable
                    {
                        Id = id,
                        DisplayName = item.Comment,
                        TableName = item.Name,
                        EntityName = item.Name,
                        Schema = item.Schema,
                        Type = item.Type.ToString()
                    });
                }
                else
                {
                    id = table.Id;

                    table.Schema = item.Schema;
                    table.Type = item.Type.ToString();
                    updateList.Add(table);
                }

                ids.Add(id);
            }

            if (insertList.Count > 0)
            {
                await this._defaultRepository.InsertRangeAsync(insertList);
            }
            if (updateList.Count > 0)
            {
                await this._defaultRepository.UpdateRangeAsync(updateList);
            }

            foreach (var item in ids)
            {
                await _lowCodeTableInfoService.SynchronizationColumnByTableIdAsync(item, true);
            }

            _databaseTablesRepository.ClearAllTablesByCache();
            #endregion

        }

        /// <summary>
        /// 变更数据
        /// </summary>
        /// <param name="lowCodeTables"></param>
        /// <returns></returns>
        public Task ChangeAsync(List<LowCodeTable> lowCodeTables)
        {
            _databaseTablesRepository.ClearAllTablesByCache();
            return this._defaultRepository.UpdateRangeAsync(lowCodeTables);
        }



    }
}