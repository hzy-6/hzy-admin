using HZY.EFCore;
using HZY.EFCore.Repositories.Admin.Core;
using HZY.Infrastructure;
using HZY.Infrastructure.ApiResultManage;
using HZY.Infrastructure.Token;
using HZY.Models.BO;
using HZY.Models.Consts;
using HZY.Models.Entities.Framework;
using Microsoft.Extensions.Caching.Memory;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace HZY.Managers.Accounts.Impl;

/// <summary>
/// 当前登录账户服务
/// </summary>
public class AccountManagerImpl : IAccountManager
{
    private readonly string AccountInfoCacheName = "AccountInfo";
    private readonly AccountInfo _accountInfo;
    private readonly AppConfiguration _appConfiguration;
    private readonly TokenService _tokenService;
    private readonly IAdminRepository<SysOrganization> _sysOrganizationRepository;
    private readonly IAdminRepository<SysUser> _sysUserRepository;
    private readonly IMemoryCache _memoryCache;
    private readonly IAdminRepository<SysUserRole> _sysUserRoleRepository;
    private readonly IAdminRepository<SysRole> _sysRoleRepository;
    private readonly IAdminRepository<SysPost> _sysPostRepository;
    private readonly IAdminRepository<SysUserPost> _sysUserPostRepository;

    public AccountManagerImpl(IAdminRepository<SysUser> sysUserRepository,
        IAdminRepository<SysOrganization> sysOrganizationRepository,
        AppConfiguration appConfiguration,
        TokenService tokenService,
        IMemoryCache memoryCache,
        IAdminRepository<SysUserRole> sysUserRoleRepository,
        IAdminRepository<SysRole> sysRoleRepository,
        IAdminRepository<SysPost> sysPostRepository,
        IAdminRepository<SysUserPost> sysUserPostRepository)
    {
        _sysUserRepository = sysUserRepository;
        _appConfiguration = appConfiguration;
        _tokenService = tokenService;
        _sysOrganizationRepository = sysOrganizationRepository;
        _memoryCache = memoryCache;
        _sysUserRoleRepository = sysUserRoleRepository;
        _sysRoleRepository = sysRoleRepository;
        _sysPostRepository = sysPostRepository;
        _sysUserPostRepository = sysUserPostRepository;

        _accountInfo = FindAccountInfoByToken();
    }

    /// <summary>
    /// 根据用户信息获取 Account 对象
    /// </summary>
    /// <returns></returns>
    private AccountInfo FindAccountInfoByToken()
    {
        var id = _tokenService.GetAccountIdByToken();

        if (id == Guid.Empty || id == default)
        {
            return default;
        }

        var accountInfo = GetCacheAccountInfoById(id.ToString());

        if (accountInfo != null)
        {
            return accountInfo;
        }

        var sysUser = _sysUserRepository.FindById(id);
        if (sysUser == null) return default;
        var sysRoles = (
            from sysUserRole in _sysUserRoleRepository.Select
            from sysRole in _sysRoleRepository.Select.Where(w => w.Id == sysUserRole.RoleId).DefaultIfEmpty()
            where sysUserRole.UserId == id
            select sysRole
            ).ToList();

        var sysPosts = (
            from sysUserPost in _sysUserPostRepository.Select
            from sysPost in _sysPostRepository.Select.Where(w => w.Id == sysUserPost.PostId).DefaultIfEmpty()
            where sysUserPost.UserId == id
            select sysPost
            ).ToList();

        var sysOrganization = _sysOrganizationRepository.FindById(sysUser.OrganizationId);

        accountInfo = new AccountInfo();
        accountInfo = sysUser.MapTo<SysUser, AccountInfo>();
        accountInfo.IsAdministrator = sysRoles.Any(w => w.Id == _appConfiguration.Configs.AdminRoleId);
        accountInfo.SysRoles = sysRoles;
        accountInfo.SysPosts = sysPosts;
        accountInfo.SysOrganization = sysOrganization;

        //缓存
        return SetCacheByAccountInfo(accountInfo);
    }

    /// <summary>
    /// 获取当前登录账户信息
    /// </summary>
    /// <returns></returns>
    public virtual AccountInfo GetAccountInfo() => _accountInfo ?? FindAccountInfoByToken();

    /// <summary>
    /// 获取当前登录账户信息
    /// </summary>
    public virtual AccountInfo AccountInfo => GetAccountInfo();

