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
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using HZY.Common;
using HZY.Common.ScanDIService.Interface;
using HZY.Repository.AppCore.DbContexts;
using HZY.Repository.AppCore.Extensions;
using HZY.Repository.AppCore.Impl;
using HZY.Repository.AppCore.Models;
using Microsoft.EntityFrameworkCore;
using Dapper;
using System;

namespace HZY.Repository.AppCore.Provider
{
    /// <summary>
    /// 默认基础仓储
    /// </summary>
    /// <typeparam name="T"></typeparam>
    //[AppService(IgnoreCurrent = true)]
    public class AdminBaseRepository<T> : RepositoryImpl<T, AdminBaseDbContext>, IDITransientSelf
        where T : class, new()
    {
        public AdminBaseRepository(AdminBaseDbContext context) : base(context)
        {
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
            var entityInfos = this.Orm.CacheEntity.GetEntityInfos(typeof(T).Name);

            foreach (var item in fieldNames)
            {
                var title = entityInfos.Find(w => w.Name == item)?.Remark ?? item;
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
        /// 查询转换为分页视图模型
        /// </summary>
        /// <param name="query"></param>
        /// <param name="page"></param>
        /// <param name="size"></param>
        /// <param name="columnHeads"></param>
        /// <typeparam name="TModel"></typeparam>
        /// <returns></returns>
        public virtual async Task<PagingViewModel> AsPagingViewModelAsync<TModel>(IQueryable<TModel> query,
            int page,
            int size,
            List<TableViewColumnHead> columnHeads = default)
        {
            var pagingViewModel = new PagingViewModel { Page = page, Size = size, Total = await query.CountAsync() };
            pagingViewModel.PageCount = (pagingViewModel.Total / size);
            var data = await query.Page(page, size).ToListAsync();

            var propertyInfos = typeof(TModel).GetProperties();
            var fieldNames = propertyInfos.Select(item => item.Name).ToList();
            //.OrderBy(w => w.Name)

            this.CreateColumnHeads(pagingViewModel, fieldNames, columnHeads);

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

            pagingViewModel.DataSource = result;

            #endregion

            return pagingViewModel;
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
            var dbConnection = Orm.Database.GetDataConnection();

            var count = await dbConnection.QuerySingleAsync<int>($"SELECT COUNT(1) FROM ({sql}) TAB", parameters);
            var pagingViewModel = new PagingViewModel { Page = page, Size = size, Total = count };
            pagingViewModel.PageCount = (pagingViewModel.Total / size);
            var offSet = size * (page - 1);
            var sqlString = string.Empty;

            if (Orm.Database.IsSqlServer())
            {
                sqlString = $"SELECT * FROM ({sql}) TAB ORDER BY {orderBy} OFFSET {offSet} ROWS FETCH NEXT {size} ROWS ONLY";
            }
            else if (Orm.Database.IsMySql())
            {
                sqlString = $"SELECT * FROM ({sql}) TAB ORDER BY {orderBy} LIMIT {offSet},{size}";
            }
            else
            {
                throw new Exception("查询数据库类型不支持!");
            }

            var dataReader = await dbConnection.ExecuteReaderAsync(sqlString, parameters);
            var data = new DataTable("Dapper_Select_Table");
            data.Load(dataReader);

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
    }
}