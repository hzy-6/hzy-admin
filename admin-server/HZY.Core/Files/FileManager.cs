namespace HZY.Core.Files;

public class FileManager : IFileManager, ITransientDependency
{
    //private readonly AppConfiguration appConfiguration;
    private readonly IWebHostEnvironment webHostEnvironment;
    private FileManagerContext fileManagerContext;

    public FileManager(IWebHostEnvironment webHostEnvironment)
    {
        this.webHostEnvironment = webHostEnvironment;
        Init();
    }

    private void Init()
    {
        //fileManagerContext = new FileManagerContext();
        //fileManagerContext.MaxFileSizeLimit = appConfiguration.Configs.FileManager.GetMaxFileSizeLimit();
        //fileManagerContext.FileExtensions = appConfiguration.Configs.FileManager.AllowExtensions.Split("|").Select(s => s.ToLower()).ToList();
        //fileManagerContext.ServerUrl = appConfiguration.Configs.FileManager.ServerUrl;
        //fileManagerContext.FileDir = GetFilePath(appConfiguration.Configs.FileManager.DirectoryUrl);
    }

    /// <summary>
    /// 获取配置的文件路径
    /// </summary>
    /// <param name="dir"></param>
    /// <returns></returns>
    private string GetFilePath(string dir)
    {
        if (!dir.StartsWith("/") && !dir.StartsWith("\\"))
        {
            dir = "/" + dir;
        }
        if (!dir.EndsWith("/") && !dir.EndsWith("\\"))
        {
            dir = dir + "/";
        }

        return webHostEnvironment.WebRootPath + dir;
    }

    /// <summary>
    /// 设置追加目录
    /// </summary>
    /// <param name="dir"></param>
    /// <returns></returns>
    public FileManager AddSaveFolder(string dir)
    {
        if (dir.StartsWith("/") || dir.StartsWith("\\"))
        {
            dir = dir.Substring(1, dir.Length - 1);
        }
        if (!dir.EndsWith("/") && !dir.EndsWith("\\"))
        {
            dir += "/";
        }
        fileManagerContext.FileDir += dir;
        fileManagerContext.ServerUrl += dir;
        if (!Directory.Exists(fileManagerContext.FileDir))
        {
            Directory.CreateDirectory(fileManagerContext.FileDir);
        }
        return this;
    }

    /// <summary>
    /// 设置上传最大长度
    /// </summary>
    /// <param name="maxLength"></param>
    /// <returns></returns>
    public FileManager AddMaxLength(long maxLength)
    {
        fileManagerContext.MaxFileSizeLimit = maxLength;
        return this;
    }

    /// <summary>
    /// 设置上传最大长度
    /// </summary>
    /// <param name="maxLength"></param>
    /// <returns></returns>
    public FileManager AddMaxLength(string maxLength)
    {
        fileManagerContext.MaxFileSizeLimit = maxLength.ToStorageByteLength();
        return this;
    }

    /// <summary>
    /// 允许所有文件格式
    /// </summary>
    /// <returns></returns>
    public FileManager AllowAnyFileExtensions()
    {
        fileManagerContext.IsAllowAnyFile = true;
        return this;
    }

    /// <summary>
    /// 追加允许文件格式
    /// </summary>
    /// <param name="fileExtensions"></param>
    /// <returns></returns>
    public FileManager AddFileExtensions(params string[] fileExtensions)
    {
        foreach (var fileExtension in fileExtensions)
        {
            if (!fileManagerContext.FileExtensions.Contains(fileExtension.ToLower()))
            {
                fileManagerContext.FileExtensions.Add(fileExtension.ToLower());
            }
        }

        return this;
    }

    /// <summary>
    /// 重置文件格式
    /// </summary>
    /// <returns></returns>
    public FileManager ResetFileExtensions()
    {
        fileManagerContext.FileExtensions.Clear();
        return this;
    }

    /// <summary>
    /// 构建FileManagerContext
    /// </summary>
    /// <returns></returns>
    public FileManagerContext BuildFileManagerContext()
    {
        return fileManagerContext;
    }
}