using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using HZY.Repository;
using HZY.Toolkit;
using Microsoft.AspNetCore.Hosting;
using HZY.Toolkit.Razor;
using HZY.Repository.Entity;
using HZY.Admin.Model;

namespace HZY.Admin.Services
{
    /// <summary>
    /// 代码生成 服务
    /// </summary>
    public class HzyAdminSpaCodeGenerationService : FrameworkBaseService<AppTableInfoRepository>
    {
        private readonly string _webRootPath;
        private const string TemplateRootPath = "/wwwroot/code_generation/template";
        private const string CodesRootPath = "/code_generation/codes";
        private const string ZipRootPath = "/code_generation/zip";
        private static List<AppTableInfo> _appTableInfos;
        private readonly IRazorViewRender _razorViewRender;

        public HzyAdminSpaCodeGenerationService(AppTableInfoRepository repository,
            IRazorViewRender razorViewRender,
            IWebHostEnvironment webHostEnvironment) : base(
            repository)
        {
            _razorViewRender = razorViewRender;
            this._webRootPath = webHostEnvironment.WebRootPath;
        }

        /// <summary>
        /// 获取模板根地址
        /// </summary>
        /// <returns></returns>
        public string GetTemplateRootPath() => TemplateRootPath;
        /// <summary>
        /// 获取代码生成根地址
        /// </summary>
        /// <returns></returns>
        public string GetCodesRootPath() => CodesRootPath;
        /// <summary>
        /// 获取代码文件压缩文件根地址
        /// </summary>
        /// <returns></returns>
        public string GetZipRootPath() => ZipRootPath;

        /// <summary>
        /// 代码创建时初始化 表数据
        /// </summary>
        /// <returns></returns>
        public async Task InitializationAsync()
            => _appTableInfos = await this.Repository.FindAppTableInfosAsync();

        /// <summary>
        /// 查询所有表信息
        /// </summary>
        /// <returns></returns>
        public List<AppTableInfo> FindAppTableInfos() => _appTableInfos;

        /// <summary>
        /// 查询所有表名称
        /// </summary>
        /// <returns></returns>
        public List<string> FindTableNames()
            => _appTableInfos.Select(w => w.TabName).Distinct().ToList();

        /// <summary>
        /// 根据表名查询所属字段
        /// </summary>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public List<AppTableInfo> FindAppTableInfosByTableName(string tableName)
            => _appTableInfos.Where(w => w.TabName == tableName).ToList();

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
        /// 创建 Model 代码
        /// </summary>
        /// <returns></returns>
        private async Task<string> CreateModelByTableNameAsync(string tableName)
        {
            var path = $"{TemplateRootPath}/HZY.Repository.Domain.cshtml";
            var appTableInfos = _appTableInfos.Where(w => w.TabName == tableName).ToList();
            var codeGenerationModel = new CodeGenerationModel(tableName, appTableInfos);
            var codeString = await this._razorViewRender.RenderAsync(path, codeGenerationModel);
            return ClearSymbol(codeString);
        }
        /// <summary>
        /// Repository
        /// </summary>
        /// <returns></returns>
        private async Task<string> CreateRepositoryByTableNameAsync(string tableName)
        {
            var path = $"{TemplateRootPath}/HZY.Repository.cshtml";
            var appTableInfos = _appTableInfos.Where(w => w.TabName == tableName).ToList();
            var codeGenerationModel = new CodeGenerationModel(tableName, appTableInfos);
            var codeString = await this._razorViewRender.RenderAsync(path, codeGenerationModel);
            return ClearSymbol(codeString);
        }

        /// <summary>
        /// Service
        /// </summary>
        /// <returns></returns>
        private async Task<string> CreateServiceByTableNameAsync(string tableName)
        {
            var path = $"{TemplateRootPath}/HZY.Services.cshtml";
            var appTableInfos = _appTableInfos.Where(w => w.TabName == tableName).ToList();
            var codeGenerationModel = new CodeGenerationModel(tableName, appTableInfos);
            var codeString = await this._razorViewRender.RenderAsync(path, codeGenerationModel);
            return ClearSymbol(codeString);
        }

        /// <summary>
        /// Controller
        /// </summary>
        /// <returns></returns>
        private async Task<string> CreateControllerByTableNameAsync(string tableName)
        {
            var path = $"{TemplateRootPath}/HZY.Controller.cshtml";
            var appTableInfos = _appTableInfos.Where(w => w.TabName == tableName).ToList();
            var codeGenerationModel = new CodeGenerationModel(tableName, appTableInfos);
            var codeString = await this._razorViewRender.RenderAsync(path, codeGenerationModel);
            return ClearSymbol(codeString);
        }

