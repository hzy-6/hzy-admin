using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.EFCore.PagingViews;
using HZY.EFCore.Repositories.Admin.Core;
using HZY.Infrastructure;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Services.Admin.Core;
using HZY.Services.Admin.Framework;
using Microsoft.AspNetCore.Http;

namespace HZY.Services.Admin.Framework
{
    /// <summary>
    /// 服务 SysDataAuthorityCustomService
    /// </summary>
    public class SysDataAuthorityCustomService : AdminBaseService<IAdminRepository<SysDataAuthorityCustom>>
    {
        public SysDataAuthorityCustomService(IAdminRepository<SysDataAuthorityCustom> defaultRepository)
            : base(defaultRepository)
        {

        }

        /// <summary>
        /// 获取列表数据
        /// </summary>
        /// <param name="page">page</param>
        /// <param name="size">size</param>
        /// <param name="search">search</param>
        /// <returns></returns>
        public async Task<PagingView> FindListAsync(int page, int size, SysDataAuthorityCustom search)
        {
            var query = this._defaultRepository.Select
                    .OrderByDescending(w => w.CreationTime)
                    .Select(w => new
                    {
                        w.Id,
                        w.SysDataAuthorityId,
                        w.SysOrganizationId,
                        LastModificationTime = w.LastModificationTime.ToString("yyyy-MM-dd"),
                        CreationTime = w.CreationTime.ToString("yyyy-MM-dd")
                    })
                ;

            return await this._defaultRepository.AsPagingViewAsync(query, page, size);
        }

        /// <summary>
        /// 根据id数组删除
        /// </summary>
        /// <param name="ids">ids</param>
        /// <returns></returns>
        public async Task DeleteListAsync(List<Guid> ids)
        {
            await this._defaultRepository.DeleteByIdsAsync(ids);
        }

        /// <summary>
        /// 查询表单数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Dictionary<string, object>> FindFormAsync(Guid id)
        {
            var res = new Dictionary<string, object>();
            var form = await this._defaultRepository.FindByIdAsync(id);
            form = form.NullSafe();

            res[nameof(id)] = id == Guid.Empty ? "" : id;
            res[nameof(form)] = form;
            return res;
        }

        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="form">form</param>
        /// <returns></returns>
        public async Task<SysDataAuthorityCustom> SaveFormAsync(SysDataAuthorityCustom form)
        {
            return await this._defaultRepository.InsertOrUpdateAsync(form);
        }

        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        public async Task<byte[]> ExportExcelAsync(SysDataAuthorityCustom search)
        {
            var tableViewModel = await this.FindListAsync(-1, 0, search);
            return this.ExportExcelByPagingView(tableViewModel, null, "Id");
        }



    }
}