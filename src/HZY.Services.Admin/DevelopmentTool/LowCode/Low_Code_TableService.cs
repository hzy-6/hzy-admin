using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.EFCore.Models;
using HZY.Infrastructure;
using HZY.Models.Entities;
using HZY.Repositories;
using HZY.Repositories.Framework;
using HZY.Services.Admin.Framework;
using HZY.Services.Admin.BaseServicesAdmin;
using HZY.Services.Upload;
using Microsoft.AspNetCore.Http;
using HZY.Repositories.DevelopmentTool.LowCode;
using HZY.Models.Entities.LowCode;
using HzyEFCoreRepositories.Extensions;
using HZY.Repositories.DevelopmentTool;

namespace HZY.Services.Admin
{
    /// <summary>
    /// 服务 Low_Code_TableService
    /// </summary>
    public class Low_Code_TableService : AdminBaseService<Low_Code_TableRepository>
    {
        private readonly DatabaseTablesRepository _databaseTablesRepository;

        public Low_Code_TableService(Low_Code_TableRepository repository, DatabaseTablesRepository databaseTablesRepository)
            : base(repository)
        {
            _databaseTablesRepository = databaseTablesRepository;
        }

        /// <summary>
        /// 获取列表数据
        /// </summary>
        /// <param name="page"></param>
        /// <param name="size"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        public async Task<PagingViewModel> FindListAsync(int page, int size, Low_Code_Table search)
        {
            var query = this.Repository.Select
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

            return await this.Repository.AsPagingViewModelAsync(query, page, size);
        }

        /// <summary>
        /// 根据id数组删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public Task DeleteListAsync(List<Guid> ids)
        {
            return this.Repository.DeleteByIdsAsync(ids);
        }

        /// <summary>
        /// 同步表
        /// </summary>
        public async Task SynchronizationAsync()
        {
            var allTables = _databaseTablesRepository.GetAllTables();
            var oldAllTables = await this.Repository.ToListAllAsync();

            #region 同步表

            var insertList = new List<Low_Code_Table>();
            foreach (var item in allTables)
            {
                var table = oldAllTables.Find(w => w.TableName == item.Name);

                if (table == null)
                {
                    insertList.Add(new Low_Code_Table
                    {
                        Id = Guid.NewGuid(),
                        DisplayName = item.Comment,
                        TableName = item.Name,
                        EntityName = item.Name,
                    });
                }
            }

            await this.Repository.InsertRangeAsync(insertList);

            #endregion

        }

        /// <summary>
        /// 变更数据
        /// </summary>
        /// <param name="low_Code_Tables"></param>
        /// <returns></returns>
        public Task ChangeAsync(List<Low_Code_Table> low_Code_Tables)
        {
            return this.Repository.UpdateRangeAsync(low_Code_Tables);
        }



    }
}