using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HZY.Repository.Framework;
using HZY.Common;
using HZY.Repository.Domain.Framework;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using HZY.Repository.AppCore.Models;
using HZY.Repository.AppCore.Extensions;
using HZY.Framework.ApiResultManage;
using HZY.Admin.Services.Dto;

namespace HZY.Admin.Services.Framework
{
    /// <summary>
    /// 系统账号服务
    /// </summary>
    public class SysUserService : AdminBaseService<SysUserRepository>
    {
        private readonly AccountService _accountService;
        private readonly SysUserRoleRepository _sysUserRoleRepository;
        private readonly SysRoleRepository _sysRoleRepository;

        public SysUserService(SysUserRepository repository,
            AccountService accountService,
            SysUserRoleRepository sysUserRoleRepository,
            SysRoleRepository sysRoleRepository) : base(repository)
        {
            _accountService = accountService;
            _sysUserRoleRepository = sysUserRoleRepository;
            _sysRoleRepository = sysRoleRepository;
        }

        /// <summary>
        /// 获取列表数据
        /// </summary>
        /// <param name="page"></param>
        /// <param name="size"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        public async Task<PagingViewModel> FindListAsync(int page, int size, SysUser search)
        {
            var query = this.Repository.Select
                    .WhereIf(!string.IsNullOrWhiteSpace(search?.Name), w => w.Name.Contains(search.Name))
                    .WhereIf(!string.IsNullOrWhiteSpace(search?.LoginName), w => w.LoginName.Contains(search.LoginName))
                    .OrderByDescending(w => w.CreateTime)
                    .Select(w => new
                    {
                        w.Id,
                        w.Name,
                        w.LoginName,
                        所属角色 = string.Join(",", from userRole in this.Repository.Orm.SysUserRole
                                                join role in this.Repository.Orm.SysRole on userRole.RoleId equals role.Id
                                                where userRole.UserId == w.Id
                                                select role.Name),
                        w.Email,
                        UpdateTime = w.UpdateTime.ToString("yyyy-MM-dd"),
                        CreateTime = w.CreateTime.ToString("yyyy-MM-dd")
                    })
                ;

            return await this.Repository.AsPagingViewModelAsync(query, page, size);
        }

        /// <summary>
        /// 根据id数组删除
        /// </summary>
        /// <param name="ids"></param>
        /// <returns></returns>
        public async Task DeleteListAsync(List<Guid> ids)
        {
            foreach (var item in ids)
            {
                var userModel = await this.Repository.FindByIdAsync(item);
                if (userModel.IsDelete == 2)
                    MessageBox.Show("该信息不能删除！");
                await this._sysUserRoleRepository.DeleteAsync(w => w.UserId == item);
                await this.Repository.DeleteAsync(userModel);
            }
        }

        /// <summary>
        /// 查询表单数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Dictionary<string, object>> FindFormAsync(Guid id)
        {
            var res = new Dictionary<string, object>();

            var form = (await this.Repository.FindByIdAsync(id)).NullSafe();
            var roleIds = await this._sysUserRoleRepository.Select
                .Where(w => w.UserId == id)
                .Select(w => w.RoleId)
                .ToListAsync();
            var allRoleList = await this._sysRoleRepository.Select.ToListAsync();

            res[nameof(form)] = form;
            res[nameof(roleIds)] = roleIds;
            res[nameof(allRoleList)] = allRoleList;
            return res;
        }

        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="form"></param>
        /// <returns></returns>
        public async Task<SysUser> SaveFormAsync(SysUserFormDto form)
        {
            var model = form.Form;
            var roleIds = form.RoleIds;

            if (string.IsNullOrWhiteSpace(model.Password))
                MessageBox.Show("密码不能为空！");

            if (model.Id == Guid.Empty)
            {
                model.Password =
                    string.IsNullOrWhiteSpace(model.Password) ? "123" : model.Password; //Tools.MD5Encrypt("123");
            }

            await this.Repository.InsertOrUpdateAsync(form.Form);

            //变更用户角色
            if (form.RoleIds.Count > 0)
            {
                var sysUserRoles = await this._sysUserRoleRepository.Select
                    .Where(w => w.UserId == model.Id)
                    .ToListAsync();

                await this._sysUserRoleRepository.DeleteAsync(w => w.UserId == model.Id);
                foreach (var item in form.RoleIds)
                {
                    var sysUserRole = sysUserRoles.FirstOrDefault(w => w.RoleId == item).NullSafe();

                    sysUserRole.Id = Guid.NewGuid();
                    sysUserRole.RoleId = item;
                    sysUserRole.UserId = model.Id;
                    await this._sysUserRoleRepository.InsertAsync(sysUserRole);
                }
            }

            return model;
        }

        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        public async Task<byte[]> ExportExcelAsync(SysUser search)
        {
            var tableViewModel = await this.FindListAsync(1, 999999, search);
            return this.ExportExcelByPagingViewModel(tableViewModel);
        }

        /// <summary>
        /// 检查账户 登录信息 并返回 token
        /// </summary>
        /// <param name="name"></param>
        /// <param name="password"></param>
        /// <param name="code"></param>
        /// <returns></returns>
        public async Task<string> CheckAccountAsync(string name, string password, string code)
        {
            if (string.IsNullOrWhiteSpace(name))
                MessageBox.Show("请输入账户名!");
            if (string.IsNullOrWhiteSpace(password))
                MessageBox.Show("请输入密码！");
            // if (string.IsNullOrWhiteSpace(code))
            //  MessageBox.Show("请输入验证码!");
            var sysUser = await this.Repository.Select.Where(w => w.LoginName == name).FirstOrDefaultAsync();
            if (sysUser == null)
            {
                MessageBox.Show("账户不存在!");
            }

            //Tools.Md5Encrypt(password)))
            if (sysUser?.Password.Trim() != password)
            {
                MessageBox.Show("密码错误!");
            }

            //string code = Tools.GetCookie("loginCode");
            //if (string.IsNullOrEmpty(code)) throw new MessageBox("验证码失效");
            //if (!code.ToLower().Equals(loginCode.ToLower())) throw new MessageBox("验证码不正确");

            return this._accountService.CreateToken(sysUser?.Id.ToStr());
        }

        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="oldPassword"></param>
        /// <param name="newPassword"></param>
        /// <returns></returns>
        public async Task<int> ChangePasswordAsync(string oldPassword, string newPassword)
        {
            if (string.IsNullOrEmpty(oldPassword)) MessageBox.Show("旧密码不能为空！");
            if (string.IsNullOrEmpty(newPassword)) MessageBox.Show("新密码不能为空！");
            var sysUser = await this.Repository.FindByIdAsync(this._accountService.GetAccountInfo().UserId);
            if (sysUser.Password != oldPassword) MessageBox.Show("旧密码不正确！");
            sysUser.Password = newPassword;
            return await this.Repository.UpdateAsync(sysUser);
        }
    }
}