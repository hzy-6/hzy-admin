using HZY.Framework.EntityFrameworkRepositories.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.EntityFramework.PagingViews
{
    /// <summary>
    /// 分页查询对象
    /// </summary>
    /// <typeparam name="TSearch"></typeparam>
    public class PagingSearchInput<TSearch>
    {
        /// <summary>
        /// 当前页码
        /// </summary>
        public int Page { get; set; }

        /// <summary>
        /// 每页数量
        /// </summary>
        public int Size { get; set; }

        /// <summary>
        /// 检索对象
        /// </summary>
        public TSearch Search { get; set; }

        /// <summary>
        /// 排序
        /// </summary>
        public List<PaginationSearchSort> SearchSort { get; set; }

    }
}
