using System;
using System.Linq;
using HZY.Admin.Services.Bo;
using HZY.Framework.Services;
using HZY.Repository.Framework;
using HZY.Common;
using Microsoft.AspNetCore.Http;

namespace HZY.Admin.Services.Framework
{
    /// <summary>
    /// 当前登录账户服务
    /// </summary>
    public class AccountService : AdminBaseService<SysUserRepository>
    {
        private readonly AccountInfo _accountInfo;
        private readonly AppConfiguration _appConfiguration;
        private readonly HttpContext _httpContext;
        private readonly SysUserRoleRepository _sysUserRoleRepository;

        public AccountService(SysUserRepository repository,
            AppConfiguration appConfiguration,
            IHttpContextAccessor httpContextAccessor,
            SysUserRoleRepository sysUserRoleRepository) : base(repository)
        {
            _appConfiguration = appConfiguration;
            _sysUserRoleRepository = sysUserRoleRepository;
            _httpContext = httpContextAccessor.HttpContext;

            //获取 cookie
            var token = this.GetToken();

            if (!string.IsNullOrWhiteSpace(token))
            {
                this._accountInfo = this.FindAccountInfoByUserId(this.GetUserIdByToken(token));
            }
        }

        /// <summary>
        /// 获取 Token
        /// </summary>
        /// <returns></returns>
        private string GetToken()
            => this._httpContext.GetCookie(this._appConfiguration.AuthorizationKeyName);

        /// <summary>
        /// 移除 Token
        /// </summary>
        public void RemoveToken()
            => this._httpContext.RemoveCookie(this._appConfiguration.AuthorizationKeyName);

        /// <summary>
        /// 创建 token 根据账户 id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public string CreateToken(string id)
            => JwtTokenUtil.CreateToken(id, this._appConfiguration.JwtSecurityKey, this._appConfiguration.JwtKeyName);

        /// <summary>
        /// 根据 token 获取账户id
        /// </summary>
        /// <param name="token"></param>
        /// <returns></returns>
        private Guid GetUserIdByToken(string token)
            => JwtTokenUtil.ReadJwtToken(token).ToGuid();

        /// <summary>
        /// 根据用户信息获取 Account 对象
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        private AccountInfo FindAccountInfoByUserId(Guid id)
        {
            var sysUser = this.Repository.FindById(id);
            if (sysUser == null) return default;
            var sysUserRoles = this._sysUserRoleRepository.Select
                    .Where(w => w.UserId == sysUser.Id)
                    .ToList()
                ;

            return new AccountInfo
            {
                RoleIds = sysUserRoles.Select(w => w.RoleId).ToList(),
                UserId = sysUser.Id,
                SysUser = sysUser,
                UserName = sysUser.Name,
                IsSuperManage = sysUserRoles.Any(w => w.RoleId == this._appConfiguration.AdminRoleId)
            };
        }

        /// <summary>
        /// 获取当前登录账户信息
        /// </summary>
        /// <returns></returns>
        public AccountInfo GetAccountInfo() => this._accountInfo;
    }
}