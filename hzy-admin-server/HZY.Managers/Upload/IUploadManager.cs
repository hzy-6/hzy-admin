using HzyScanDiService;
using Microsoft.AspNetCore.Http;

namespace HZY.Managers.Upload;

public interface IUploadManager : ITransientDependency
{
    string HandleUploadFile(IFormFile iFormFile, params string[] format);

    string HandleUploadImageFile(IFormFile iFormFile, string folder = "files");
}
