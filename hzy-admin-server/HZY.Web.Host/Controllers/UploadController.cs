using System.Linq;
using HZY.Infrastructure;
using HZY.Infrastructure.ApiResultManage;
using HZY.Infrastructure.Files;
using HZY.Infrastructure.SerilogUtil;
using HZY.Managers.Upload;
using HZY.Models.VO.Upload;
using Microsoft.AspNetCore.Mvc;
using static FreeSql.Internal.GlobalFilter;

namespace HZY.Web.Host.Controllers;

/// <summary>
/// 上传文件控制器
/// </summary>
[Route("api/[controller]")]
[ApiExplorerSettings(GroupName = nameof(ApiVersions.Public))]
public class UploadController : ControllerBase
{
    private readonly IUploadManager _uploadService;
    private readonly IFileManager fileManager;

    public UploadController(IUploadManager uploadService, IFileManager fileManager)
    {
        _uploadService = uploadService;
        this.fileManager = fileManager;
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

    /// <summary>
    /// 上传文件 只能上传 png和jpg 格式
    /// </summary>
    /// <param name="file"></param>
    /// <returns></returns>
    [Route("UploadPngAndJpg")]
    [HttpPost]
    public async Task<string> UploadPngAndJpgAsync(IFormFile file)
    {
        var result = string.Empty;
        await fileManager.AddSaveFolder("图片")          // 设置保存文件位置为 wwwroot目录下 配置文件配置路径下 图片路径
                    .ResetFileExtensions()               // 清空已允许的上传格式
                    .AddFileExtensions(".png", ".jpg")   // 追加允许的上传格式
                    .AddMaxLength("2MB")                 // 配置允许的上传大小
                    .BuildFileManagerContext()           // 构建上传上下文
                    .FileUploadAsync(file)               // 上传文件
                    .Success(info =>
                    {
                        LogUtil.Log.Information("上传成功");
                        result = info.FileRoot;
                    })
                    .Exists(info =>
                    {
                        LogUtil.Log.Information("上传文件重复");
                        result = info.FileRoot;
                    })
                    .Error(info =>
                    {
                        LogUtil.Log.Error(info.Exception, "上传文件错误");
                        if (info.State == FileContextStates.MaxLimit)
                        {
                            MessageBox.Show("文件长度超限");
                        }
                        else if (info.State == FileContextStates.NoneExtensions)
                        {
                            MessageBox.Show("不支持的文件类型");
                        }
                        else if (info.State == FileContextStates.NoneFile)
                        {
                            MessageBox.Show("上传文件为空");
                        }
                        else
                        {
                            MessageBox.Show(info.Exception.Message);
                        }
                    });

        return result;
    }
}