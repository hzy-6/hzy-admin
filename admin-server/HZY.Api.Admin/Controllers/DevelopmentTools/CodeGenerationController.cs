namespace HZY.Api.Admin.Controllers.DevelopmentTools;

/// <summary>
/// 代码生成器控制器
/// </summary>
[ControllerDescriptor(MenuId = "31")]
public class CodeGenerationController : AdminControllerBase<ICodeGenerationService>
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
    [HttpPost("{size}/{page}")]
    public PagingView FindListAsync([FromRoute] int size, [FromRoute] int page, [FromBody] GenFormDto search)
    {
        return _defaultService.GetGenContextDtos(page, size, search);
    }

    /// <summary>
    /// 获取代码 根据 表名 和 类型
    /// </summary>
    /// <param name="genFormDto"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "获取代码")]
    [HttpPost]
    public async Task<dynamic> GetCodeAsync([FromBody] GenFormDto genFormDto)
    {
        var code = await _defaultService.GetCodeByTypeAndTableNameAsync(genFormDto);

        var lowCodeTableInfos = new List<LowCodeTableInfo>();

        if (!string.IsNullOrWhiteSpace(genFormDto.TableName))
        {
            var table = _defaultService.GetGenContextDtoByTableName(genFormDto.TableName);

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
    [HttpPost]
    public async Task DownloadAsync([FromBody] GenFormDto genFormDto)
    {
        var (codeBytes, contentType, fileName) = await _defaultService.DownloadAsync(genFormDto);
        HttpContext.DownLoadFile(codeBytes, contentType, fileName);
    }

    /// <summary>
    /// 创建代码文件
    /// </summary>
    /// <param name="genFormDto"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "创建代码文件")]
    [HttpPost]
    public async Task DownloadAllAsync([FromBody] GenFormDto genFormDto)
    {
        var (codeBytes, contentType, fileName) = await _defaultService.DownloadAllAsync(genFormDto);
        HttpContext.DownLoadFile(codeBytes, contentType, fileName);
    }

    /// <summary>
    /// 数据库字典文件
    /// </summary>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "生成数据库字典文件")]
    [HttpPost]
    public void CreateDataDictionary()
    {
        var data = _defaultService.CreateDataDictionary();
        var fileName = $"{(string.IsNullOrWhiteSpace(data.dataBase) ? "" : data.dataBase + "_")}数据库设计{DateTime.Now.ToString("yyyyMMddHHmmss")}.xlsx";

        HttpContext.DownLoadFile(data.excel, Tools.GetFileContentType[".xlsx"], fileName);

    }

    /// <summary>
    /// 生成代码并自动导入项目
    /// </summary>
    /// <param name="genFormDto"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "生成代码并自动导入项目")]
    [HttpPost]
    public async Task<bool> AutoImprotProjectAsync([FromBody] GenFormDto genFormDto)
    {
        await _defaultService.AutoImprotProjectAsync(genFormDto);
        return true;
    }
}
