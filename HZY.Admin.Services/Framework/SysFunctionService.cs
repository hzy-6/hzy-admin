using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HZY.Repository.Framework;
using HZY.Common;
using HZY.Repository.Domain.Framework;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using HZY.Repository.AppCore.Models;
using HZY.Repository.AppCore.Extensions;

namespace HZY.Admin.Services.Framework
{
    /// <summary>
    /// 功能服务
    /// </summary>
    public class SysFunctionService : AdminBaseService<SysFunctionRepository>
    {
        public SysFunctionService(SysFunctionRepository repository) : base(repository)
        {
        }

        /// <summary>
        /// 获取列表数据
        /// </summary>
        /// <param name="page"></param>
        /// <param name="size"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        public async Task<PagingViewModel> FindListAsync(int page, int size, SysFunction search)
        {
            var query = this.Repository.Select
                    .WhereIf(!string.IsNullOrWhiteSpace(search?.Name), a => a.Name.Contains(search.Name))
                    .OrderBy(w => w.Number)
                    .Select(w => new
                    {
                        w.Id,
                        w.Number,
                        w.Name,
                        w.ByName,
                        UpdateTime = w.UpdateTime.ToString("yyyy-MM-dd"),
                        CreateTime = w.CreateTime.ToString("yyyy-MM-dd"),
                    })
                ;

            return await this.Repository.AsPagingViewModelAsync(query, page, size);
        }

        /// <summary>
        /// 根据id数组删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public async Task DeleteListAsync(IEnumerable<Guid> ids)
        {
            await this.Repository.DeleteByIdsAsync(ids);
        }

        /// <summary>
        /// 查询表单数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Dictionary<string, object>> FindFormAsync(Guid id)
        {
            var res = new Dictionary<string, object>();
            var form = await this.Repository.FindByIdAsync(id);
            form = form.NullSafe();

            if (form.Id == Guid.Empty)
            {
                var maxNumber = await this.Repository.Select.MaxAsync(w => w.Number);
                form.Number = (maxNumber ?? 0) + 1;
            }

            res[nameof(form)] = form;
            return res;
        }

        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="form"></param>
        /// <returns></returns>
        public async Task<SysFunction> SaveFormAsync(SysFunction form)
        {
            return await this.Repository.InsertOrUpdateAsync(form);
        }

        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        public async Task<byte[]> ExportExcelAsync(SysFunction search)
        {
            var tableViewModel = await this.FindListAsync(1, 999999, search);
            return this.ExportExcelByPagingViewModel(tableViewModel);
        }
    }
}