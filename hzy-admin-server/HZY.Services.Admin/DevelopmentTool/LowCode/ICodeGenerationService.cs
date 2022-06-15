using HZY.EFCore.PagingViews;
using HZY.Models.DTO.DevelopmentTool;
using HzyScanDiService;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Services.Admin.DevelopmentTool.LowCode
{
    /// <summary>
    /// 代码生成服务
    /// </summary>
    public interface ICodeGenerationService : ITransientDependency
    {
        /// <summary>
        /// 生成上下文集合
        /// </summary>
        /// <returns></returns>
        PagingView GetGenContextDtos(int page, int size, GenFormDto search);

        /// <summary>
        /// 获取表字段集合
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        GenDbTableDto GetGenContextDtoByTableName(string tableName);

        /// <summary>
        /// 获取代码生成上下文
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        GenDbTableDto GetGenContextDto(GenFormDto genFormDto);

        /// <summary>
        /// 生成 model
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        Task<string> GenModelAsync(GenFormDto genFormDto);

        /// <summary>
        /// 生成 service
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        Task<string> GenServiceAsync(GenFormDto genFormDto);

        /// <summary>
        /// 生成 controller
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        Task<string> GenControllerAsync(GenFormDto genFormDto);

        /// <summary>
        /// 生成 serviceJs
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        Task<string> GenServiceJsAsync(GenFormDto genFormDto);

        /// <summary>
        /// 生成 indexVue
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        Task<string> GenIndexVueAsync(GenFormDto genFormDto);

        /// <summary>
        /// 生成 infoVue
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        Task<string> GenInfoVueAsync(GenFormDto genFormDto);

        /// <summary>
        /// 获取代码
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        Task<string> GetCodeByTypeAndTableNameAsync(GenFormDto genFormDto);

        /// <summary>
        /// 下载
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        Task<(byte[] codeBytes, string contentType, string fileName)> DownloadAsync(GenFormDto genFormDto);

        /// <summary>
        /// 根据类型下载类型下所有的代码
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        Task<(byte[] codeBytes, string contentType, string fileName)> DownloadAllAsync(GenFormDto genFormDto);

        /// <summary>
        /// 创建所有代码文件
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        Task<bool> CreateAllCodeFilesAsync(GenFormDto genFormDto);

        /// <summary>
        /// 创建数据字典文件 excel
        /// </summary>
        /// <returns></returns>
        (byte[] excel, string dataBase) CreateDataDictionary();

    }
}
