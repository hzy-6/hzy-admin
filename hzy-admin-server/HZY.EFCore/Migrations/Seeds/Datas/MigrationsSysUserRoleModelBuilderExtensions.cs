
using HZY.Models.Entities;
using HZY.Models.Entities.LowCode;
using HZY.Models.Entities.AllPeopleGoGoGo;
using HZY.Models.Entities.ApprovalFlow;
using HZY.Models.Entities.Framework;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.EFCore.Migrations.Seeds.Datas;

  public static class MigrationsSysUserRoleModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
// ===============================================表：sys_user_role 种子数据=============================================
modelBuilder.Entity<SysUserRole>().HasData(new SysUserRole(){Id=Guid.Parse("ad5014f2-92e8-4109-9ca4-013a92390f8b"),CreationTime=DateTime.Parse("2022/3/8 17:20:20"),LastModificationTime=DateTime.Parse("2022/3/8 17:20:20"),RoleId=Guid.Parse("40ff1844-c099-4061-98e0-cd6e544fcfd3"),UserId=Guid.Parse("cc186fe2-ee27-4292-62db-08da00e3d8a0")},new SysUserRole(){Id=Guid.Parse("ce9f61ac-79d8-426f-9066-36962c017bf6"),CreationTime=DateTime.Parse("2022/3/8 17:13:02"),LastModificationTime=DateTime.Parse("2022/3/8 17:13:02"),RoleId=Guid.Parse("40ff1844-c099-4061-98e0-cd6e544fcfd3"),UserId=Guid.Parse("5722af0f-2366-4fc9-62d5-08da00e3d8a0")},new SysUserRole(){Id=Guid.Parse("dbc656a6-4264-417d-97d8-577e1218feca"),CreationTime=DateTime.Parse("2022/3/8 17:19:22"),LastModificationTime=DateTime.Parse("2022/3/8 17:19:22"),RoleId=Guid.Parse("40ff1844-c099-4061-98e0-cd6e544fcfd3"),UserId=Guid.Parse("a3f9784c-5f00-4ec9-62d9-08da00e3d8a0")},new SysUserRole(){Id=Guid.Parse("9b7bee51-2fb4-4aba-b680-6eea512919eb"),CreationTime=DateTime.Parse("2022/6/21 19:59:02"),LastModificationTime=DateTime.Parse("2022/6/21 19:59:02"),RoleId=Guid.Parse("40ff1844-c099-4061-98e0-cd6e544fcfd3"),UserId=Guid.Parse("a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0")},new SysUserRole(){Id=Guid.Parse("23d32064-6eb8-4ea9-9b2a-7e2f09f53e4d"),CreationTime=DateTime.Parse("2022/7/6 21:49:13"),LastModificationTime=DateTime.Parse("2022/7/6 21:49:13"),RoleId=Guid.Parse("40ff1844-c099-4061-98e0-cd6e544fcfd3"),UserId=Guid.Parse("1550d6d4-0529-4fdd-62dc-08da00e3d8a0")},new SysUserRole(){Id=Guid.Parse("1fe23f57-97c5-4670-9064-88d7d972cd28"),CreationTime=DateTime.Parse("2022/3/8 17:15:07"),LastModificationTime=DateTime.Parse("2022/3/8 17:15:07"),RoleId=Guid.Parse("40ff1844-c099-4061-98e0-cd6e544fcfd3"),UserId=Guid.Parse("e225e163-31c9-4da9-62d7-08da00e3d8a0")},new SysUserRole(){Id=Guid.Parse("a9f8a23b-8c2f-43cc-97af-8ed6f4c4d097"),CreationTime=DateTime.Parse("2022/3/8 17:14:13"),LastModificationTime=DateTime.Parse("2022/3/8 17:14:13"),RoleId=Guid.Parse("40ff1844-c099-4061-98e0-cd6e544fcfd3"),UserId=Guid.Parse("4fd6a740-0cf1-4975-62d6-08da00e3d8a0")},new SysUserRole(){Id=Guid.Parse("45b7d5af-4d2c-465e-a4b6-99e52af9aee5"),CreationTime=DateTime.Parse("2022/3/8 17:17:58"),LastModificationTime=DateTime.Parse("2022/3/8 17:17:58"),RoleId=Guid.Parse("40ff1844-c099-4061-98e0-cd6e544fcfd3"),UserId=Guid.Parse("3739f349-7995-4c63-62d8-08da00e3d8a0")},new SysUserRole(){Id=Guid.Parse("1c9f81df-c8a0-45bb-a272-c84bd3af0c19"),CreationTime=DateTime.Parse("2022/3/8 17:29:22"),LastModificationTime=DateTime.Parse("2022/3/8 17:29:22"),RoleId=Guid.Parse("18fa4771-6f58-46a3-80d2-6f0f5e9972e3"),UserId=Guid.Parse("0198459e-2034-4533-b843-5d227ad20740")},new SysUserRole(){Id=Guid.Parse("fa1fdf14-3847-4194-894c-cd935a3dd9e6"),CreationTime=DateTime.Parse("2022/3/8 10:13:35"),LastModificationTime=DateTime.Parse("2022/3/8 10:13:35"),RoleId=Guid.Parse("40ff1844-c099-4061-98e0-cd6e544fcfd3"),UserId=Guid.Parse("ac18f496-e93d-42f0-b59e-e321acc85335")});

    }
}
