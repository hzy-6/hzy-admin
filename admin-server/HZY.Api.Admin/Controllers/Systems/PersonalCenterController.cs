namespace HZY.Api.Admin.Controllers.Systems;

/// <summary>
/// 个人中心
/// </summary>
[ControllerDescriptor(MenuId = "19", DisplayName = "个人中心")]
public class PersonalCenterController : AdminControllerBase<SysUserService>
{
    private readonly IAccountService _accountService;

    public PersonalCenterController(SysUserService defaultService, IAccountService accountService)
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
    [HttpPost]
    public async Task<int> ChangePasswordAsync([FromBody] ChangePasswordFormDto form)
        => await _accountService.ChangePasswordAsync(form.OldPassword, form.NewPassword);

    /// <summary>
    /// 保存
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    [ActionDescriptor(DisplayName = "保存/编辑数据")]
    [HttpPost]
    public async Task<SysUser> SaveFormAsync([FromBody] SysUser form)
    => await _accountService.ChangeUserAsync(form);


}