
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

namespace HZY.EFCore.Migrations.Seeds.Datas;

  public static class MigrationsSysRoleModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
// ===============================================表：sys_role 种子数据=============================================
modelBuilder.Entity<SysRole>().HasData(new SysRole(){Id=Guid.Parse("18fa4771-6f58-46a3-80d2-6f0f5e9972e3"),CreationTime=DateTime.Parse("2016/7/6 17:59:20"),CreatorUserId=null,DeleteLock=bool.Parse("True"),LastModificationTime=DateTime.Parse("2021/1/10 11:25:12"),LastModifierUserId=null,Name="超级管理员",Number=1,Remark="拥有所有权限"},new SysRole(){Id=Guid.Parse("40ff1844-c099-4061-98e0-cd6e544fcfd3"),CreationTime=DateTime.Parse("2016/7/6 17:59:20"),CreatorUserId=null,DeleteLock=bool.Parse("True"),LastModificationTime=DateTime.Parse("2021/1/30 0:51:17"),LastModifierUserId=null,Name="普通用户",Number=2,Remark="普通用户"});

    }
}
