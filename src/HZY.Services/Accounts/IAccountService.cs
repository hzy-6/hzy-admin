using HZY.Infrastructure.ScanDIService.Interface;
using HZY.Model.BO;
using System.Threading.Tasks;

namespace HZY.Services.Accounts;

/// <summary>
/// 当前登录账户服务
/// </summary>
public interface IAccountService : IDiScoped
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

}