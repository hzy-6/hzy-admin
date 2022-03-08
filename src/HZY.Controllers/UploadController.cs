using HZY.Services.Upload;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace HZY.Controllers;

/// <summary>
/// 上传文件控制器
/// </summary>
[Route("api/[controller]")]
public class UploadController : ControllerBase
{
    private readonly IUploadService _uploadService;

    public UploadController(IUploadService uploadService)
    {
        _uploadService = uploadService;
    }

    /// <summary>
    /// 上传图片
    /// </summary>
    /// <returns></returns>
    [Route("Images")]
    [HttpPost, HttpPost]
    public JsonResult Images()
    {
        var files = Request.Form.Files.Where(w => w.Name.Contains("editorFileImages")).ToList();
        var paths = files.Select(item => this._uploadService.HandleUploadFile(item)).ToList();

        return new JsonResult(new
        {
            errno = 0,
            data = paths
        });
    }
}