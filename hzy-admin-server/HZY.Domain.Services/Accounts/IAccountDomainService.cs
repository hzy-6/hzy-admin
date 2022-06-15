using HZY.Models.BO;
using HZY.Models.Entities.Framework;
using HzyScanDiService;
using System.Threading.Tasks;

namespace HZY.Domain.Services.Accounts;

/// <summary>
/// 当前登录账户服务
/// </summary>
public interface IAccountDomainService : IScopedDependency
{
    /// <summary>
    /// 获取账户信息
    /// </summary>
    /// <returns></returns>
    AccountInfo GetAccountInfo();

    /// <summary>
    /// 检查账户密码信息
    /// </summary>
    /// <param name="name"></param>
    /// <param name="password"></param>
    /// <param name="code"></param>
    /// <returns></returns>
    Task<string> CheckAccountAsync(string name, string password, string code);

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
    AccountInfo SetCacheByAccountInfo(AccountInfo accountInfo);

    /// <summary>
    /// 获取缓存中的账户信息
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    AccountInfo GetCacheAccountInfoById(string id);

    /// <summary>
    /// 删除缓存账户信息 根据id
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    bool DeleteCacheAccountInfoById(string id);

}