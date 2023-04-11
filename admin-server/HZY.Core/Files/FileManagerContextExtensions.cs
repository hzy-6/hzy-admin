namespace HZY.Core.Files;

public static class FileManagerContextExtensions
{

    public static async Task<FileContextInfo> FileUploadAsync(this FileManagerContext context, IFormFile formFile)
    {
        var fileContextInfo = new FileContextInfo();
        try
        {
            if (formFile == null)
            {
                fileContextInfo.State = FileContextStates.NoneFile;
                fileContextInfo.Exception = new Exception("文件不能为空!");
                return fileContextInfo;
            }
            fileContextInfo.OldName = formFile.FileName;

            var fileExt = Path.GetExtension(formFile.FileName);
            if (!context.FileExtensions.Contains(fileExt.ToLower()))
            {
                fileContextInfo.State = FileContextStates.NoneExtensions;
                fileContextInfo.Exception = new Exception("不支持上传的文件格式!");
                return fileContextInfo;
            }

            if (formFile.Length > context.MaxFileSizeLimit)
            {
                fileContextInfo.State = FileContextStates.MaxLimit;
                fileContextInfo.Exception = new Exception("上传文件长度超限!");
                return fileContextInfo;
            }

            var hash = SHA1.Create();
            var hashBytes = await hash.ComputeHashAsync(formFile.OpenReadStream());
            var saveName = BitConverter.ToString(hashBytes).Replace("-", "") + fileExt;
            var fullPath = context.FileDir + saveName;

            FileInfo fileInfo = new FileInfo(fullPath);
            if (!fileInfo.Exists)
            {
                using (FileStream fs = File.Create(fullPath))
                {
                    await formFile.CopyToAsync(fs);
                    fs.Flush();
                }
                fileContextInfo.State = FileContextStates.Ok;
            }
            else
            {
                fileContextInfo.State = FileContextStates.FileExists;
            }

            fileContextInfo.FileName = saveName;
            fileContextInfo.FullName = fullPath;
            fileContextInfo.FileRoot = context.ServerUrl + saveName;
        }
        catch (Exception ex)
        {
            fileContextInfo.State = FileContextStates.ErrorException;
            fileContextInfo.Exception = ex;
            throw fileContextInfo.Exception;
        }

        return fileContextInfo;
    }

    public static async Task<FileContextInfo> Success(this Task<FileContextInfo> contextInfo, Action<FileContextInfo> actionInfo)
    {
        var fileContextInfo = await contextInfo;
        if (fileContextInfo.State == FileContextStates.Ok)
        {
            actionInfo(fileContextInfo);
        }
        return fileContextInfo;
    }

    public static async Task<FileContextInfo> Exists(this Task<FileContextInfo> contextInfo, Action<FileContextInfo> actionInfo)
    {
        var fileContextInfo = await contextInfo;
        if (fileContextInfo.State == FileContextStates.FileExists)
        {
            actionInfo(fileContextInfo);
        }
        return fileContextInfo;
    }

    public static async Task<FileContextInfo> Error(this Task<FileContextInfo> contextInfo, Action<FileContextInfo> actionInfo)
    {
        var fileContextInfo = new FileContextInfo();
        try
        {
            fileContextInfo = await contextInfo;
        }
        catch (Exception ex)
        {
            fileContextInfo.State = FileContextStates.ErrorException;
            fileContextInfo.Exception = ex;
            actionInfo(fileContextInfo);
            return fileContextInfo;
        }

        if (fileContextInfo.State != FileContextStates.Ok && fileContextInfo.State != FileContextStates.FileExists)
        {
            actionInfo(fileContextInfo);
        }
        return fileContextInfo;
    }
}