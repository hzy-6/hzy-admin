using FreeSql.DatabaseModel;
using HZY.Controllers.Admin.ControllersAdmin;
using HZY.EFCore.Models;
using HZY.Infrastructure;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Models.DTO.DevelopmentTool;
using HZY.Services.Admin.DevelopmentTool.CodeGeneration;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Controllers.Admin.DevelopmentTool
{
    /// <summary>
    /// 代码生成器控制器
    /// </summary>
    public class CodeGenerationController : AdminBaseController<ICodeGenerationService>
    {
        public CodeGenerationController(ICodeGenerationService defaultService) : base("31", defaultService)
        {


        }

        /// <summary>
        /// 获取列表
        /// </summary>
        /// <param name="size"></param>
        /// <param name="page"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        [HttpPost("findList/{size}/{page}")]
        public PagingViewModel FindListAsync([FromRoute] int size, [FromRoute] int page, [FromBody] GenFormDto search)
        {
            return this.DefaultService.GetGenContextDtos(page, size, search);
        }

        /// <summary>
        /// 获取代码 根据 表名 和 类型
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        [HttpPost("getCode")]
        public async Task<dynamic> GetCodeAsync([FromBody] GenFormDto genFormDto)
        {
            var code = await this.DefaultService.GetCodeByTypeAndTableNameAsync(genFormDto);

            var appTableInfos = new List<DbColumnInfo>();

            if (!string.IsNullOrWhiteSpace(genFormDto.TableName))
            {
                var table = this.DefaultService.GetGenContextDtoByTableName(genFormDto.TableName);

                appTableInfos = table.Columns;
            }

            return new
            {
                code,
                appTableInfos = appTableInfos.Select(w => new
                {
                    w.Name,
                    w.DefaultValue,
                    w.MaxLength,
                    w.Position,
                    w.DbTypeTextFull,
                    w.Comment,
                    CsTypeName = w.CsType.Name,
                    w.IsPrimary,
                    w.IsIdentity,
                    w.IsNullable
                }).ToList()
            };
        }

        /// <summary>
        /// 下载当前代码
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        [HttpPost("download")]
        public async Task DownloadAsync([FromBody] GenFormDto genFormDto)
        {
            var (codeBytes, contentType, fileName) = await this.DefaultService.DownloadAsync(genFormDto);
            base.HttpContext.DownLoadFile(codeBytes, contentType, fileName);
        }

        /// <summary>
        /// 创建代码文件
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        [HttpPost("downloadAll")]
        public async Task DownloadAllAsync(GenFormDto genFormDto)
        {
            var (codeBytes, contentType, fileName) = await this.DefaultService.DownloadAllAsync(genFormDto);
            base.HttpContext.DownLoadFile(codeBytes, contentType, fileName);
        }

        /// <summary>
        /// 数据库字典文件
        /// </summary>
        /// <returns></returns>
        [HttpPost("createDataDictionary")]
        public void CreateDataDictionary()
        {
            var data = this.DefaultService.CreateDataDictionary();
            var fileName = $"{(string.IsNullOrWhiteSpace(data.dataBase) ? "" : data.dataBase + "_")}数据库设计{DateTime.Now.ToString("yyyyMMddHHmmss")}.xlsx";

            base.HttpContext.DownLoadFile(data.excel, Tools.GetFileContentType[".xlsx"], fileName);
        }


    }
}
