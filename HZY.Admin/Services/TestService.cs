/*
 * *******************************************************
 *
 * 作者：hzy
 *
 * 开源地址：https://gitee.com/hzy6
 *
 * *******************************************************
 */
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.Framework.Services;
using HZY.Models.Framework;
using HZY.Models;
using HZY.Repository;
using HZY.Repository.Core.Models;
using HZY.Repository.Core.Provider;
using HZY.Repository.Framework;
using HZY.Repository;
using HZY.Toolkit;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;

namespace HZY.Admin.Services
{
    /// <summary>
    /// 服务 TestService
    /// </summary>
    public class TestService : AdminBaseService<TestRepository>
    {
        public SysRoleService(TestRepository repository) 
            : base(repository)
        {

        }

        /// <summary>
        /// 获取列表数据
        /// </summary>
        /// <param name="page">page</param>
        /// <param name="rows">rows</param>
        /// <param name="search">search</param>
        /// <returns></returns>
        public async Task<PagingViewModel> FindListAsync(int page, int rows, Test search)
        {
            var query = this.Repository.Select
                    .WhereIf(!string.IsNullOrWhiteSpace(search?.Name, w => w.Name.Contains(search.Name)
                    .OrderByDescending(w => w.CreateTime)
                    .Select(w => new
                    {
                        w.Id,
                        Name
                        UpdateTime = w.UpdateTime.ToString("yyyy-MM-dd"),
                        CreateTime = w.CreateTime.ToString("yyyy-MM-dd"),
                    })
                ;

            return await this.Repository.AsPagingViewModelAsync(query, page, rows);
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
        public async Task<Dictionary<string,object>> FindFormAsync(Guid id)
        {
            var res = new Dictionary<string, object>();
            var model = await this.Repository.FindByIdAsync(id);
            model = model.NullSafe();

            res[nameof(model)] = model;
            return res;
        }

        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="form">form</param>
        /// <returns></returns>
        public async Task<className> SaveFormAsync(Test form)
        {
            return await this.Repository.InsertOrUpdateAsync(form);
        }
    }
}