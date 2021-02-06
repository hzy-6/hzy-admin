using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using FreeSql;
using HZY.Repository.Core.Models;
using HZY.Toolkit;

namespace HZY.Repository.Core
{
    /// <summary>
    /// 仓储服务基类
    /// </summary>
    /// <typeparam name="TModel"></typeparam>
    public class AppRepository<TModel> : AppRepository<TModel, Guid> where TModel : class
    {
        public AppRepository(IFreeSql freeSql, Expression<Func<TModel, bool>> filter = null)
            : base(freeSql, filter)
        {
        }
    }

    /// <summary>
    /// 仓储服务基类
    /// </summary>
    /// <typeparam name="TModel"></typeparam>
    /// <typeparam name="TKey"></typeparam>
    public class AppRepository<TModel, TKey> : BaseRepository<TModel, TKey> where TModel : class
    {
        public AppRepository(IFreeSql freeSql, Expression<Func<TModel, bool>> filter,
            Func<string, string> asTable = null) : base(freeSql, filter, asTable)
        {
        }

        /// <summary>
        /// 根据 id 数组删除数据
        /// </summary>
        /// <param name="keys"></param>
        /// <returns></returns>
        public Task<int> DeleteAsync(IEnumerable<TKey> keys)
        {
            return this.Orm.Delete<TModel>(keys).ExecuteAffrowsAsync();
        }

        /// <summary>
        /// 创建列头
        /// </summary>
        /// <param name="pagingViewModel"></param>
        /// <param name="fieldNames"></param>
        /// <param name="columnHeads"></param>
        private void CreateColumnHeads(PagingViewModel pagingViewModel,
            List<string> fieldNames,
            List<TableViewColumnHead> columnHeads)
        {
            var entityInfos = this.Orm.DbFirst.GetTableByName(typeof(TModel).Name);

            foreach (var item in fieldNames)
            {
                var title = entityInfos.Columns.Find(w => w.Name == item)?.Coment ?? item;
                pagingViewModel.Columns.Add(new TableViewColumnHead(item.FirstCharToLower(), title));
            }

            //如果 传入了 头信息 则 覆盖
            if (columnHeads == null) return;

            foreach (var item in columnHeads)
            {
                var columnHead =
                    pagingViewModel.Columns.Find(w => w.FieldName.ToLower() == item.FieldName.ToLower());
                if (columnHead == null) continue;
                columnHead.Show = item.Show;
                columnHead.Title = item.Title;
                columnHead.Width = item.Width;
            }
        }

        /// <summary>
        /// 查询转换为分页视图模型 支持 Sql 字符串
        /// </summary>
        /// <param name="sql"></param>
        /// <param name="page"></param>
        /// <param name="size"></param>
        /// <param name="orderBy"></param>
        /// <param name="columnHeads"></param>
        /// <param name="parameters"></param>
        /// <returns></returns>
        public virtual async Task<PagingViewModel> AsPagingViewModelAsync(string sql,
            int page,
            int size,
            string orderBy = "1",
            List<TableViewColumnHead> columnHeads = default,
            params object[] parameters)
        {
            var total = await this.Orm.Ado.ExecuteScalarAsync($"SELECT COUNT(1) FROM ({sql}) TAB", parameters);
            var pagingViewModel = new PagingViewModel {Page = page, Size = size, Total = total.ToInt32()};
            pagingViewModel.PageCount = (pagingViewModel.Total / size);
            var offSet = size * (page - 1);
            var data = await this.Orm.Ado.ExecuteDataTableAsync(
                $"SELECT * FROM ({sql}) TAB ORDER BY {orderBy} OFFSET {offSet} ROWS FETCH NEXT {size} ROWS ONLY",
                parameters);

            var fieldNames = (from DataColumn dc in data.Columns select dc.ColumnName).ToList();

            this.CreateColumnHeads(pagingViewModel, fieldNames, columnHeads);

            #region 重新将数据 组合 为 List<Dictionary<string,object>> 类型

            var result = new List<Dictionary<string, object>>();
            foreach (DataRow dr in data.Rows)
            {
                var dictionary = new Dictionary<string, object>();
                foreach (DataColumn dc in data.Columns)
                {
                    dictionary.Add(dc.ColumnName, dr[dc.ColumnName]);
                }

                result.Add(dictionary);
            }

            pagingViewModel.DataSource = result;

            #endregion

            return await Task.FromResult(pagingViewModel);
        }


        /// <summary>
        /// 转换为分页视图模型
        /// </summary>
        /// <param name="data"></param>
        /// <param name="page"></param>
        /// <param name="size"></param>
        /// <param name="total"></param>
        /// <param name="columnHeads"></param>
        /// <typeparam name="TData"></typeparam>
        /// <returns></returns>
        public Task<PagingViewModel> AsPagingViewModelAsync<TData>(IEnumerable<TData> data, int page, int size,
            long total, List<TableViewColumnHead> columnHeads = default)
        {
            var pagingViewModel = new PagingViewModel();

            var propertyInfos = typeof(TData).GetProperties();
            var fieldNames = propertyInfos.Select(item => item.Name).ToList();

            this.CreateColumnHeads(pagingViewModel, fieldNames, columnHeads);

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

            pagingViewModel.DataSource = result;
            pagingViewModel.PageCount = (total / size);
            pagingViewModel.Page = page;
            pagingViewModel.Size = size;
            pagingViewModel.Total = total;
            return Task.FromResult(pagingViewModel);
        }
    }
}