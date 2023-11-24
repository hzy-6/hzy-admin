namespace HZY.Shared.ApplicationServices.Systems;

/// <summary>
/// 当前登录账户服务
/// </summary>
public interface IAccountService : IScopedDependency
{
    /// <summary>
    /// 获取账户信息
    /// </summary>
    /// <returns></returns>
    AccountContext GetAccountContext();

    /// <summary>
    /// 获取账户信息
    /// </summary>
    AccountContext AccountContext => default;

    /// <summary>
    /// 检查账户密码信息
    /// </summary>
    /// <param name="authUserFormDto"></param>
    /// <returns>账户 id</returns>
    Task<Guid> LoginAsync(AuthUserFormDto authUserFormDto);

    /// <summary>
    /// 是否刷新 token
    /// </summary>
    /// <returns></returns>
    bool IsRefreshToken();

    /// <summary>
    /// 刷新 token
    /// </summary>
    /// <returns></returns>
    string RefreshToken();

    /// <summary>
    /// 是否过期
    /// </summary>
    /// <returns></returns>
    bool IsExpire();

    /// <summary>
    /// 验证 token
    /// </summary>
    public bool IsValidate => default;

    /// <summary>
    /// 修改密码
    /// </summary>
    /// <param name="oldPassword"></param>
    /// <param name="newPassword"></param>
    /// <returns></returns>
    Task<int> ChangePasswordAsync(string oldPassword, string newPassword);

    /// <summary>
    /// 修改用户信息
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    Task<SysUser> ChangeUserAsync(SysUser form);

    /// <summary>
    /// 根据账户信息缓存
    /// </summary>
    /// <param name="accountInfo"></param>
    /// <returns></returns>
    AccountContext SetCacheByAccountContext(AccountContext accountInfo);

    /// <summary>
    /// 获取缓存中的账户信息
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    AccountContext GetCacheAccountContextById(string id);

    /// <summary>
    /// 删除缓存账户信息 根据id
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    bool DeleteCacheAccountContextById(string id);

}