using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HZY.Admin.Model.Dto;
using HZY.Framework;
using HZY.Framework.Services;
using HZY.Repository.Entity.Framework;
using HZY.Repository.Core.Models;
using HZY.Repository.Framework;
using HZY.Toolkit;

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
            var query = await this.Repository.Select
                    .WhereIf(!string.IsNullOrWhiteSpace(search?.Name), w => w.Name.Contains(search.Name))
                    .WhereIf(!string.IsNullOrWhiteSpace(search?.LoginName), w => w.LoginName.Contains(search.LoginName))
                    .OrderByDescending(w => w.CreateTime)
                    .Count(out var total)
                    .Page(page, size)
                    .ToListAsync(w => new
                    {
                        w.Id,
                        w.Name,
                        w.LoginName,
                        // 所属角色 = string.Join(",", this.Repository.Orm
                        //     .Select<SysUserRole, SysRole>()
                        //     .LeftJoin(t => t.t1.RoleId == t.t2.Id)
                        //     .Where(t => t.t1.UserId == w.Id)
                        //     .ToList(t => t.t2.Name)),
                        所属角色 = string.Join(",", this.Repository.Orm
                            .Select<SysUserRole, SysRole>()
                            .LeftJoin((a, b) => a.RoleId == b.Id)
                            .Where((a, b) => a.UserId == w.Id)
                            .ToList((a, b) => b.Name)),
                        w.Email,
                        UpdateTime = w.UpdateTime.ToString("yyyy-MM-dd"),
                        CreateTime = w.CreateTime.ToString("yyyy-MM-dd")
                    })
                ;

            return await this.Repository.AsPagingViewModelAsync(query, page, size, total);
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
                var userModel = await this.Repository.FindAsync(item);
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

            var model = (await this.Repository.FindAsync(id)).NullSafe();
            var roleIds = await this._sysUserRoleRepository.Select
                .Where(w => w.UserId == id)
                .Select(w => w.RoleId)
                .ToListAsync();
            var roleAllList = await this._sysRoleRepository.Select.ToListAsync();

            res[nameof(model)] = model;
            res[nameof(roleIds)] = roleIds;
            res[nameof(roleAllList)] = roleAllList;
            return res;
        }

        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="form"></param>
        /// <returns></returns>
        public async Task<SysUser> SaveFormAsync(SysUserFormDto form)
        {
            var model = form.Model;
            var roleIds = form.RoleIds;

            if (string.IsNullOrWhiteSpace(model.Password))
                MessageBox.Show("密码不能为空！");

            if (model.Id == Guid.Empty)
            {
                model.Password =
                    string.IsNullOrWhiteSpace(model.Password) ? "123" : model.Password; //Tools.MD5Encrypt("123");
            }

            await this.Repository.InsertOrUpdateAsync(form.Model);

            //变更用户角色
            if (roleIds.Count <= 0) return model;

            var sysUserRoles = await this._sysUserRoleRepository.Select
                .Where(w => w.UserId == model.Id)
                .ToListAsync();

            await this._sysUserRoleRepository.DeleteAsync(w => w.UserId == model.Id);
            foreach (var item in roleIds)
            {
                var sysUserRole = sysUserRoles.FirstOrDefault(w => w.RoleId == item).NullSafe();

                sysUserRole.Id = sysUserRole.Id == Guid.Empty ? Guid.NewGuid() : sysUserRole.Id;
                sysUserRole.RoleId = item;
                sysUserRole.UserId = model.Id;
                await this._sysUserRoleRepository.InsertAsync(sysUserRole);
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
            var sysUser = await this.Repository.Select.Where(w => w.LoginName == name).FirstAsync();
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
            var sysUser = await this.Repository.FindAsync(this._accountService.GetAccountInfo().UserId);
            if (sysUser.Password != oldPassword) MessageBox.Show("旧密码不正确！");
            sysUser.Password = newPassword;
            return await this.Repository.UpdateAsync(sysUser);
        }
    }
}