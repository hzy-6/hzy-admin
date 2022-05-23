using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.EFCore.Models;
using HZY.Services.Admin.Core;
using HZY.Models.Entities.LowCode;
using HzyEFCoreRepositories.Extensions;
using HZY.EFCore.Repositories.DevelopmentTool.LowCode;
using HZY.EFCore.Repositories.DevelopmentTool;

namespace HZY.Services.Admin
{
    /// <summary>
    /// 服务 Low_Code_TableService
    /// </summary>
    public class LowCodeTableService : AdminBaseService<LowCodeTableRepository>
    {
        private readonly DatabaseTablesRepository _databaseTablesRepository;
        private readonly IFreeSql _freeSql;

        public LowCodeTableService(LowCodeTableRepository defaultRepository, DatabaseTablesRepository databaseTablesRepository, IFreeSql freeSql)
            : base(defaultRepository)
        {
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
        public async Task<PagingViewModel> FindListAsync(int page, int size, LowCodeTable search)
        {
            var query = this._defaultRepository.Select
                    .WhereIf(!string.IsNullOrWhiteSpace(search.TableName), w => w.TableName.Contains(search.TableName))
                    .WhereIf(!string.IsNullOrWhiteSpace(search.EntityName), w => w.TableName.Contains(search.EntityName))
                    .WhereIf(!string.IsNullOrWhiteSpace(search.DisplayName), w => w.TableName.Contains(search.DisplayName))
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
        /// 同步表
        /// </summary>
        public async Task SynchronizationAsync()
        {
            var allTables = _freeSql.DbFirst.GetTablesByDatabase();
            var oldAllTables = await this._defaultRepository.ToListAllAsync();

            #region 同步表

            var insertList = new List<LowCodeTable>();
            var updateList = new List<LowCodeTable>();
            foreach (var item in allTables)
            {
                var table = oldAllTables.Find(w => w.TableName == item.Name);

                if (table == null)
                {
                    insertList.Add(new LowCodeTable
                    {
                        Id = Guid.NewGuid(),
                        DisplayName = item.Comment,
                        TableName = item.Name,
                        EntityName = item.Name,
                        Schema = item.Schema,
                        Type = item.Type
                    });
                }
                else
                {
                    table.Schema = item.Schema;
                    table.Type = item.Type;
                    updateList.Add(table);
                }
            }

            if (insertList.Count > 0)
            {
                await this._defaultRepository.InsertRangeAsync(insertList);
            }
            if (updateList.Count > 0)
            {
                await this._defaultRepository.UpdateRangeAsync(updateList);
            }

            #endregion

        }

        /// <summary>
        /// 变更数据
        /// </summary>
        /// <param name="lowCodeTables"></param>
        /// <returns></returns>
        public Task ChangeAsync(List<LowCodeTable> lowCodeTables)
        {
            return this._defaultRepository.UpdateRangeAsync(lowCodeTables);
        }



    }
}