using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.Framework;
using HZY.Framework.Services;
using HZY.Entity.Framework;
using HZY.Repository.Core.Models;
using HZY.Repository.Core.Provider;
using HZY.Repository.Framework;
using HZY.Toolkit;
using Microsoft.EntityFrameworkCore;

namespace HZY.Admin.Services.Framework
{
    /// <summary>
    /// 角色服务
    /// </summary>
    public class SysRoleService : AdminBaseService<SysRoleRepository>
    {
        private readonly SysUserRoleRepository _sysUserRoleRepository;

        public SysRoleService(SysRoleRepository repository, SysUserRoleRepository sysUserRoleRepository) : base(
            repository)
        {
            _sysUserRoleRepository = sysUserRoleRepository;
        }

        /// <summary>
        /// 获取列表数据
        /// </summary>
        /// <param name="page"></param>
        /// <param name="rows"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        public async Task<PagingViewModel> FindListAsync(int page, int rows, SysRole search)
        {
            var query = this.Repository.Select
                    .WhereIf(!string.IsNullOrWhiteSpace(search?.Name), a => a.Name.Contains(search.Name))
                    .OrderByDescending(w => w.CreateTime)
                    .Select(w => new
                    {
                        w.Id,
                        w.Number,
                        w.Name,
                        w.IsDelete,
                        UpdateTime = w.UpdateTime.ToString("yyyy-MM-dd"),
                        CreateTime = w.CreateTime.ToString("yyyy-MM-dd"),
                    })
                ;

            return await this.Repository.AsPagingViewModelAsync(query, page, rows, new List<TableViewColumnHead>()
            {
                new TableViewColumnHead("Name", "角色名称 test", 200)
            });
        }

        /// <summary>
        /// 根据id数组删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public async Task DeleteListAsync(List<Guid> ids)
        {
            foreach (var item in ids)
            {
                var role = await this.Repository.FindByIdAsync(item);
                if (role.IsDelete == 2)
                    MessageBox.Show("该信息不能删除!");
                await this.Repository.DeleteAsync(role);
                await this._sysUserRoleRepository.DeleteAsync(w => w.RoleId == item);
            }
        }

        /// <summary>
        /// 查询表单数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Dictionary<string, object>> FindFormAsync(Guid id)
        {
            var res = new Dictionary<string, object>();
            var model = await this.Repository.FindByIdAsync(id);
            model = model.NullSafe();

            if (id == Guid.Empty)
            {
                var maxNum = await this.Repository.Select.MaxAsync(w => w.Number);
                model.Number = maxNum + 1;
            }

            res[nameof(model)] = model;
            return res;
        }

        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="form"></param>
        /// <returns></returns>
        public async Task<SysRole> SaveFormAsync(SysRole form)
        {
            return await this.Repository.InsertOrUpdateAsync(form);
        }

        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        public async Task<byte[]> ExportExcelAsync(SysRole search)
        {
            var tableViewModel = await this.FindListAsync(1, 999999, search);
            return this.ExportExcelByPagingViewModel(tableViewModel);
        }
    }
}