using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using HZY.Repository.Framework;
using HZY.Common;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using HZY.Repository.AppCore.Models;
using HZY.Repository.AppCore.Extensions;
using HZY.Admin.Services.Framework;
using HZY.Repository;
using Microsoft.AspNetCore.Hosting;
using HZY.Repository.Domain;
using Microsoft.AspNetCore.Http;

namespace HZY.Admin.Services
{
    /// <summary>
    /// 会员服务
    /// </summary>
    public class MemberService : AdminBaseService<MemberRepository>
    {
        private readonly string _webRootPath;
        private readonly SysUserRepository _sysUserRepository;
        private readonly UploadService _uploadService;

        public MemberService(MemberRepository repository,
            SysUserRepository sysUserRepository,
            IWebHostEnvironment webHostEnvironment, UploadService uploadService)
            : base(repository)
        {
            _sysUserRepository = sysUserRepository;
            _uploadService = uploadService;
            _webRootPath = webHostEnvironment.WebRootPath;
        }

        /// <summary>
        /// 获取列表数据
        /// </summary>
        /// <param name="page"></param>
        /// <param name="size"></param>
        /// <param name="search"></param>
        /// <returns></returns>
        public async Task<PagingViewModel> FindListAsync(int page, int size, Member search)
        {
            var query = (
                        from member in this.Repository.Orm.Member
                        from user in this.Repository.Orm.SysUser.Where(w => w.Id == member.UserId).DefaultIfEmpty()
                        select new { t1 = member, t2 = user }
                    )
                    .WhereIf(!string.IsNullOrWhiteSpace(search.Name), w => w.t1.Name.Contains(search.Name))
                    .OrderBy(w => w.t1.Number)
                    .Select(w => new
                    {
                        w.t1.Id,
                        w.t1.Number,
                        w.t1.Photo,
                        w.t1.Name,
                        w.t1.Phone,
                        w.t1.Sex,
                        Birthday = w.t1.Birthday.ToString("yyyy-MM-dd"),
                        操作人 = w.t2.Name,
                        UpdateTime = w.t1.UpdateTime.ToString("yyyy-MM-dd"),
                        CreateTime = w.t2.CreateTime.ToString("yyyy-MM-dd"),
                        //别名 前面包含 _ 则表示忽略该列
                        _UserId = w.t1.UserId
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
            await this.Repository.DeleteByIdsAsync(ids);
        }

        /// <summary>
        /// 查询表单数据
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public async Task<Dictionary<string, object>> FindFormAsync(Guid id)
        {
            var res = new Dictionary<string, object>();
            var form = await this.Repository.FindByIdAsync(id);
            form = form.NullSafe();
            var sysUser = await _sysUserRepository.FindByIdAsync(form.UserId.ToGuid());
            sysUser = sysUser.NullSafe();
            res[nameof(form)] = form;
            res[nameof(sysUser)] = sysUser;
            return res;
        }

        /// <summary>
        /// 保存数据
        /// </summary>
        /// <param name="form"></param>
        /// <param name="formFileCollection"></param>
        /// <returns></returns>
        public async Task<Member> SaveFormAsync(Member form, IFormFileCollection formFileCollection)
        {
            var files = new List<IFormFile>();
            IFormFile photo = null;
            if (formFileCollection.Count > 0)
            {
                files = formFileCollection.Where(w => w.Name.Contains("Files")).ToList();
                photo = formFileCollection.FirstOrDefault(w => w.Name == "Photo");
            }

            if (photo != null)
            {
                form.Photo = this._uploadService.HandleUploadImageFile(photo);
            }

            if (files.Count > 0)
            {
                var path = files.Select(item => this._uploadService.HandleUploadFile(item)).ToList();

                if (path.Count > 0) form.FilePath = string.Join(",", path);
            }

            return await this.Repository.InsertOrUpdateAsync(form);
        }

        /// <summary>
        /// 导出Excel
        /// </summary>
        /// <param name="search"></param>
        /// <returns></returns>
        public async Task<byte[]> ExportExcelAsync(Member search)
        {
            var tableViewModel = await this.FindListAsync(1, 999999, search);
            return this.ExportExcelByPagingViewModel(tableViewModel);
        }
    }
}