using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.Managers.Accounts;
using HZY.EntityFramework.PagingViews;
using HZY.EntityFramework.Repositories.Admin.Core;
using HZY.Infrastructure;
using HZY.Models.DTO.Framework;
using HZY.Models.Entities;
using HZY.Models.Entities.Framework;
using HZY.Services.Admin.Core;
using HZY.Services.Admin.Framework;
using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using HZY.Framework.Core.Utils;

namespace HZY.Services.Admin.Framework
{
    /// <summary>
    /// 服务 SysDataAuthorityService
    /// </summary>
    public class SysDataAuthorityService : AdminBaseService<IAdminRepository<SysDataAuthority>>
    {
        private readonly IAccountManager _accountService;
        private readonly IAdminRepository<SysDataAuthorityCustom> _sysDataAuthorityCustomRepository;

        public SysDataAuthorityService(IAdminRepository<SysDataAuthority> defaultRepository,
        IAccountManager accountService,
        IAdminRepository<SysDataAuthorityCustom> sysDataAuthorityCustomRepository)
            : base(defaultRepository)
        {
            _accountService = accountService;
            _sysDataAuthorityCustomRepository = sysDataAuthorityCustomRepository;
        }

        /// <summary>
        /// 获取列表数据
        /// </summary>
        /// <param name="pagingSearchInput">page</param>
        /// <returns></returns>
        public async Task<PagingView> FindListAsync(PagingSearchInput<SysDataAuthority> pagingSearchInput)
        {
            var query = this._defaultRepository.Select
                    .OrderByDescending(w => w.CreationTime)
                    .Select(w => new
                    {
                        w.Id,
                        w.PermissionType,
                        w.RoleId,
                        LastModificationTime = w.LastModificationTime.Value.ToString("yyyy-MM-dd"),
                        CreationTime = w.CreationTime.ToString("yyyy-MM-dd")
                    })
                ;

            return await this._defaultRepository.AsPagingViewAsync(query, pagingSearchInput);
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
        public async Task SaveFormAsync(SysDataAuthorityFormDto form)
        {
            var sysDataAuthority = await this._defaultRepository.InsertOrUpdateAsync(form.SysDataAuthority);

            //删除集合 操作自定义数据权限
            await this._sysDataAuthorityCustomRepository.DeleteAsync(w => w.SysDataAuthorityId == sysDataAuthority.Id);
            foreach (var item in form.SysDataAuthorityCustomList)
            {
                item.SysDataAuthorityId = sysDataAuthority.Id;
            }

            await this._sysDataAuthorityCustomRepository.InsertRangeAsync(form.SysDataAuthorityCustomList);

        }

        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="pagingSearchInput"></param>
        /// <returns></returns>
        public async Task<byte[]> ExportExcelAsync(PagingSearchInput<SysDataAuthority> pagingSearchInput)
        {
            pagingSearchInput.Page = -1;
            var tableViewModel = await this.FindListAsync(pagingSearchInput);
            return this.ExportExcelByPagingView(tableViewModel, null, "Id");
        }

        /// <summary>
        /// 根据角色 id 获取数据权限
        /// </summary>
        /// <param name="roleId"></param>
        /// <returns></returns>
        public async Task<Dictionary<string, object>> GetDataAuthorityByRoleIdAsync(Guid roleId)
        {
            var result = new Dictionary<string, object>();

            var sysDataAuthority = await this._defaultRepository.FindAsync(w => w.RoleId == roleId);
            sysDataAuthority = sysDataAuthority.NullSafe();
            var sysDataAuthorityCustomList = await _sysDataAuthorityCustomRepository.Select
            .Where(w => w.SysDataAuthorityId == sysDataAuthority.Id)
            .ToListAsync();

            result.Add("sysDataAuthority", sysDataAuthority);
            result.Add("sysDataAuthorityCustomList", sysDataAuthorityCustomList);
            return result;
        }


    }
}