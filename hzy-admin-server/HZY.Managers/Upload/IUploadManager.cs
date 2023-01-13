﻿using HZY.Models.VO.Upload;
using HZY.Framework.AutoRegisterIOC;
using Microsoft.AspNetCore.Http;

namespace HZY.Managers.Upload;

public interface IUploadManager : ITransientDependency
{
    UploadResultVO HandleUploadFile(IFormFile iFormFile, params string[] format);

    UploadResultVO HandleUploadImageFile(IFormFile iFormFile, string folder = "files");
}
