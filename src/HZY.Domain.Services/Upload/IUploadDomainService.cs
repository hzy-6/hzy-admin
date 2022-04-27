using HzyScanDiService.Interface;
using Microsoft.AspNetCore.Http;

namespace HZY.Domain.Services.Upload;

public interface IUploadDomainService : IDiTransient
{
    string HandleUploadFile(IFormFile iFormFile, params string[] format);

    string HandleUploadImageFile(IFormFile iFormFile, string folder = "files");
}
