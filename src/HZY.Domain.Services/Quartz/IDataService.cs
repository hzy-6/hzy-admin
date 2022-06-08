using HzyScanDiService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Domain.Services.Quartz
{
    /// <summary>
    /// 文件数据服务
    /// </summary>
    public interface IDataService : ITransientDependency
    {
        /// <summary>
        /// 初始化配置
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        bool Init(string path);

        /// <summary>
        /// 读取文件
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <returns></returns>
        Task<IEnumerable<T>> ReadDataAsync<T>();

        /// <summary>
        /// 写入文件
        /// </summary>
        /// <param name="contents"></param>
        /// <returns></returns>
        Task<bool> WriteDataAsync<T>(T contents);


    }
}
