using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.Framework;
using HZY.Framework.Services;
using HZY.Repository.Entity.Framework;
using HZY.Repository.Core.Models;
using HZY.Repository.Framework;
using HZY.Toolkit;

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
        /// <param name="size"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        public async Task<PagingViewModel> FindListAsync(int page, int size, SysRole search)
        {
            var query = await this.Repository.Select
                    .WhereIf(!string.IsNullOrWhiteSpace(search?.Name), a => a.Name.Contains(search.Name))
                    .OrderBy(w => w.Number)
                    .Count(out var total)
                    .Page(page, size)
                    .ToListAsync(w => new
                    {
                        w.Id,
                        w.Number,
                        w.Name,
                        IsDelete = w.IsDelete == 1 ? "是" : "否",
                        UpdateTime = w.UpdateTime.ToString("yyyy-MM-dd"),
                        CreateTime = w.CreateTime.ToString("yyyy-MM-dd"),
                    })
                ;

            return await this.Repository.AsPagingViewModelAsync(query, page, size, total);
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
                var role = await this.Repository.FindAsync(item);
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
            var form = await this.Repository.FindAsync(id);
            form = form.NullSafe();

            if (id == Guid.Empty)
            {
                var maxNum = await this.Repository.Select.MaxAsync(w => w.Number);
                form.Number = maxNum + 1;
            }

            res[nameof(form)] = form;
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