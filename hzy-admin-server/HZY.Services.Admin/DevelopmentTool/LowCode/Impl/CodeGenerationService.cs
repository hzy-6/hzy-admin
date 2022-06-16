using FreeSql.DatabaseModel;
using HZY.EFCore.PagingViews;
using HZY.EFCore.Repositories.Admin.DevelopmentTool;
using HZY.Infrastructure;
using HZY.Infrastructure.RazorView;
using HZY.Infrastructure.SerilogUtil;
using HZY.Models.Consts;
using HZY.Models.DTO.DevelopmentTool;
using HzyEFCoreRepositories.Extensions;
using Microsoft.AspNetCore.Hosting;
using NPOI.HSSF.UserModel;
using NPOI.XSSF.UserModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.Services.Admin.DevelopmentTool.LowCode.Impl
{
    /// <summary>
    /// 代码生成服务
    /// </summary>
    public class CodeGenerationService : ICodeGenerationService
    {
        private readonly string _webRootPath;
        private readonly string templateRootPath = "/wwwroot/code_generation/template/";
        private readonly string codesRootPath = "/code_generation/codes";
        private readonly string zipRootPath = "/code_generation/zip";

        //domain 模板文件
        private readonly string templateModel = "tempModel.cshtml";
        private readonly string templateService = "tempService.cshtml";
        private readonly string templateController = "tempController.cshtml";
        private readonly string templateServiceJs = "tempServiceJs.cshtml";
        private readonly string templateIndexVue = "tempIndexVue.cshtml";
        private readonly string templateInfoVue = "tempInfoVue.cshtml";

        private readonly DatabaseTablesRepository _codeGenerationRepository;
        private readonly IRazorViewRender _razorViewRender;
        private readonly AppConfiguration _appConfiguration;

        public CodeGenerationService(DatabaseTablesRepository codeGenerationRepository,
            IRazorViewRender razorViewRender,
            IWebHostEnvironment webHostEnvironment,
            AppConfiguration appConfiguration)
        {
            _codeGenerationRepository = codeGenerationRepository;
            _razorViewRender = razorViewRender;
            this._webRootPath = webHostEnvironment.WebRootPath;
            _appConfiguration = appConfiguration;
        }

        /// <summary>
        /// 生成上下文集合
        /// </summary>
        /// <returns></returns>
        public PagingView GetGenContextDtos(int page, int size, GenFormDto search)
        {
            var PagingView = new PagingView();
            var result = new List<Dictionary<string, object>>();

            var query = _codeGenerationRepository.GetAllTables()
                .WhereIf(!string.IsNullOrWhiteSpace(search.TableName), w => w.TableName.Contains(search.TableName));

            var tables = query
                .Skip((page - 1) * size)
                .Take(size)
                .ToList();

            foreach (var item in tables)
            {
                var dic = new Dictionary<string, object>();
                dic.Add(nameof(item.TableName), item.TableName);
                dic.Add(nameof(item.Remark), item.Remark);
                dic.Add(nameof(item.Schema), item.Schema);
                dic.Add(nameof(item.Type), item.Type.ToString());

                result.Add(dic);
            }

            PagingView.Total = query.LongCount();
            PagingView.Page = page;
            PagingView.Size = size;
            PagingView.DataSource = result;
            PagingView.PageCount = (PagingView.Total / size);
            return PagingView;
        }

        /// <summary>
        /// 获取所有表集合信息
        /// </summary>
        /// <returns></returns>
        public GenDbTableDto GetGenContextDtoByTableName(string tableName)
        {
            return _codeGenerationRepository.GetAllTables().FirstOrDefault(w => w.TableName == tableName);
        }

        /// <summary>
        /// 获取代码生成上下文
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        public GenDbTableDto GetGenContextDto(GenFormDto genFormDto)
        {
            var tableName = genFormDto.TableName;

            var tables = _codeGenerationRepository.GetAllTables();

            var tableInfo = tables.FirstOrDefault(w => w.TableName == tableName);

            if (tableInfo == null) return null;
            tableInfo.Namespace = _appConfiguration.Configs.Namespace;
            return tableInfo;
        }

        /// <summary>
        /// 生成model
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        public async Task<string> GenModelAsync(GenFormDto genFormDto)
        {
            var context = this.GetGenContextDto(genFormDto);

            return this.ClearSymbol(await this._razorViewRender.RenderAsync(templateRootPath + templateModel, context));
        }

        /// <summary>
        /// 生成service
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        public async Task<string> GenServiceAsync(GenFormDto genFormDto)
        {
            var context = this.GetGenContextDto(genFormDto);

            return this.ClearSymbol(await this._razorViewRender.RenderAsync(templateRootPath + templateService, context));
        }

        /// <summary>
        /// 生成controller
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        public async Task<string> GenControllerAsync(GenFormDto genFormDto)
        {
            var context = this.GetGenContextDto(genFormDto);

            return this.ClearSymbol(await this._razorViewRender.RenderAsync(templateRootPath + templateController, context));
        }

        /// <summary>
        /// 生成service js
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        public async Task<string> GenServiceJsAsync(GenFormDto genFormDto)
        {
            var context = this.GetGenContextDto(genFormDto);

            return this.ClearSymbol(await this._razorViewRender.RenderAsync(templateRootPath + templateServiceJs, context));
        }

        /// <summary>
        /// 生成 index vue
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        public async Task<string> GenIndexVueAsync(GenFormDto genFormDto)
        {
            var context = this.GetGenContextDto(genFormDto);

            return this.ClearSymbol(await this._razorViewRender.RenderAsync(templateRootPath + templateIndexVue, context));
        }

        /// <summary>
        /// 生成 info vue
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        public async Task<string> GenInfoVueAsync(GenFormDto genFormDto)
        {
            var context = this.GetGenContextDto(genFormDto);

            return this.ClearSymbol(await this._razorViewRender.RenderAsync(templateRootPath + templateInfoVue, context));
        }


        /// <summary>
        /// 获取代码
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        public async Task<string> GetCodeByTypeAndTableNameAsync(GenFormDto genFormDto)
        {
            return genFormDto.Type switch
            {
                "HZY.Models" => await this.GenModelAsync(genFormDto),
                //"HZY.Repository.DbSet" => await this.CreateRepositoryDbSetAsync(),
                "HZY.Services.Admin" => await this.GenServiceAsync(genFormDto),
                "HZY.Controllers.Admin" => await this.GenControllerAsync(genFormDto),
                "Index.vue" => await this.GenIndexVueAsync(genFormDto),
                "Info.vue" => await this.GenInfoVueAsync(genFormDto),
                "Service.js" => await this.GenServiceJsAsync(genFormDto),
                _ => string.Empty
            };
        }

        /// <summary>
        /// 创建所有代码文件
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        public async Task<bool> CreateAllCodeFilesAsync(GenFormDto genFormDto)
        {
            var tables = _codeGenerationRepository.GetAllTables();

            foreach (var item in tables)
            {
                genFormDto.TableName = item.TableName;
                await this.CreateCodeFilesAsync(genFormDto);
                await Task.Delay(25);
            }

            return true;
        }

        /// <summary>
        /// 获取下载代码信息
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        public async Task<(byte[] codeBytes, string contentType, string fileName)> DownloadAsync(GenFormDto genFormDto)
        {
            var fileName = this.FindCodeFileClassName(genFormDto);

            var contentType = Tools.GetFileContentType[".cs"];
            if (fileName == "Index.vue" || fileName == "Info.vue")
            {
                contentType = Tools.GetFileContentType[".txt"];
            }

            return (Encoding.UTF8.GetBytes(await this.GetCodeByTypeAndTableNameAsync(genFormDto)), contentType, fileName);
        }

        /// <summary>
        /// 根据类型下载所有代码
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        public async Task<(byte[] codeBytes, string contentType, string fileName)> DownloadAllAsync(GenFormDto genFormDto)
        {
            var isViews = genFormDto.Type == "Index.vue" || genFormDto.Type == "Info.vue";
            var success = await this.CreateAllCodeFilesAsync(genFormDto);

            if (!success) LogUtil.Log.Warning("无法下载,代码创建失败!");

            string path;
            string zipPath;

            if (isViews)
            {
                path = $"{this._webRootPath}{this.codesRootPath}/Views";
                zipPath = $"{this._webRootPath}{this.zipRootPath}";
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
                path = $"{this._webRootPath}{this.codesRootPath}/{genFormDto.Type}";
                zipPath = $"{this._webRootPath}{this.zipRootPath}";
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                if (!Directory.Exists(zipPath))
                {
                    Directory.CreateDirectory(zipPath);
                }

                zipPath += $"/{genFormDto.Type}.zip";
            }

            //开始压缩
            var zip = new Zip(path, zipPath);
            var bytes = await System.IO.File.ReadAllBytesAsync(zipPath);

            //删除文件
            if (System.IO.File.Exists(zipPath)) System.IO.File.Delete(zipPath);
            if (Directory.Exists(path)) Directory.Delete(path, true);

            return (bytes, Tools.GetFileContentType[".zip"], $"{(isViews ? "Views" : genFormDto.Type)}.zip");
        }

        /// <summary>
        /// 创建数据库字典文件
        /// </summary>
        /// <returns></returns>
        public (byte[] excel, string dataBase) CreateDataDictionary()
        {
            var tables = _codeGenerationRepository.GetAllTables();
            var workbook = new XSSFWorkbook();
            var dataBaseName = _codeGenerationRepository.GetConnectionString().Split(';')
                .Where(w => w.ToLower().Trim().Contains("database"))
                .FirstOrDefault()?.Split('=')[1]
                ;

            foreach (var item in tables)
            {
                var sheet = workbook.CreateSheet(item.TableName + (string.IsNullOrWhiteSpace(item.Remark) ? "" : "_" + item.Remark));

                var i = 0;

                #region 配置表头

                var rowTitle = sheet.CreateRow(i);
                rowTitle.CreateCell(0).SetCellValue("表空间");
                sheet.SetColumnWidth(0, 20 * 256);
                rowTitle.CreateCell(1).SetCellValue("表名");
                sheet.SetColumnWidth(1, 20 * 256);
                rowTitle.CreateCell(2).SetCellValue("表描述");
                sheet.SetColumnWidth(2, 20 * 256);
                rowTitle.CreateCell(3).SetCellValue("字段");
                sheet.SetColumnWidth(3, 20 * 256);
                rowTitle.CreateCell(4).SetCellValue("字段描述");
                sheet.SetColumnWidth(4, 20 * 256);
                rowTitle.CreateCell(5).SetCellValue("是否主键");
                sheet.SetColumnWidth(5, 20 * 256);
                rowTitle.CreateCell(6).SetCellValue("是否自增");
                sheet.SetColumnWidth(6, 20 * 256);
                rowTitle.CreateCell(7).SetCellValue("可否为 Null");
                sheet.SetColumnWidth(7, 20 * 256);
                rowTitle.CreateCell(8).SetCellValue("数据库类型");
                sheet.SetColumnWidth(8, 20 * 256);
                rowTitle.CreateCell(9).SetCellValue("C#类型");
                sheet.SetColumnWidth(9, 20 * 256);
                rowTitle.CreateCell(10).SetCellValue("数据长度");
                sheet.SetColumnWidth(10, 20 * 256);

                #endregion
                //组装数据
                foreach (var tableInfo in item.TableInfos)
                {
                    i++;
                    var index = item.TableInfos.IndexOf(tableInfo);
                    var row = sheet.CreateRow(i);
                    row.CreateCell(0).SetCellValue(item.Schema);
                    row.CreateCell(1).SetCellValue(item.TableName);
                    row.CreateCell(2).SetCellValue(item.Remark);
                    row.CreateCell(3).SetCellValue(tableInfo.ColumnName);
                    row.CreateCell(4).SetCellValue(tableInfo.Describe);
                    row.CreateCell(5).SetCellValue(tableInfo.IsPrimary ? "是" : "否");
                    row.CreateCell(6).SetCellValue(tableInfo.IsIdentity ? "是" : "否");
                    row.CreateCell(7).SetCellValue(tableInfo.IsNullable ? "是" : "否");
                    row.CreateCell(8).SetCellValue(tableInfo.DatabaseColumnType);
                    row.CreateCell(9).SetCellValue(tableInfo.CsType);
                    row.CreateCell(10).SetCellValue(tableInfo.MaxLength ?? 0);
                }

            }

            //填充byte
            using var ms = new MemoryStream();
            workbook.Write(ms);
            return (ms.ToArray(), dataBaseName);
        }


        #region 私有方法

        /// <summary>
        /// 清除多余符号
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        private string ClearSymbol(StringBuilder code)
        {
            return code
                    .ToString()
                    .Replace("<pre>", "")
                    .Replace("</pre>", "")
                    .Trim()
                ;
        }

        /// <summary>
        /// 创建代码文件
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        private async Task<string> CreateCodeFilesAsync(GenFormDto genFormDto)
        {
            var path = $"{this._webRootPath}{codesRootPath}";

            if (genFormDto.Type == "Index.vue" || genFormDto.Type == "Info.vue")
            {
                path += $"/Views";
                if (!Directory.Exists(path)) Directory.CreateDirectory(path);
                path += $"/{genFormDto.TableName.FirstCharToLower()}";
                if (!Directory.Exists(path)) Directory.CreateDirectory(path);
                //Index
                var codeString = await this.GenIndexVueAsync(genFormDto);
                await File.WriteAllTextAsync($"{path}/Index.vue", codeString, Encoding.UTF8);
                //Info
                codeString = await this.GenInfoVueAsync(genFormDto);
                await File.WriteAllTextAsync($"{path}/Info.vue", codeString, Encoding.UTF8);
                return path;
            }

            //
            path = $"{this._webRootPath}{codesRootPath}/{genFormDto.Type}";
            var className = this.FindCodeFileClassName(genFormDto);
            var code = await this.GetCodeByTypeAndTableNameAsync(genFormDto);
            //
            if (!Directory.Exists(path)) Directory.CreateDirectory(path);
            await File.WriteAllTextAsync($"{path}/{className}", code, Encoding.UTF8);
            return path;
        }

        /// <summary>
        /// 获取代码文件名称
        /// </summary>
        /// <param name="genFormDto"></param>
        /// <returns></returns>
        private string FindCodeFileClassName(GenFormDto genFormDto)
        {
            return genFormDto.Type switch
            {
                "HZY.Models" => $"{genFormDto.TableName}.cs",
                // "HZY.Repository.DbSet" => ,
                "HZY.Services.Admin" => $"{genFormDto.TableName}Service.cs",
                "HZY.Controllers.Admin" => $"{genFormDto.TableName}Controller.cs",
                "Index.vue" => $"Index.vue",
                "Info.vue" => $"Info.vue",
                "Service.js" => $"{genFormDto.TableName.FirstCharToLower()}Service.js",
                _ => string.Empty
            };
        }


        #endregion



    }
}
