using System.Linq;
using HZY.Admin.Services.Framework;
using Microsoft.AspNetCore.Mvc;

namespace HZY.Admin.Controllers.Framework
{
    /// <summary>
    /// 上传文件控制器
    /// </summary>
    [Route("[controller]")]
    public class UploadController : ControllerBase
    {
        private readonly UploadService _uploadService;

        public UploadController(UploadService uploadService)
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
}