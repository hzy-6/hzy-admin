using HZY.Domain.Services.Accounts;
using HZY.Infrastructure.Controllers;
using HZY.Infrastructure.Permission.Attributes;
using HZY.Models.DTO;
using HZY.Models.DTO.Framework;
using HZY.Models.Entities.Framework;
using HZY.Services.Admin.Framework;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace HZY.Controllers.Admin.Framework;

/// <summary>
/// 个人中心
/// </summary>
[ControllerDescriptor(MenuId = "19", DisplayName = "个人中心")]
public class PersonalCenterController : AdminBaseController<SysUserService>
{
    private readonly IAccountDomainService _accountService;

    public PersonalCenterController(SysUserService defaultService, IAccountDomainService accountService)
        : base(defaultService)
    {
        _accountService = accountService;
    }

    /// <summary>
    /// 更新密码
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "修改密码")]
    [HttpPost("ChangePassword")]
    public async Task<int> ChangePasswordAsync([FromBody] ChangePasswordFormDto form)
        => await this._accountService.ChangePasswordAsync(form.OldPassword, form.NewPassword);

    /// <summary>
    /// 保存
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "保存/编辑数据")]
    [HttpPost("SaveForm")]
    public async Task<SysUser> SaveFormAsync([FromBody] SysUser form)
    => await this._accountService.ChangeUserAsync(form);


}