
using HZY.Models.Entities;
using HZY.Models.Entities.LowCode;
using HZY.Models.Entities.ApprovalFlow;
using HZY.Models.Entities.Framework;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HZY.EntityFramework.Migrations.Seeds.Datas;

  public static class MigrationsSysRoleMenuFunctionModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
// ===============================================表：sys_role_menu_function 种子数据=============================================
modelBuilder.Entity<SysRoleMenuFunction>().HasData(new SysRoleMenuFunction(){Id=Guid.Parse("7af695f2-0a26-464d-15e0-08dad5c66e71"),CreationTime=DateTime.Parse("2022/12/4 15:09:05"),CreatorUserId=Guid.Parse("0198459e-2034-4533-b843-5d227ad20740"),LastModificationTime=null,LastModifierUserId=null,MenuFunctionId=Guid.Parse("a7cd04db-bbe3-49b6-0f1e-08d9fdad00ab"),MenuId=2,RoleId=Guid.Parse("40ff1844-c099-4061-98e0-cd6e544fcfd3")},new SysRoleMenuFunction(){Id=Guid.Parse("cf8e1d9e-74e5-4f1e-15e1-08dad5c66e71"),CreationTime=DateTime.Parse("2022/12/4 15:09:05"),CreatorUserId=Guid.Parse("0198459e-2034-4533-b843-5d227ad20740"),LastModificationTime=null,LastModifierUserId=null,MenuFunctionId=Guid.Parse("f64cfe50-1ef1-457f-0f20-08d9fdad00ab"),MenuId=3,RoleId=Guid.Parse("40ff1844-c099-4061-98e0-cd6e544fcfd3")},new SysRoleMenuFunction(){Id=Guid.Parse("cd6175d8-67cc-4f62-15e2-08dad5c66e71"),CreationTime=DateTime.Parse("2022/12/4 15:09:05"),CreatorUserId=Guid.Parse("0198459e-2034-4533-b843-5d227ad20740"),LastModificationTime=null,LastModifierUserId=null,MenuFunctionId=Guid.Parse("c77c812a-1601-4311-0f70-08d9fdad00ab"),MenuId=19,RoleId=Guid.Parse("40ff1844-c099-4061-98e0-cd6e544fcfd3")});

    }
}
