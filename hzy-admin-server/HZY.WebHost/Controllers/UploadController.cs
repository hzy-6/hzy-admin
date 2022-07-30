using HZY.Managers.Upload;
using HZY.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using System.Linq;
using HZY.Models.VO.Upload;
using static FreeSql.Internal.GlobalFilter;

namespace HZY.WebHost.Controllers;

/// <summary>
/// 上传文件控制器
/// </summary>
[Route("api/[controller]")]
[ApiExplorerSettings(GroupName = nameof(ApiVersions.Public))]
public class UploadController : ControllerBase
{
    private readonly IUploadManager _uploadService;

    public UploadController(IUploadManager uploadService)
    {
        _uploadService = uploadService;
    }

    /// <summary>
    /// 上传图片 针对富文本编辑器
    /// </summary>
    /// <returns></returns>
    [Route("Images")]
    [HttpPost]
    public JsonResult Images()
    {
        var files = Request.Form.Files.Where(w => w.Name.Contains("editorFileImages")).ToList();
        var paths = files.Select(item => _uploadService.HandleUploadFile(item)).ToList();

        return new JsonResult(new
        {
            errno = 0,
            data = paths
        });
    }

    /// <summary>
    /// 上传文件
    /// </summary>
    /// <param name="file"></param>
    /// <returns></returns>
    [Route("UploadFile")]
    [HttpPost]
    public UploadResultVO Upload(IFormFile file)
    {
        //IFormFileCollection
        //var file1 = Request.Form.Files.Where(w => w.Name == "file").FirstOrDefault();
        var result = _uploadService.HandleUploadFile(file);
        //result.Url = AppConfiguration.Url + result.Url;
        return result;
    }





}