namespace HZY.Shared.ApplicationServices.Accounts.Impl;

/// <summary>
/// 当前登录账户服务
/// </summary>
public class AccountServiceImpl : IAccountService
{
    private readonly string AccountContextCacheName = "AccountContext";
    private readonly AccountContext _accountInfo;
    private readonly JwtTokenService _tokenService;
    private readonly IRepository<SysOrganization> _sysOrganizationRepository;
    private readonly IRepository<SysUser> _sysUserRepository;
    private readonly IMemoryCache _memoryCache;
    private readonly IRepository<SysUserRole> _sysUserRoleRepository;
    private readonly IRepository<SysRole> _sysRoleRepository;
    private readonly IRepository<SysPost> _sysPostRepository;
    private readonly IRepository<SysUserPost> _sysUserPostRepository;

    /// <summary>
    /// 当前登录账户服务
    /// </summary>
    /// <param name="sysUserRepository"></param>
    /// <param name="sysOrganizationRepository"></param>
    /// <param name="tokenService"></param>
    /// <param name="memoryCache"></param>
    /// <param name="sysUserRoleRepository"></param>
    /// <param name="sysRoleRepository"></param>
    /// <param name="sysPostRepository"></param>
    /// <param name="sysUserPostRepository"></param>
    public AccountServiceImpl(IRepository<SysUser> sysUserRepository,
        IRepository<SysOrganization> sysOrganizationRepository,
        JwtTokenService tokenService,
        IMemoryCache memoryCache,
        IRepository<SysUserRole> sysUserRoleRepository,
        IRepository<SysRole> sysRoleRepository,
        IRepository<SysPost> sysPostRepository,
        IRepository<SysUserPost> sysUserPostRepository)
    {
        _sysUserRepository = sysUserRepository;
        _tokenService = tokenService;
        _sysOrganizationRepository = sysOrganizationRepository;
        _memoryCache = memoryCache;
        _sysUserRoleRepository = sysUserRoleRepository;
        _sysRoleRepository = sysRoleRepository;
        _sysPostRepository = sysPostRepository;
        _sysUserPostRepository = sysUserPostRepository;

        _accountInfo = FindAccountContextByToken();
    }

    /// <summary>
    /// 根据用户信息获取 Account 对象
    /// </summary>
    /// <returns></returns>
    private AccountContext FindAccountContextByToken()
    {
        var id = _tokenService.GetAccountIdByToken();

        if (id == Guid.Empty || id == default)
        {
            return default;
        }

        var accountInfo = GetCacheAccountContextById(id.ToString());

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

        accountInfo = new AccountContext();
        accountInfo = sysUser.MapTo<SysUser, AccountContext>();
        accountInfo.IsAdministrator = sysRoles.Any(w => w.IsAdmin);
        accountInfo.SysRoles = sysRoles;
        accountInfo.SysPosts = sysPosts;
        accountInfo.SysOrganization = sysOrganization;

        //缓存
        return SetCacheByAccountContext(accountInfo);
    }

    /// <summary>
    /// 获取当前登录账户信息
    /// </summary>
    /// <returns></returns>
    public virtual AccountContext GetAccountContext() => _accountInfo ?? FindAccountContextByToken();

    /// <summary>
    /// 获取当前登录账户信息
    /// </summary>
    public virtual AccountContext AccountContext => GetAccountContext();

    /// <summary>
    /// 检查账户 登录信息 并返回 token
    /// </summary>
    /// <param name="authUserFormDto"></param>
    /// <returns>账户 id</returns>
    public virtual async Task<Guid> LoginAsync(AuthUserFormDto authUserFormDto)
    {
        if (string.IsNullOrWhiteSpace(authUserFormDto.UserName))
            MessageBox.Show("请输入账户名!");

        if (string.IsNullOrWhiteSpace(authUserFormDto.UserPassword))
            MessageBox.Show("请输入密码！");

        if (authUserFormDto.UserPassword.Length < 6)
        {
            MessageBox.Show("密码长度不能少于6位！");
        }

        if (authUserFormDto.UserPassword.Length > 20)
        {
            MessageBox.Show("密码长度不能大于20位！");
        }

        // if (string.IsNullOrWhiteSpace(code))
        //  MessageBox.Show("请输入验证码!");

        var sysUser = await _sysUserRepository.FindAsync(w => w.LoginName == authUserFormDto.UserName);
        if (sysUser == null)
        {
            MessageBox.Show("账户或者密码错误!");
        }

        if (sysUser.Password.Trim() != Tools.Md5Encrypt(authUserFormDto.UserPassword))
        {
            MessageBox.Show("账户或者密码错误!");
        }

        //string code = Tools.GetCookie("loginCode");
        //if (string.IsNullOrEmpty(code)) throw new MessageBox("验证码失效");
        //if (!code.ToLower().Equals(loginCode.ToLower())) throw new MessageBox("验证码不正确");

        //return _tokenService.CreateTokenByAccountId(sysUser.Id);
        return sysUser.Id;
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
        //return _tokenService.RefreshToken();
        return default;
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
    /// 验证 token
    /// </summary>
    /// <returns></returns>
    public virtual bool IsValidate => _tokenService.IsValidate();

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
        var sysUser = await _sysUserRepository.FindByIdAsync(GetAccountContext().Id);
        if (sysUser.Password != Tools.Md5Encrypt(oldPassword)) MessageBox.Show("旧密码不正确！");
        sysUser.Password = Tools.Md5Encrypt(newPassword);
        DeleteCacheAccountContextById(sysUser.Id.ToString());
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
        DeleteCacheAccountContextById(sysUser.Id.ToString());
        return await _sysUserRepository.InsertOrUpdateAsync(sysUser);
    }

    /// <summary>
    /// 根据账户信息缓存
    /// </summary>
    /// <param name="accountInfo"></param>
    /// <returns></returns>
    public virtual AccountContext SetCacheByAccountContext(AccountContext accountInfo)
    {
        //缓存 1 小时
        return _memoryCache.Set(GetCacheKeyById(accountInfo.Id.ToString()), accountInfo, DateTime.Now.AddHours(1));
    }

    /// <summary>
    /// 获取缓存中的账户信息
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public virtual AccountContext GetCacheAccountContextById(string id)
    {
        //缓存
        return _memoryCache.Get<AccountContext>(GetCacheKeyById(id));
    }

    /// <summary>
    /// 删除缓存账户信息 根据id
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public virtual bool DeleteCacheAccountContextById(string id)
    {
        _memoryCache.Remove(GetCacheKeyById(id));
        return true;
    }

    #region 私有方法

    private string GetCacheKeyById(string id) => AccountContextCacheName + id;

    #endregion
}