    /// <summary>
    /// 检查账户 登录信息 并返回 token
    /// </summary>
    /// <param name="name"></param>
    /// <param name="password"></param>
    /// <param name="code"></param>
    /// <returns></returns>
    public virtual async Task<string> CheckAccountAsync(string name, string password, string code)
    {
        if (string.IsNullOrWhiteSpace(name))
            MessageBox.Show("请输入账户名!");
        if (string.IsNullOrWhiteSpace(password))
            MessageBox.Show("请输入密码！");
        // if (string.IsNullOrWhiteSpace(code))
        //  MessageBox.Show("请输入验证码!");
        var sysUser = await _sysUserRepository.FindAsync(w => w.LoginName == name);
        if (sysUser == null)
        {
            MessageBox.Show("账户或者密码错误!");
        }

        if (sysUser.Password.Trim() != Tools.Md5Encrypt(password))
        {
            MessageBox.Show("账户或者密码错误!");
        }

        //string code = Tools.GetCookie("loginCode");
        //if (string.IsNullOrEmpty(code)) throw new MessageBox("验证码失效");
        //if (!code.ToLower().Equals(loginCode.ToLower())) throw new MessageBox("验证码不正确");

        return _tokenService.CreateTokenByAccountId(sysUser.Id);
    }

    /// <summary>
    /// 是否刷新 token
    /// </summary>
    /// <returns></returns>
    public virtual bool IsRefreshToken()
    {
        return _tokenService.IsRefreshToken();
    }

    /// <summary>
    /// 刷新 token
    /// </summary>
    /// <returns></returns>
    public virtual string RefreshToken()
    {
        return _tokenService.RefreshToken();
    }

    /// <summary>
    /// 是否过期
    /// </summary>
    /// <returns></returns>
    public virtual bool IsExpire()
    {
        return _tokenService.IsExpire();
    }

    /// <summary>
    /// 修改密码
    /// </summary>
    /// <param name="oldPassword"></param>
    /// <param name="newPassword"></param>
    /// <returns></returns>
    public virtual async Task<int> ChangePasswordAsync(string oldPassword, string newPassword)
    {
        if (string.IsNullOrEmpty(oldPassword)) MessageBox.Show("旧密码不能为空！");
        if (string.IsNullOrEmpty(newPassword)) MessageBox.Show("新密码不能为空！");
        var sysUser = await _sysUserRepository.FindByIdAsync(GetAccountInfo().Id);
        if (sysUser.Password != oldPassword) MessageBox.Show("旧密码不正确！");
        sysUser.Password = newPassword;
        DeleteCacheAccountInfoById(sysUser.Id.ToString());
        return await _sysUserRepository.UpdateAsync(sysUser);
    }

    /// <summary>
    /// 修改用户基础信息
    /// </summary>
    /// <param name="form"></param>
    /// <returns></returns>
    public virtual async Task<SysUser> ChangeUserAsync(SysUser form)
    {
        var sysUser = await _sysUserRepository.FindByIdAsync(_accountInfo.Id);
        sysUser.Name = form.Name;
        sysUser.LoginName = form.LoginName;
        sysUser.Email = form.Email;
        sysUser.Phone = form.Phone;
        DeleteCacheAccountInfoById(sysUser.Id.ToString());
        return await _sysUserRepository.InsertOrUpdateAsync(sysUser);
    }

    /// <summary>
    /// 根据账户信息缓存
    /// </summary>
    /// <param name="accountInfo"></param>
    /// <returns></returns>
    public virtual AccountInfo SetCacheByAccountInfo(AccountInfo accountInfo)
    {
        //缓存 1 小时
        return _memoryCache.Set(GetCacheKeyById(accountInfo.Id.ToString()), accountInfo, DateTime.Now.AddHours(1));
    }

    /// <summary>
    /// 获取缓存中的账户信息
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public virtual AccountInfo GetCacheAccountInfoById(string id)
    {
        //缓存
        return _memoryCache.Get<AccountInfo>(GetCacheKeyById(id));
    }

    /// <summary>
    /// 删除缓存账户信息 根据id
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public virtual bool DeleteCacheAccountInfoById(string id)
    {
        _memoryCache.Remove(GetCacheKeyById(id));
        return true;
    }

    #region 私有方法

    private string GetCacheKeyById(string id) => AccountInfoCacheName + id;

    #endregion
}