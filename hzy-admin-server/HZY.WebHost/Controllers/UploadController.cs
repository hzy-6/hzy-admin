using HZY.Managers.Upload;
using HZY.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

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
    /// 上传图片
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
}