using System;
using System.IO;
using System.Linq;
using HZY.Framework;
using HZY.Toolkit.Attributes;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;

namespace HZY.Admin.Services.Framework
{
    /// <summary>
    /// 上传文件服务
    /// </summary>
    [AppService]
    public class UploadService
    {
        private readonly string _webRootPath;

        public UploadService(IWebHostEnvironment webHostEnvironment)
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
        protected virtual string HandleUploadFile(IFormFile formFile, string folder, params string[] format)
        {
            var extensionName = Path.GetExtension(formFile.FileName)?.ToLower().Trim(); //获取后缀名

            if (format != null && format.Length > 0 && !format.ToList().Contains(extensionName.ToLower()))
            {
                throw new MessageBox("请上传后缀名为：" + string.Join("、", format) + " 格式的文件");
            }

            if (string.IsNullOrWhiteSpace(folder)) folder = "files";

            var path = $"/upload/{folder}";

            if (!Directory.Exists(this._webRootPath + path))
            {
                Directory.CreateDirectory(this._webRootPath + path);
            }

            path += $"/{DateTime.Now:yyyyMMdd}";

            if (!Directory.Exists(this._webRootPath + path))
            {
                Directory.CreateDirectory(this._webRootPath + path);
            }

            path += $"/time_{DateTime.Now:HHmmss}_old_name_{formFile.FileName}";

            // 创建新文件
            using var fs = File.Create(this._webRootPath + path);
            formFile.CopyTo(fs);
            // 清空缓冲区数据
            fs.Flush();

            return path;
        }

        /// <summary>
        /// 上传文件
        /// </summary>
        /// <param name="iFormFile"></param>
        /// <param name="format"></param>
        /// <returns></returns>
        public virtual string HandleUploadFile(IFormFile iFormFile, params string[] format)
            => this.HandleUploadFile(iFormFile, "files", format);

        /// <summary>
        /// 上传图片
        /// </summary>
        /// <param name="iFormFile"></param>
        /// <param name="folder"></param>
        /// <returns></returns>
        public virtual string HandleUploadImageFile(IFormFile iFormFile, string folder = "files")
            => this.HandleUploadFile(iFormFile, folder, ".jpg", ".jpeg", ".png", ".gif", ".jfif");
    }
}