        /// <summary>
        /// Index
        /// </summary>
        /// <returns></returns>
        private async Task<string> CreateClientIndexByTableNameAsync(string tableName)
        {
            var path = $"{TemplateRootPath}/HZY.Admin.Index.cshtml";
            var appTableInfos = _appTableInfos.Where(w => w.TabName == tableName).ToList();
            var codeGenerationModel = new CodeGenerationModel(tableName, appTableInfos);
            var codeString = await this._razorViewRender.RenderAsync(path, codeGenerationModel);
            return ClearSymbol(codeString);
        }
        /// <summary>
        /// Info
        /// </summary>
        /// <returns></returns>
        private async Task<string> CreateClientInfoByTableNameAsync(string tableName)
        {
            var path = $"{TemplateRootPath}/HZY.Admin.Info.cshtml";
            var appTableInfos = _appTableInfos.Where(w => w.TabName == tableName).ToList();
            var codeGenerationModel = new CodeGenerationModel(tableName, appTableInfos);
            var codeString = await this._razorViewRender.RenderAsync(path, codeGenerationModel);
            return ClearSymbol(codeString);
        }

        /// <summary>
        /// 获取代码
        /// </summary>
        /// <param name="type"></param>
        /// <param name="tableName"></param>
        /// <returns></returns>
        public async Task<string> FindCodeByTypeAndTableNameAsync(string type, string tableName)
        {
            return type switch
            {
                "HZY.Repository.Domain" => await this.CreateModelByTableNameAsync(tableName),
                "HZY.Repository" => await this.CreateRepositoryByTableNameAsync(tableName),
                "HZY.Services" => await this.CreateServiceByTableNameAsync(tableName),
                "HZY.Controller" => await this.CreateControllerByTableNameAsync(tableName),
                "HZY.Admin.Index.cshtml" => await this.CreateClientIndexByTableNameAsync(tableName),
                "HZY.Admin.Info.cshtml" => await this.CreateClientInfoByTableNameAsync(tableName),
                _ => string.Empty
            };
        }

        /// <summary>
        /// 获取代码文件名称
        /// </summary>
        /// <param name="type"></param>
        /// <param name="tableName"></param>
        /// <returns></returns>
        private string FindCodeFileClassName(string type, string tableName)
        {
            return type switch
            {
                "HZY.Repository.Domain" => $"{tableName}.cs",
                "HZY.Repository" => $"{tableName}Repository.cs",
                "HZY.Services" => $"{tableName}Service.cs",
                "HZY.Controller" => $"{tableName}Controller.cs",
                "HZY.Admin.Index.cshtml" => $"Index.cshtml",
                "HZY.Admin.Info.cshtml" => $"Info.vue",
                _ => string.Empty
            };
        }

        /// <summary>
        /// 获取下载代码信息
        /// </summary>
        /// <param name="type"></param>
        /// <param name="tableName"></param>
        /// <param name="code"></param>
        /// <returns></returns>
        public (byte[] codeBytes, string className, string contentType) Download(string type, string tableName,
            string code)
        {
            var className = this.FindCodeFileClassName(type, tableName);

            var contentType = Tools.GetFileContentType[".cs"];
            if (className == "Index.cshtml" || className == "Info.cshtml")
            {
                contentType = Tools.GetFileContentType[".txt"];
            }

            return (Encoding.UTF8.GetBytes(code), className, contentType);
        }

        /// <summary>
        /// 创建代码文件
        /// </summary>
        /// <param name="type"></param>
        /// <param name="tableName"></param>
        /// <returns></returns>
        private async Task<string> CreateCodeFilesAsync(string type, string tableName)
        {
            var path = $"{this._webRootPath}{CodesRootPath}";

            if (type == "HZY.Admin.Index.cshtml" || type == "HZY.Admin.Info.cshtml")
            {
                path += $"/Views";
                if (!Directory.Exists(path)) Directory.CreateDirectory(path);
                path += $"/{tableName}";
                if (!Directory.Exists(path)) Directory.CreateDirectory(path);
                //Index
                var codeString = await this.CreateClientIndexByTableNameAsync(tableName);
                await File.WriteAllTextAsync($"{path}/Index.cshtml", codeString, Encoding.UTF8);
                //Info
                codeString = await this.CreateClientInfoByTableNameAsync(tableName);
                await File.WriteAllTextAsync($"{path}/Info.cshtml", codeString, Encoding.UTF8);
                return path;
            }

            //
            path = $"{this._webRootPath}{CodesRootPath}/{type}";
            var className = this.FindCodeFileClassName(type, tableName);
            var code = await this.FindCodeByTypeAndTableNameAsync(type, tableName);
            //
            if (!Directory.Exists(path)) Directory.CreateDirectory(path);
            await File.WriteAllTextAsync($"{path}/{className}", code, Encoding.UTF8);
            return path;
        }

        /// <summary>
        /// 创建所有代码文件
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public async Task<bool> CreateAllCodeFilesAsync(string type)
        {
            var tableNames = this.FindTableNames();

            foreach (var item in tableNames)
            {
                await this.CreateCodeFilesAsync(type, item);
                await Task.Delay(50);
            }

            return true;
        }
    }
}