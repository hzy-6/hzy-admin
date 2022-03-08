using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.EFCore.Extensions;
using HZY.EFCore.Models;
using HZY.Infrastructure;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Repositories;
using HZY.Repositories.Framework;
using HZY.Services.Admin.BaseServicesAdmin;
using HZY.Services.Admin.Framework;
using HZY.Services.Upload;
using Microsoft.AspNetCore.Http;

namespace HZY.Services.Admin.Framework
{
    /// <summary>
    /// 服务 SysDataAuthorityCustomService
    /// </summary>
    public class SysDataAuthorityCustomService : AdminBaseService<SysDataAuthorityCustomRepository>
    {
        public SysDataAuthorityCustomService(SysDataAuthorityCustomRepository repository)
            : base(repository)
        {

        }

        /// <summary>
        /// 获取列表数据
        /// </summary>
        /// <param name="page">page</param>
        /// <param name="size">size</param>
        /// <param name="search">search</param>
        /// <returns></returns>
        public async Task<PagingViewModel> FindListAsync(int page, int size, SysDataAuthorityCustom search)
        {
            var query = this.Repository.Select
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

            return await this.Repository.AsPagingViewModelAsync(query, page, size);
        }

        /// <summary>
        /// 根据id数组删除
        /// </summary>
        /// <param name="ids">ids</param>
        /// <returns></returns>
        public async Task DeleteListAsync(List<Guid> ids)
        {
            await this.Repository.DeleteByIdsAsync(ids);
        }

        /// <summary>
        /// 查询表单数据
        /// </summary>
        /// <param name="id">id</param>
        /// <returns></returns>
        public async Task<Dictionary<string, object>> FindFormAsync(Guid id)
        {
            var res = new Dictionary<string, object>();
            var form = await this.Repository.FindByIdAsync(id);
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
            return await this.Repository.InsertOrUpdateAsync(form);
        }

        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        public async Task<byte[]> ExportExcelAsync(SysDataAuthorityCustom search)
        {
            var tableViewModel = await this.FindListAsync(1, 999999, search);
            return this.ExportExcelByPagingViewModel(tableViewModel, null, "Id");
        }



    }
}