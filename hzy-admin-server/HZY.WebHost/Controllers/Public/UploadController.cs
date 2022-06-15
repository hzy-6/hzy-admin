using HZY.Domain.Services.Upload;
using HZY.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using System.Linq;

namespace HZY.WebHost.Controllers.Public;

/// <summary>
/// 上传文件控制器
/// </summary>
[Route("api/[controller]")]
[ApiExplorerSettings(GroupName = nameof(ApiVersions.Public))]
public class UploadController : ControllerBase
{
    private readonly IUploadDomainService _uploadService;

    public UploadController(IUploadDomainService uploadService)
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