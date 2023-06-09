namespace HZY.Shared.Upload.Impl;

/// <summary>
/// 上传文件服务
/// </summary>
public class UploadManagerImpl : IUploadManager
{
    private readonly string _webRootPath;

    public UploadManagerImpl(IWebHostEnvironment webHostEnvironment)
    {
        _webRootPath = webHostEnvironment.WebRootPath;
    }

    /// <summary>
    /// 上传文件 辅助函数
    /// </summary>
    /// <param name="formFile"></param>
    /// <param name="folder"></param>
    /// <param name="format"></param>
    /// <returns></returns>
    protected virtual UploadResultVO HandleUploadFile(IFormFile formFile, string folder, params string[] format)
    {
        var extensionName = Path.GetExtension(formFile.FileName)?.ToLower().Trim(); //获取后缀名

        if (format != null && format.Length > 0 && !format.ToList().Contains(extensionName.ToLower()))
        {
            throw new MessageBox("请上传后缀名为：" + string.Join("、", format) + " 格式的文件");
        }

        if (string.IsNullOrWhiteSpace(folder)) folder = "files";

        var path = $"/upload/{folder}";

        if (!Directory.Exists(_webRootPath + path))
        {
            Directory.CreateDirectory(_webRootPath + path);
        }

        path += $"/{DateTime.Now:yyyyMMdd}";

        if (!Directory.Exists(_webRootPath + path))
        {
            Directory.CreateDirectory(_webRootPath + path);
        }

        var name = $"{DateTime.Now:yyyyMMddHHmmss}_old_name_{formFile.FileName}";

        path += $"/{name}";

        // 创建新文件
        using var fs = File.Create(_webRootPath + path);
        formFile.CopyTo(fs);
        // 清空缓冲区数据
        fs.Flush();

        var result = new UploadResultVO();

        result.Status = "done";
        result.ThumbUrl = path;
        result.Url = path;
        result.Percent = 100;
        result.Uid = Guid.NewGuid();
        result.Name = name;

        return result;
    }

    /// <summary>
    /// 上传文件
    /// </summary>
    /// <param name="iFormFile"></param>
    /// <param name="format"></param>
    /// <returns></returns>
    public virtual UploadResultVO HandleUploadFile(IFormFile iFormFile, params string[] format)
        => HandleUploadFile(iFormFile, "files", format);

    /// <summary>
    /// 上传图片
    /// </summary>
    /// <param name="iFormFile"></param>
    /// <param name="folder"></param>
    /// <returns></returns>
    public virtual UploadResultVO HandleUploadImageFile(IFormFile iFormFile, string folder = "files")
        => HandleUploadFile(iFormFile, folder, ".jpg", ".jpeg", ".png", ".gif", ".jfif");




}