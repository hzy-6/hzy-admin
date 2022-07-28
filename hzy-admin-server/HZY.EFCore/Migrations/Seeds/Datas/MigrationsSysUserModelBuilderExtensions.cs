
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

  public static class MigrationsSysUserModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
// ===============================================表：sys_user 种子数据=============================================
modelBuilder.Entity<SysUser>().HasData(new SysUser(){Id=Guid.Parse("5722af0f-2366-4fc9-62d5-08da00e3d8a0"),CreationTime=DateTime.Parse("2022/3/8 17:13:02"),DeleteLock=bool.Parse("False"),Email="12345678900@qq.com",LastModificationTime=DateTime.Parse("2022/3/8 17:13:02"),LoginName="杜甫",Name="杜甫",OrganizationId=7,Password="46F94C8DE14FB36680850768FF1B7F2A",Phone="12345678900"},new SysUser(){Id=Guid.Parse("4fd6a740-0cf1-4975-62d6-08da00e3d8a0"),CreationTime=DateTime.Parse("2022/3/8 17:14:13"),DeleteLock=bool.Parse("False"),Email="12345678900@qq.com",LastModificationTime=DateTime.Parse("2022/3/8 17:14:13"),LoginName="李商隐",Name="李商隐",OrganizationId=7,Password="46F94C8DE14FB36680850768FF1B7F2A",Phone="12345678900"},new SysUser(){Id=Guid.Parse("e225e163-31c9-4da9-62d7-08da00e3d8a0"),CreationTime=DateTime.Parse("2022/3/8 17:15:07"),DeleteLock=bool.Parse("False"),Email="12345678900@qq.com",LastModificationTime=DateTime.Parse("2022/3/8 17:15:07"),LoginName="苏轼",Name="苏轼",OrganizationId=7,Password="46F94C8DE14FB36680850768FF1B7F2A",Phone="12345678900"},new SysUser(){Id=Guid.Parse("3739f349-7995-4c63-62d8-08da00e3d8a0"),CreationTime=DateTime.Parse("2022/3/8 17:17:58"),DeleteLock=bool.Parse("False"),Email="12345678900@qq.com",LastModificationTime=DateTime.Parse("2022/3/8 17:17:58"),LoginName="白居易",Name="白居易",OrganizationId=7,Password="46F94C8DE14FB36680850768FF1B7F2A",Phone="12345678900"},new SysUser(){Id=Guid.Parse("a3f9784c-5f00-4ec9-62d9-08da00e3d8a0"),CreationTime=DateTime.Parse("2022/3/8 17:19:22"),DeleteLock=bool.Parse("False"),Email="12345678900@qq.com",LastModificationTime=DateTime.Parse("2022/3/8 17:19:22"),LoginName="陶渊明 ",Name="陶渊明 ",OrganizationId=7,Password="46F94C8DE14FB36680850768FF1B7F2A",Phone="12345678900"},new SysUser(){Id=Guid.Parse("a1b6dafb-2b6a-4ff9-62da-08da00e3d8a0"),CreationTime=DateTime.Parse("2022/3/8 17:19:55"),DeleteLock=bool.Parse("False"),Email="12345678900@qq.com",LastModificationTime=DateTime.Parse("2022/3/8 17:19:55"),LoginName="屈原",Name="屈原",OrganizationId=7,Password="46F94C8DE14FB36680850768FF1B7F2A",Phone="12345678900"},new SysUser(){Id=Guid.Parse("cc186fe2-ee27-4292-62db-08da00e3d8a0"),CreationTime=DateTime.Parse("2022/3/8 17:20:20"),DeleteLock=bool.Parse("False"),Email="12345678900@qq.com",LastModificationTime=DateTime.Parse("2022/3/8 17:20:20"),LoginName="孟浩然",Name="孟浩然",OrganizationId=7,Password="46F94C8DE14FB36680850768FF1B7F2A",Phone="12345678900"},new SysUser(){Id=Guid.Parse("1550d6d4-0529-4fdd-62dc-08da00e3d8a0"),CreationTime=DateTime.Parse("2022/3/8 17:21:56"),DeleteLock=bool.Parse("False"),Email="12345678900@qq.com",LastModificationTime=DateTime.Parse("2022/3/8 17:30:56"),LoginName="鲁迅",Name="鲁迅",OrganizationId=7,Password="46F94C8DE14FB36680850768FF1B7F2A",Phone="12345678900"},new SysUser(){Id=Guid.Parse("0198459e-2034-4533-b843-5d227ad20740"),CreationTime=DateTime.Parse("2017/4/6 19:55:53"),DeleteLock=bool.Parse("True"),Email="1396510655@qq.com",LastModificationTime=DateTime.Parse("2022/3/8 17:27:36"),LoginName="admin",Name="超级管理员",OrganizationId=7,Password="E10ADC3949BA59ABBE56E057F20F883E",Phone="10000000000"},new SysUser(){Id=Guid.Parse("ac18f496-e93d-42f0-b59e-e321acc85335"),CreationTime=DateTime.Parse("2017/4/6 19:55:53"),DeleteLock=bool.Parse("True"),Email="12345678900@live.com",LastModificationTime=DateTime.Parse("2022/3/8 10:12:14"),LoginName="libai",Name="李白",OrganizationId=7,Password="E10ADC3949BA59ABBE56E057F20F883E",Phone="12345678900"});

    }
}
