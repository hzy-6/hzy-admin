﻿using HZY.EFCore.Models;
using HZY.Infrastructure.ScanDIService.Interface;
using HZY.Repositories.BaseRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Services.Admin.BaseServicesAdmin
{
    public interface ICrudBaseService<TRepository, TSearchDto, TFormDto, TEntity, TKey> : IDiTransientSelf
        where TRepository : IAdminEfCoreBaseRepository<TEntity>
        where TSearchDto : class
        where TFormDto : class, new()
        where TEntity : class, new()
    {

        /// <summary>
        /// 获取列表数据
        /// </summary>
        /// <param name="page"></param>
        /// <param name="size"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        public Task<PagingViewModel> FindListAsync(int page, int size, TSearchDto search);

        /// <summary>
        /// 根据id数组删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public Task DeleteListAsync(List<TKey> ids);

        /// <summary>
        /// 查询表单数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Task<Dictionary<string, object>> FindFormAsync(TKey id);

        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="form"></param>
        /// <returns></returns>
        public Task<TFormDto> SaveFormAsync(TFormDto form);

        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        public Task<byte[]> ExportExcelAsync(TSearchDto search);


    }
}