
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

  public static class MigrationsSysDictionaryModelBuilderExtensions
    {
        public static void Seed(this ModelBuilder modelBuilder)
        {
// ===============================================表：sys_dictionary 种子数据=============================================
modelBuilder.Entity<SysDictionary>().HasData(new SysDictionary(){Id=1,Code="news_type",CreationTime=DateTime.Parse("2021/7/25 22:31:30"),CreatorUserId=null,LastModificationTime=DateTime.Parse("2021/7/25 22:39:34"),LastModifierUserId=null,Name="资讯类别",ParentId=null,Sort=1,Value=null},new SysDictionary(){Id=2,Code="news_type_nan",CreationTime=DateTime.Parse("2021/7/25 22:38:49"),CreatorUserId=null,LastModificationTime=DateTime.Parse("2021/7/25 22:40:30"),LastModifierUserId=null,Name="男",ParentId=1,Sort=1,Value="1"},new SysDictionary(){Id=3,Code="news_type_nv",CreationTime=DateTime.Parse("2021/7/25 22:40:47"),CreatorUserId=null,LastModificationTime=DateTime.Parse("2022/7/6 21:55:30"),LastModifierUserId=null,Name="女",ParentId=1,Sort=2,Value="2"},new SysDictionary(){Id=4,Code="3",CreationTime=DateTime.Parse("2022/6/29 20:55:46"),CreatorUserId=null,LastModificationTime=DateTime.Parse("2022/6/29 20:55:46"),LastModifierUserId=null,Name="未知",ParentId=1,Sort=0,Value="3"});

    }
}
