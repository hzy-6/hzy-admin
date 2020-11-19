/*
 * *******************************************************
 *
 * 作者：hzy
 *
 * 开源地址：https://gitee.com/hzy6
 *
 * *******************************************************
 */
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.Repository.Core.Impl;
using HZY.Repository.Core.Models;
using HZY.Toolkit;
using HZY.Toolkit.Attributes;
using Microsoft.EntityFrameworkCore;

namespace HZY.Repository.Core.Provider
{
    /// <summary>
    /// 默认基础仓储
    /// </summary>
    /// <typeparam name="T"></typeparam>
    [AppService(IgnoreCurrent = true)]
    public class AppRepository<T> : RepositoryImpl<T, AppDbContext> where T : class, new()
    {
        public AppRepository(AppDbContext context) : base(context)
        {
        }

        /// <summary>
        /// 查询转换为分页视图模型
        /// </summary>
        /// <param name="query"></param>
        /// <param name="page"></param>
        /// <param name="rows"></param>
        /// <param name="columnHeads"></param>
        /// <typeparam name="TModel"></typeparam>
        /// <returns></returns>
        public virtual async Task<PagingViewModel> AsPagingViewModelAsync<TModel>(IQueryable<TModel> query,
            int page,
            int rows,
            List<TableViewColumnHead> columnHeads = default)
        {
            var pagingViewModel = new PagingViewModel {Page = page, Rows = rows, Counts = await query.CountAsync()};
            pagingViewModel.PageCount = (pagingViewModel.Counts / rows);
            var data = await query.ToListAsync();

            var propertyInfos = typeof(TModel).GetProperties();
            var fieldNames = propertyInfos.Select(item => item.Name).ToList();
            var entityInfos = EntityCache.GetModelInfos(typeof(T).Name);

            #region 组合 列头

            foreach (var item in fieldNames)
            {
                var title = entityInfos.Find(w => w.Name == item)?.Remark ?? item;
                pagingViewModel.Columns.Add(new TableViewColumnHead(item.FirstCharToLower(), title));
            }

            //如果 传入了 头信息 则 覆盖
            if (columnHeads != null)
            {
                foreach (var item in columnHeads)
                {
                    var columnHead = pagingViewModel.Columns.Find(w => w.FieldName.ToLower() == item.FieldName.ToLower());
                    if (columnHead == null) continue;
                    columnHead.Show = item.Show;
                    columnHead.Title = item.Title;
                    columnHead.Width = item.Width;
                }
            }

            #endregion
            
            #region 重新将数据 组合 为 List<Dictionary<string,object>> 类型

            var result = new List<Dictionary<string, object>>();
            foreach (var item in data)
            {
                var type = item.GetType();
                var dictionary = new Dictionary<string, object>();

                foreach (var fieldName in fieldNames)
                {
                    dictionary[fieldName] = type.GetProperty(fieldName)?.GetValue(item);
                }

                result.Add(dictionary);
            }

            pagingViewModel.Result = result;

            #endregion

            return pagingViewModel;
        }
    }
}