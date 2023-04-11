namespace HZY.Shared.Upload;

public interface IUploadManager : ITransientDependency
{
    UploadResultVO HandleUploadFile(IFormFile iFormFile, params string[] format);

    UploadResultVO HandleUploadImageFile(IFormFile iFormFile, string folder = "files");
}
