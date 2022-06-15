using FreeSql.DatabaseModel;
using HZY.EFCore.PagingViews;
using HZY.Infrastructure;
using HZY.Infrastructure.Controllers;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Models.DTO.DevelopmentTool;
using HZY.Models.Entities.LowCode;
using HZY.Services.Admin.DevelopmentTool.LowCode;
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
    [ControllerDescriptor(MenuId = "31")]
    public class CodeGenerationController : AdminBaseController<ICodeGenerationService>
    {
        public CodeGenerationController(ICodeGenerationService defaultService) : base(defaultService)
        {


        }

        /// <summary>
        /// 获取列表
        /// </summary>
        /// <param name="size"></param>
        /// <param name="page"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        [ActionDescriptor(DisplayName = "查询列表")]
        [HttpPost("findList/{size}/{page}")]
        public PagingView FindListAsync([FromRoute] int size, [FromRoute] int page, [FromBody] GenFormDto search)
        {
            return this._defaultService.GetGenContextDtos(page, size, search);
        }

        /// <summary>
        /// 获取代码 根据 表名 和 类型
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        [ActionDescriptor(DisplayName = "获取代码")]
        [HttpPost("getCode")]
        public async Task<dynamic> GetCodeAsync([FromBody] GenFormDto genFormDto)
        {
            var code = await this._defaultService.GetCodeByTypeAndTableNameAsync(genFormDto);

            var lowCodeTableInfos = new List<LowCodeTableInfo>();

            if (!string.IsNullOrWhiteSpace(genFormDto.TableName))
            {
                var table = this._defaultService.GetGenContextDtoByTableName(genFormDto.TableName);

                lowCodeTableInfos = table.TableInfos;
            }

            return new
            {
                code,
                //appTableInfos = lowCodeTableInfos.Select(w => new
                //{
                //    w.Name=,
                //    w.DefaultValue,
                //    w.MaxLength,
                //    w.Position,
                //    w.DbTypeTextFull,
                //    w.Comment,
                //    CsTypeName = w.CsType.Name,
                //    w.IsPrimary,
                //    w.IsIdentity,
                //    w.IsNullable
                //}).ToList()
            };
        }

        /// <summary>
        /// 下载当前代码
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        [ActionDescriptor(DisplayName = "下载当前代码")]
        [HttpPost("download")]
        public async Task DownloadAsync([FromBody] GenFormDto genFormDto)
        {
            var (codeBytes, contentType, fileName) = await this._defaultService.DownloadAsync(genFormDto);
            base.HttpContext.DownLoadFile(codeBytes, contentType, fileName);
        }

        /// <summary>
        /// 创建代码文件
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        [ActionDescriptor(DisplayName = "创建代码文件")]
        [HttpPost("downloadAll")]
        public async Task DownloadAllAsync(GenFormDto genFormDto)
        {
            var (codeBytes, contentType, fileName) = await this._defaultService.DownloadAllAsync(genFormDto);
            base.HttpContext.DownLoadFile(codeBytes, contentType, fileName);
        }

        /// <summary>
        /// 数据库字典文件
        /// </summary>
        /// <returns></returns>
        [ActionDescriptor(DisplayName = "生成数据库字典文件")]
        [HttpPost("createDataDictionary")]
        public void CreateDataDictionary()
        {
            var data = this._defaultService.CreateDataDictionary();
            var fileName = $"{(string.IsNullOrWhiteSpace(data.dataBase) ? "" : data.dataBase + "_")}数据库设计{DateTime.Now.ToString("yyyyMMddHHmmss")}.xlsx";

            base.HttpContext.DownLoadFile(data.excel, Tools.GetFileContentType[".xlsx"], fileName);
        }


    }
}
