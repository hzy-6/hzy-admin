using System.Threading.Tasks;
using HZY.Admin.Services.Framework;
using Microsoft.AspNetCore.Mvc;
using HZY.Admin.Services.Dto;

namespace HZY.Admin.Controllers.Framework
{
    public class ChangePasswordController : AdminBaseController<SysUserService>
    {
        public ChangePasswordController(SysUserService defaultService) : base(defaultService)
        {
        }

        #region 页面 Views

        [HttpGet(nameof(Index))]
        public IActionResult Index() => View();

        #endregion

        /// <summary>
        /// 更新密码
        /// </summary>
        /// <param name="form"></param>
        /// <returns></returns>
        [HttpPost("SaveForm")]
        public async Task<int> SaveFormAsync([FromBody] ChangePasswordDto form)
            => await this.DefaultService.ChangePasswordAsync(form.OldPassword, form.NewPassword);
    }
}