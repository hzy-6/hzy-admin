using HZY.Admin.Model;
using HZY.Admin.Model.Dto;
using HZY.Admin.Services;
using HZY.Repository.Entity;
using HZY.Toolkit;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Admin.Controllers
{
    public class HzyAdminCodeGenerationController : FrameworkBaseController
    {
        private readonly string _webRootPath;
        private readonly HzyAdminSpaCodeGenerationService _defaultService;

        public HzyAdminCodeGenerationController(HzyAdminSpaCodeGenerationService defaultService, IWebHostEnvironment webHostEnvironment)
        {
            this._webRootPath = webHostEnvironment.WebRootPath;
            _defaultService = defaultService;
        }
        /// <summary>
        /// Index
        /// </summary>
        /// <returns></returns>
        [HttpGet(nameof(Index))]
        public async Task<IActionResult> Index()
        {
            await this._defaultService.InitializationAsync();
            return View();
        }

        /// <summary>
        /// 初始化数据
        /// </summary>
        /// <returns></returns>
        [HttpGet("Init")]
        public ApiResult InitAsync()
        {
            var appTableInfos = this._defaultService.FindAppTableInfos();
            var tableNames = appTableInfos.Select(w => w.TabName).Distinct().ToList();
            return this.ResultOk(new
            {
                tableNames
            });
        }

        /// <summary>
        /// 获取代码 根据 表名 和 类型
        /// </summary>
        /// <param name="tableName"></param>
        /// <param name="type"></param>
        /// <returns></returns>
        [HttpGet("FindCode/{type}/{tableName}")]
        public async Task<ApiResult> FindCodeByTypeAndModelNameAsync(string type, string tableName)
        {
            var code = await this._defaultService.FindCodeByTypeAndTableNameAsync(type, tableName);

            var appTableInfos = new List<AppTableInfo>();

            if (!string.IsNullOrWhiteSpace(tableName))
            {
                appTableInfos = this._defaultService.FindAppTableInfosByTableName(tableName);
            }

            return this.ResultOk(new { code, appTableInfos });
        }

        /// <summary>
        /// 下载当前代码
        /// </summary>
        /// <param name="type"></param>
        /// <param name="tableName"></param>
        /// <param name="downloadDto"></param>
        /// <returns></returns>
        [HttpPost("Download/{type}/{tableName}")]
        public IActionResult DownloadAsync(string type, string tableName, [FromBody] DownloadDto downloadDto)
        {
            var (codeBytes, className, contentType) = this._defaultService.Download(type, tableName, downloadDto.Code);
            return this.File(codeBytes, contentType, className);
        }

        /// <summary>
        /// 创建代码文件
        /// </summary>
        /// <returns></returns>
        [HttpPost("DownloadAll/{type}")]
        public async Task<IActionResult> DownloadAllAsync(string type)
        {
            var isViews = type == "HZY.Admin.Index.cshtml" || type == "HZY.Admin.Info.cshtml";
            var success = await this._defaultService.CreateAllCodeFilesAsync(type);

            if (!success) LogUtil.Write("无法下载,代码创建失败!");

            string path;
            string zipPath;

            if (isViews)
            {
                path = $"{this._webRootPath}{this._defaultService.GetCodesRootPath()}/Views";
                zipPath = $"{this._webRootPath}{this._defaultService.GetZipRootPath()}";
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                if (!Directory.Exists(zipPath))
                {
                    Directory.CreateDirectory(zipPath);
                }

                zipPath += "/Views.zip";
            }
            else
            {
                path = $"{this._webRootPath}{this._defaultService.GetCodesRootPath()}/{type}";
                zipPath = $"{this._webRootPath}{this._defaultService.GetZipRootPath()}";
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                if (!Directory.Exists(zipPath))
                {
                    Directory.CreateDirectory(zipPath);
                }

                zipPath += $"/{type}.zip";
            }

            //开始压缩
            var zip = new Zip(path, zipPath);
            var bytes = await System.IO.File.ReadAllBytesAsync(zipPath);

            //删除文件
            if (System.IO.File.Exists(zipPath)) System.IO.File.Delete(zipPath);
            if (Directory.Exists(path)) Directory.Delete(path, true);

            return File(bytes, Tools.GetFileContentType[".zip"], $"{(isViews ? "Views" : type)}.zip");
        }
    }
}
