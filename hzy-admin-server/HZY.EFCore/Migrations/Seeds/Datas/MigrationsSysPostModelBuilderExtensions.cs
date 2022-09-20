
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

  public static class MigrationsSysPostModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
// ===============================================表：sys_post 种子数据=============================================
modelBuilder.Entity<SysPost>().HasData(new SysPost(){Id=Guid.Parse("f0bd38c2-f1de-4bd9-e2db-08da00a93622"),Code="dotnet_engineer",CreationTime=DateTime.Parse("2022/3/8 10:13:18"),CreatorUserId=null,LastModificationTime=DateTime.Parse("2022/3/8 10:13:18"),LastModifierUserId=null,Name="DotNet软件工程师",Number=5,Remarks=null,State=StateEnum.正常},new SysPost(){Id=Guid.Parse("0716b4b0-9a06-43e9-8ae8-82c74875f83e"),Code="se",CreationTime=DateTime.Parse("2021/5/27 20:26:35"),CreatorUserId=null,LastModificationTime=DateTime.Parse("2021/5/27 20:26:35"),LastModifierUserId=null,Name="项目经理",Number=2,Remarks=null,State=StateEnum.正常},new SysPost(){Id=Guid.Parse("96927c30-41d0-4ced-8e29-cbed35c90fb0"),Code="ceo",CreationTime=DateTime.Parse("2021/5/27 20:26:22"),CreatorUserId=null,LastModificationTime=DateTime.Parse("2021/5/27 20:26:22"),LastModifierUserId=null,Name="董事长",Number=1,Remarks=null,State=StateEnum.正常},new SysPost(){Id=Guid.Parse("e46af329-6d08-442c-9837-f22cff954411"),Code="user",CreationTime=DateTime.Parse("2021/5/27 20:26:52"),CreatorUserId=null,LastModificationTime=DateTime.Parse("2022/4/23 21:50:55"),LastModifierUserId=null,Name="普通员工",Number=4,Remarks=null,State=StateEnum.正常},new SysPost(){Id=Guid.Parse("f0c67537-8094-429a-b474-f54ac518609e"),Code="hr",CreationTime=DateTime.Parse("2021/5/27 20:26:44"),CreatorUserId=null,LastModificationTime=DateTime.Parse("2021/5/27 20:26:44"),LastModifierUserId=null,Name="人力资源",Number=3,Remarks=null,State=StateEnum.正常});

    }
}
