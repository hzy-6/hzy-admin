
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

  public static class MigrationsSysOrganizationModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
// ===============================================表：sys_organization 种子数据=============================================
modelBuilder.Entity<SysOrganization>().HasData(new SysOrganization(){Id=1,CreationTime=DateTime.Parse("2021/5/27 20:50:31"),CreatorUserId=null,Email="18410912184@qq.com",LastModificationTime=DateTime.Parse("2021/5/27 20:50:31"),LastModifierUserId=null,Leader="hzy",LevelCode="1",Name="阿里巴巴集团",OrderNumber=1,ParentId=null,Phone="18410912184",State=StateEnum.正常},new SysOrganization(){Id=2,CreationTime=DateTime.Parse("2021/5/27 22:33:44"),CreatorUserId=null,Email="13131",LastModificationTime=DateTime.Parse("2021/12/28 16:13:34"),LastModifierUserId=null,Leader="北京分部",LevelCode="1.2",Name="北京分部",OrderNumber=3,ParentId=1,Phone="132123",State=StateEnum.正常},new SysOrganization(){Id=3,CreationTime=DateTime.Parse("2021/5/27 22:33:57"),CreatorUserId=null,Email="234234@qq.com",LastModificationTime=DateTime.Parse("2021/5/27 22:33:57"),LastModifierUserId=null,Leader="市场部门",LevelCode="1.2.3",Name="市场部门",OrderNumber=1,ParentId=2,Phone="234124234",State=StateEnum.正常},new SysOrganization(){Id=4,CreationTime=DateTime.Parse("2021/5/27 22:34:11"),CreatorUserId=null,Email="123@qq.com",LastModificationTime=DateTime.Parse("2021/5/27 22:34:11"),LastModifierUserId=null,Leader="财务部门",LevelCode="1.2.4",Name="财务部门",OrderNumber=2,ParentId=2,Phone="435543535",State=StateEnum.正常},new SysOrganization(){Id=5,CreationTime=DateTime.Parse("2021/5/27 21:01:50"),CreatorUserId=null,Email="123@qq.com",LastModificationTime=DateTime.Parse("2021/5/27 22:31:45"),LastModifierUserId=null,Leader="成都分部",LevelCode="1.5",Name="成都分部",OrderNumber=2,ParentId=1,Phone="123123123",State=StateEnum.正常},new SysOrganization(){Id=7,CreationTime=DateTime.Parse("2021/5/27 22:32:08"),CreatorUserId=null,Email="12312@qq.com",LastModificationTime=DateTime.Parse("2021/5/27 22:32:29"),LastModifierUserId=null,Leader="研发部门",LevelCode="1.5.7",Name="研发部门",OrderNumber=1,ParentId=5,Phone="1234323423",State=StateEnum.正常},new SysOrganization(){Id=9,CreationTime=DateTime.Parse("2021/5/27 22:33:25"),CreatorUserId=null,Email="12341@qq.com",LastModificationTime=DateTime.Parse("2022/3/8 17:07:47"),LastModifierUserId=null,Leader="运维部门",LevelCode="1.5.9",Name="运维部门",OrderNumber=4,ParentId=5,Phone="1232133452",State=StateEnum.正常},new SysOrganization(){Id=10,CreationTime=DateTime.Parse("2021/5/27 22:32:59"),CreatorUserId=null,Email="123123@qq.com",LastModificationTime=DateTime.Parse("2021/5/27 22:32:59"),LastModifierUserId=null,Leader="测试部门",LevelCode="1.5.10",Name="测试部门",OrderNumber=3,ParentId=5,Phone="12313",State=StateEnum.正常},new SysOrganization(){Id=11,CreationTime=DateTime.Parse("2022/3/8 17:00:20"),CreatorUserId=null,Email="12345678901@qq.com",LastModificationTime=DateTime.Parse("2022/3/8 17:07:37"),LastModifierUserId=null,Leader="技术部门",LevelCode="1.5.11",Name="技术部门",OrderNumber=2,ParentId=5,Phone="12345678911",State=StateEnum.正常});

    }
}
