namespace HZY.Api.Admin.ApplicationServices.DevelopmentTools.LowCode.Impl;

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
    private readonly string templateServiceJs = "tempClientService.cshtml";
    private readonly string templateIndex = "tempClientIndex.cshtml";
    private readonly string templateInfo = "tempClientInfo.cshtml";

    private readonly DatabaseTableService _databaseTableService;
    private readonly IRazorViewRender _razorViewRender;

    /// <summary>
    /// 
    /// </summary>
    /// <param name="databaseTableService"></param>
    /// <param name="razorViewRender"></param>
    /// <param name="webHostEnvironment"></param>
    /// <param name="appConfiguration"></param>
    public CodeGenerationService(DatabaseTableService databaseTableService,
        IRazorViewRender razorViewRender,
        IWebHostEnvironment webHostEnvironment,
        AppConfiguration appConfiguration)
    {
        _databaseTableService = databaseTableService;
        _razorViewRender = razorViewRender;
        _webRootPath = webHostEnvironment.WebRootPath;
    }

    /// <summary>
    /// 生成上下文集合
    /// </summary>
    /// <returns></returns>
    public PagingView GetGenContextDtos(int page, int size, GenFormDto search)
    {
        var PagingView = new PagingView(page, size);
        var result = new List<Dictionary<string, object>>();

        var query = _databaseTableService.GetAllTablesByCache()
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

            result.Add(dic);
        }

        PagingView.Total = query.LongCount();
        PagingView.Page = page;
        PagingView.Size = size;
        PagingView.DataSource = result;
        PagingView.PageCount = PagingView.Total / size;
        return PagingView;
    }

    /// <summary>
    /// 获取所有表集合信息
    /// </summary>
    /// <returns></returns>
    public GenDbTableDto GetGenContextDtoByTableName(string tableName)
    {
        var genDbTableDto = _databaseTableService.GetAllTables().FirstOrDefault(w => w.TableName == tableName);

        FillPathByLowCodeTable(genDbTableDto);

        return genDbTableDto;
    }

    /// <summary>
    /// 根据 lowCodeTable 填充路径
    /// </summary>
    /// <returns></returns>
    public LowCodeTable FillPathByLowCodeTable(LowCodeTable lowCodeTable)
    {
        var rootPath = App.WebApplication.Environment.ContentRootPath.Replace("\\" + App.WebApplication.Environment.ApplicationName, "");

        if (string.IsNullOrWhiteSpace(lowCodeTable.ModelPath))
        {
            lowCodeTable.ModelPath = rootPath + $"\\{typeof(RepositoryEFAdminStartup).Namespace}\\Entities\\Apps";
        }

        if (string.IsNullOrWhiteSpace(lowCodeTable.ServicePath))
        {
            lowCodeTable.ServicePath = App.WebApplication.Environment.ContentRootPath + "\\ApplicationServices\\Apps";
        }

        if (string.IsNullOrWhiteSpace(lowCodeTable.ControllerPath))
        {
            lowCodeTable.ControllerPath = App.WebApplication.Environment.ContentRootPath + "\\Controllers\\Apps";
        }

        rootPath = rootPath.Substring(0, rootPath.LastIndexOf("\\"));
        if (string.IsNullOrWhiteSpace(lowCodeTable.ClientIndexPath))
        {
            lowCodeTable.ClientIndexPath = rootPath + "\\microservices-client\\src\\views\\Apps";
        }

        if (string.IsNullOrWhiteSpace(lowCodeTable.ClientInfoPath))
        {
            lowCodeTable.ClientInfoPath = rootPath + "\\microservices-client\\src\\views\\Apps";
        }

        if (string.IsNullOrWhiteSpace(lowCodeTable.ClientServicePath))
        {
            lowCodeTable.ClientServicePath = rootPath + "\\microservices-client\\src\\services\\Apps";
        }

        return lowCodeTable;
    }

    /// <summary>
    /// 获取代码生成上下文
    /// </summary>
    /// <param name="genFormDto"></param>
    /// <returns></returns>
    public GenDbTableDto GetGenContextDto(GenFormDto genFormDto)
    {
        var tableName = genFormDto.TableName;

        var tableInfo = GetGenContextDtoByTableName(tableName);

        if (tableInfo == null) return null;
        tableInfo.Namespace = Tools.GetNamespacePrefix<CodeGenerationService>();
        return tableInfo;
    }

    /// <summary>
    /// 生成model
    /// </summary>
    /// <param name="genFormDto"></param>
    /// <returns></returns>
    public async Task<string> GenModelAsync(GenFormDto genFormDto)
    {
        var context = GetGenContextDto(genFormDto);

        return ClearSymbol(await _razorViewRender.RenderAsync(templateRootPath + templateModel, context));
    }

    /// <summary>
    /// 生成service
    /// </summary>
    /// <param name="genFormDto"></param>
    /// <returns></returns>
    public async Task<string> GenServiceAsync(GenFormDto genFormDto)
    {
        var context = GetGenContextDto(genFormDto);

        return ClearSymbol(await _razorViewRender.RenderAsync(templateRootPath + templateService, context));
    }

    /// <summary>
    /// 生成controller
    /// </summary>
    /// <param name="genFormDto"></param>
    /// <returns></returns>
    public async Task<string> GenControllerAsync(GenFormDto genFormDto)
    {
        var context = GetGenContextDto(genFormDto);

        return ClearSymbol(await _razorViewRender.RenderAsync(templateRootPath + templateController, context));
    }

    /// <summary>
    /// 生成service js
    /// </summary>
    /// <param name="genFormDto"></param>
    /// <returns></returns>
    public async Task<string> GenServiceJsAsync(GenFormDto genFormDto)
    {
        var context = GetGenContextDto(genFormDto);

        return ClearSymbol(await _razorViewRender.RenderAsync(templateRootPath + templateServiceJs, context));
    }

    /// <summary>
    /// 生成 index vue
    /// </summary>
    /// <param name="genFormDto"></param>
    /// <returns></returns>
    public async Task<string> GenIndexAsync(GenFormDto genFormDto)
    {
        var context = GetGenContextDto(genFormDto);

        return ClearSymbol(await _razorViewRender.RenderAsync(templateRootPath + templateIndex, context));
    }

    /// <summary>
    /// 生成 info vue
    /// </summary>
    /// <param name="genFormDto"></param>
    /// <returns></returns>
    public async Task<string> GenInfoAsync(GenFormDto genFormDto)
    {
        var context = GetGenContextDto(genFormDto);

        return ClearSymbol(await _razorViewRender.RenderAsync(templateRootPath + templateInfo, context));
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
            "HZY.Models" => await GenModelAsync(genFormDto),
            //"HZY.Repository.DbSet" => await this.CreateRepositoryDbSetAsync(),
            "HZY.Services.Admin" => await GenServiceAsync(genFormDto),
            "HZY.Controllers.Admin" => await GenControllerAsync(genFormDto),
            "Client.Index" => await GenIndexAsync(genFormDto),
            "Client.Info" => await GenInfoAsync(genFormDto),
            "Client.Service" => await GenServiceJsAsync(genFormDto),
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
        var tables = _databaseTableService.GetAllTablesByCache();

        foreach (var item in tables)
        {
            genFormDto.TableName = item.TableName;
            await CreateCodeFilesAsync(genFormDto);
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
        var fileName = FindCodeFileClassName(genFormDto);

        var contentType = Tools.GetFileContentType[".cs"];
        if (fileName == "Index.vue" || fileName == "Info.vue")
        {
            contentType = Tools.GetFileContentType[".txt"];
        }

        return (Encoding.UTF8.GetBytes(await GetCodeByTypeAndTableNameAsync(genFormDto)), contentType, fileName);
    }

    /// <summary>
    /// 根据类型下载所有代码
    /// </summary>
    /// <param name="genFormDto"></param>
    /// <returns></returns>
    public async Task<(byte[] codeBytes, string contentType, string fileName)> DownloadAllAsync(GenFormDto genFormDto)
    {
        var isViews = genFormDto.Type == "Client.Index" || genFormDto.Type == "Client.Info";
        var success = await CreateAllCodeFilesAsync(genFormDto);

        if (!success) LogUtil.Log.Warning("无法下载,代码创建失败!");

        string path;
        string zipPath;

        if (isViews)
        {
            path = $"{_webRootPath}{codesRootPath}/pages";
            zipPath = $"{_webRootPath}{zipRootPath}";
            if (!Directory.Exists(path))
            {
                Directory.CreateDirectory(path);
            }

            if (!Directory.Exists(zipPath))
            {
                Directory.CreateDirectory(zipPath);
            }

            zipPath += "/pages.zip";
        }
        else
        {
            path = $"{_webRootPath}{codesRootPath}/{genFormDto.Type}";
            zipPath = $"{_webRootPath}{zipRootPath}";
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
        var bytes = await File.ReadAllBytesAsync(zipPath);

        //删除文件
        if (File.Exists(zipPath)) File.Delete(zipPath);
        if (Directory.Exists(path)) Directory.Delete(path, true);

        return (bytes, Tools.GetFileContentType[".zip"], $"{(isViews ? "pages" : genFormDto.Type)}.zip");
    }

    /// <summary>
    /// 创建数据库字典文件
    /// </summary>
    /// <returns></returns>
    public (byte[] excel, string dataBase) CreateDataDictionary()
    {
        var tables = _databaseTableService.GetAllTablesByCache();
        var workbook = new XSSFWorkbook();
        var dataBaseName = _databaseTableService.GetDatabaseName();

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
                //row.CreateCell(0).SetCellValue(item.Schema);
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

    /// <summary>
    /// 自动导入文件到项目
    /// </summary>
    /// <param name="genFormDto"></param>
    /// <returns></returns>
    public async Task AutoImprotProjectAsync(GenFormDto genFormDto)
    {
        var context = GetGenContextDto(genFormDto);
        if (context == null)
        {
            MessageBox.Show("找不到此数据表!");
        }

        //获取表路径信息
        var tables = _databaseTableService.GetAllTablesByCache();
        var tableInfo = tables.FirstOrDefault(w => w.TableName == genFormDto.TableName);

        var fileTyps = Enum.GetValues<FileTypeEnum>();

        foreach (var fileType in fileTyps)
        {
            var (filePath, oldName, replaceName) = GetFileAbsolutelyPath(genFormDto.TableName, fileType);
            await SaveToFileAsync(genFormDto.TableName, fileType, filePath, oldName, replaceName);
        }
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
                .Trim();
    }

    /// <summary>
    /// 创建代码文件
    /// </summary>
    /// <param name="genFormDto"></param>
    /// <returns></returns>
    private async Task<string> CreateCodeFilesAsync(GenFormDto genFormDto)
    {
        var path = $"{_webRootPath}{codesRootPath}";

        if (genFormDto.Type == "Client.Index" || genFormDto.Type == "Client.Info")
        {
            path += $"/pages";
            if (!Directory.Exists(path)) Directory.CreateDirectory(path);
            path += $"/{genFormDto.TableName.FirstCharToLower()}";
            if (!Directory.Exists(path)) Directory.CreateDirectory(path);
            //Index
            var codeString = await GenIndexAsync(genFormDto);
            await File.WriteAllTextAsync($"{path}/Index.vue", codeString, Encoding.UTF8);
            //Info
            codeString = await GenInfoAsync(genFormDto);
            await File.WriteAllTextAsync($"{path}/Info.vue", codeString, Encoding.UTF8);
            return path;
        }

        //
        path = $"{_webRootPath}{codesRootPath}/{genFormDto.Type}";
        var className = FindCodeFileClassName(genFormDto);
        var code = await GetCodeByTypeAndTableNameAsync(genFormDto);
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
        var tableName = genFormDto.TableName.LineToHump();
        return genFormDto.Type switch
        {
            "HZY.Models" => $"{tableName}.cs",
            // "HZY.Repository.DbSet" => ,
            "HZY.Services.Admin" => $"{tableName}Service.cs",
            "HZY.Controllers.Admin" => $"{tableName}Controller.cs",
            "Client.Index" => $"Index.vue",
            "Client.Info" => $"Info.vue",
            "Client.Service" => $"{tableName}Service.ts",
            _ => string.Empty
        };
    }

    /// <summary>
    /// 获取要生成文件的绝对路径
    /// </summary>
    /// <param name="tableName"></param>
    /// <param name="type"></param>
    /// <returns></returns>
    private (string, string, string) GetFileAbsolutelyPath(string tableName, FileTypeEnum type)
    {
        var replaceName = string.Empty;
        var oldFileName = string.Empty;
        var dto = new GenFormDto() { TableName = tableName, Type = GetEnumDescription(type) };
        var humpTableName = tableName.LineToHump();
        var fileName = FindCodeFileClassName(dto);
        var path = string.Empty;
        //获取表路径信息
        var tableInfo = GetGenContextDtoByTableName(tableName);
        switch (type)
        {
            case FileTypeEnum.Model:
                path = tableInfo.ModelPath + $"/{humpTableName}s";
                break;
            case FileTypeEnum.Service:
                path = tableInfo.ServicePath + $"/{humpTableName}s";
                break;
            case FileTypeEnum.Controller:
                path = tableInfo.ControllerPath + $"/{humpTableName}s";
                break;
            case FileTypeEnum.ClientIndex:
                path = tableInfo.ClientIndexPath + $"/{tableName}s";
                break;
            case FileTypeEnum.ClientInfo:
                path = tableInfo.ClientInfoPath + $"/{tableName}s";
                break;
            case FileTypeEnum.ClientService:
                path = tableInfo.ClientServicePath + $"/{tableName}s";
                break;
        }

        var fileDirPath = Path.Combine(path);
        if (!Directory.Exists(fileDirPath))
        {
            Directory.CreateDirectory(fileDirPath);
        }

        // 组合成完整路劲
        var filePath = $"{fileDirPath}/{fileName}";
        // 判断是否覆盖文件
        if (!(tableInfo.IsCover ?? false))
        {
            // 如果文件已存在 加尾缀 重新创建文件夹
            if (File.Exists(filePath))
            {
                oldFileName = FindCodeFileClassName(dto);
                replaceName = $"{oldFileName}{DateTime.Now.ToString("yyyyMMddHHmmss")}";
                filePath = $"{fileDirPath}/{replaceName}";
            }
        }

        return (filePath, oldFileName, replaceName);
    }

    /// <summary>
    /// 保存到文件
    /// </summary>
    /// <param name="tableName"></param>
    /// <param name="type"></param>
    /// <param name="filePath"></param>
    /// <param name="oldName"></param>
    /// <param name="replaceName"></param>
    /// <returns></returns>
    private async Task SaveToFileAsync(string tableName, FileTypeEnum type, string filePath, string oldName, string replaceName)
    {
        var dto = new GenFormDto() { TableName = tableName, Type = GetEnumDescription(type) };
        var codeString = await GetCodeByTypeAndTableNameAsync(dto);
        if (!string.IsNullOrWhiteSpace(replaceName) && !string.IsNullOrWhiteSpace(oldName))
        {
            if (type == FileTypeEnum.Model || type == FileTypeEnum.Service || type == FileTypeEnum.Controller)
            {
                codeString = codeString.Replace(oldName, replaceName);
            }
        }
        await Task.Delay(500);
        await File.WriteAllTextAsync(filePath, codeString, Encoding.UTF8);
    }

    /// <summary>
    /// 获取枚举上的描述特性
    /// </summary>
    /// <param name="type"></param>
    /// <returns></returns>
    private string GetEnumDescription(FileTypeEnum type)
    {
        return type.GetType().GetField(Enum.GetName(type)).GetCustomAttribute<DescriptionAttribute>().Description;
    }
    #endregion
}

public enum FileTypeEnum
{
    [Description("HZY.Models")]
    Model,
    [Description("HZY.Services.Admin")]
    Service,
    [Description("HZY.Controllers.Admin")]
    Controller,
    [Description("Client.Index")]
    ClientIndex,
    [Description("Client.Info")]
    ClientInfo,
    [Description("Client.Service")]
    ClientService

}
