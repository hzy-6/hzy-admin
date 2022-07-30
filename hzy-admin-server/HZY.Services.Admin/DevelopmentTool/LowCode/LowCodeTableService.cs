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
using HZY.Infrastructure;
using HZY.EFCore.Aop;
using HZY.EFCore.Repositories.Admin.Core;

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
        private readonly AppConfiguration _appConfiguration;
        private readonly IAdminRepository<LowCodeTableInfo> _lowCodeTableInfoRepository;


        public LowCodeTableService(LowCodeTableRepository defaultRepository,
        IFreeSql freeSql,
        LowCodeTableInfoService lowCodeTableInfoService,
        DatabaseTablesRepository databaseTablesRepository,
        AppConfiguration appConfiguration,
        IAdminRepository<LowCodeTableInfo> lowCodeTableInfoRepository)
            : base(defaultRepository)
        {
            _freeSql = freeSql;
            _lowCodeTableInfoService = lowCodeTableInfoService;
            _databaseTablesRepository = databaseTablesRepository;
            _appConfiguration = appConfiguration;
            _lowCodeTableInfoRepository = lowCodeTableInfoRepository;
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
                    .OrderByDescending(w => w.CreationTime)
                    .ThenByDescending(w => w.LastModificationTime)
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
        public async Task DeleteListAsync(List<Guid> ids)
        {
            _databaseTablesRepository.ClearAllTablesByCache();
            //删除子表
            await this._lowCodeTableInfoRepository.DeleteBulkAsync(w => ids.Contains(w.Low_Code_TableId));
            //删除主表
            await this._defaultRepository.DeleteByIdsAsync(ids);
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
                    var lowCodeTable = new LowCodeTable
                    {
                        Id = id,
                        DisplayName = item.Comment,
                        TableName = item.Name,
                        EntityName = Tools.LineToHump(item.Name),
                        Schema = item.Schema,
                        Type = item.Type.ToString()
                    };
                    //导入代码路径存储
                    lowCodeTable.ProjectRootPath = _appConfiguration.Configs.AutoImprot.ProjectRootPath;
                    lowCodeTable.ModelPath = _appConfiguration.Configs.AutoImprot.ModelPath;
                    lowCodeTable.ServicePath = _appConfiguration.Configs.AutoImprot.ServicePath;
                    lowCodeTable.ControllerPath = _appConfiguration.Configs.AutoImprot.ControllerPath;
                    lowCodeTable.IndexVuePath = _appConfiguration.Configs.AutoImprot.IndexVuePath;
                    lowCodeTable.InfoVuePath = _appConfiguration.Configs.AutoImprot.InfoVuePath;
                    lowCodeTable.ServiceJsPath = _appConfiguration.Configs.AutoImprot.ServiceJsPath;
                    lowCodeTable.IsCover = _appConfiguration.Configs.AutoImprot.IsCover;
                    insertList.Add(lowCodeTable);
                }
                else
                {
                    id = table.Id;
                    table.Schema = item.Schema;
                    table.Type = item.Type.ToString();
                    //导入代码路径存储
                    table.ProjectRootPath = string.IsNullOrWhiteSpace(table.ProjectRootPath) ? _appConfiguration.Configs.AutoImprot.ProjectRootPath : table.ProjectRootPath;
                    table.ModelPath = string.IsNullOrWhiteSpace(table.ModelPath) ? _appConfiguration.Configs.AutoImprot.ModelPath : table.ModelPath;
                    table.ServicePath = string.IsNullOrWhiteSpace(table.ServicePath) ? _appConfiguration.Configs.AutoImprot.ServicePath : table.ServicePath;
                    table.ControllerPath = string.IsNullOrWhiteSpace(table.ControllerPath) ? _appConfiguration.Configs.AutoImprot.ControllerPath : table.ControllerPath;
                    table.IndexVuePath = string.IsNullOrWhiteSpace(table.IndexVuePath) ? _appConfiguration.Configs.AutoImprot.IndexVuePath : table.IndexVuePath;
                    table.InfoVuePath = string.IsNullOrWhiteSpace(table.InfoVuePath) ? _appConfiguration.Configs.AutoImprot.InfoVuePath : table.InfoVuePath;
                    table.ServiceJsPath = string.IsNullOrWhiteSpace(table.ServiceJsPath) ? _appConfiguration.Configs.AutoImprot.ServiceJsPath : table.ServiceJsPath;
                    table.IsCover = table.IsCover == null ? _appConfiguration.Configs.AutoImprot.IsCover : table.IsCover;
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
        public async Task ChangeAsync(List<LowCodeTable> lowCodeTables)
        {
            _databaseTablesRepository.ClearAllTablesByCache();
            var oldLowCodeTables = await this._defaultRepository.ToListAsync(w => lowCodeTables.Select(w => w.Id).Contains(w.Id));
            var updateList = new List<LowCodeTable>();
            foreach (var item in lowCodeTables)
            {
                var lowCodeTable = oldLowCodeTables.Find(w => w.Id == item.Id);
                lowCodeTable.DisplayName = item.DisplayName;
                lowCodeTable.EntityName = item.EntityName;
                lowCodeTable.Remark = item.Remark;
                updateList.Add(lowCodeTable);
            }
            await this._defaultRepository.UpdateRangeAsync(updateList);
        }

        /// <summary>
        /// 查询表单数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Dictionary<string, object>> FindFormAsync(Guid id)
        {
            var res = new Dictionary<string, object>();
            var form = (await this._defaultRepository.FindByIdAsync(id)).NullSafe();

            res[nameof(id)] = id == Guid.Empty ? "" : id;
            res[nameof(form)] = form;
            return res;
        }

        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="form"></param>
        /// <returns></returns>
        [Transactional]
        public virtual async Task SaveFormAsync(LowCodeTable form)
        {
            await this._defaultRepository.InsertOrUpdateAsync(form);
        }



    }
}